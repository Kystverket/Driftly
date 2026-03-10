# AGENT.md

This repository manages Kubernetes applications using the **rendered manifest pattern**, with [CUE lang](https://cuelang.org/) as an abstraction layer for policy and boilerplate.

## Overview

App definitions are written in CUE, validated against schemas, and rendered to plain YAML manifests in `apps/_rendered/`. The rendered manifests are what ArgoCD/Kargo consumes.

All CUE dependencies are available locally — no external downloads needed.

## Repository Structure

```
main.go                 # CUE Go API renderer: traverses apps/ and writes to _rendered/
render_arm64            # Pre-built render binary (ARM64)
render_x86_64           # Pre-built render binary (x86_64)
apps/
  base.cue.template     # Template for new app definitions
  _rendered/            # Output: rendered YAML manifests (do not edit manually)
  <team>/               # CUE app definitions, one file per app
example/                # Example app definitions (minimal, full, job, escape-hatches)
schema/
  app.cue               # Main #App and #AppSchema definitions
  org.cue               # Global org config: teams, domain, registry, gateway
  deployment.cue        # Deployment resource schema
  httproute.cue         # HTTPRoute schema
  job.cue               # Job schema
  kargo.cue             # Kargo promotion resources
  securitybaseline.cue  # Pod/container security contexts
  crd/                  # Kubernetes CRDs imported as CUE types
    apps/v1, core/v1, autoscaling/v2, batch/v1
    cilium/v2, istio/v1, httproute/v1, kargo/v1alpha1, akv2k8s/v1
platform/               # Argo project and ApplicationSet definitions
justfile                # Common task recipes
```

## Common Commands

```bash
# Render all app manifests to apps/_rendered/
just render

# Render a specific directory
just render example

# Create a new app from template
just new-app <TEAM> <REPO> <NAME>

# Validate all CUE
just vet

# Run schema tests
just test

# Trim redundant CUE (removes fields that are already implied by schema)
just trim

# Tidy CUE and Go modules
just tidy

# Build the render binary for this system
just build

# Security scanning
just trivy          # Trivy config scan on apps/_rendered/
just kube-score     # kube-score on apps/_rendered/*.yaml
```

## App Configuration (`schema/app.cue`)

Apps are defined using `schema.#App`, which supports `dev`, `test`, and `prod` environments. Each environment is an `#AppSchema` block.

**Required fields:**

| Field            | Description                                                         |
| ---------------- | ------------------------------------------------------------------- |
| `config.team`    | Team name (must be one of the registered teams in `schema/org.cue`) |
| `config.service` | Git repository / service name (valid Kubernetes name)               |
| `config.app`     | App/image name (valid Kubernetes name)                              |
| `config.env`     | Set automatically by the `#App` wrapper (`dev`/`test`/`prod`)       |

**Key optional fields:**

| Field                                  | Default                           | Description                                                         |
| -------------------------------------- | --------------------------------- | ------------------------------------------------------------------- |
| `config.image`                         | `ghcr.io/<org>/<service>/<app>`   | Container image                                                     |
| `config.tag`                           | `latest` (or `replacedbyargocmp`) | Image tag                                                           |
| `config.port`                          | `8080`                            | Container port                                                      |
| `config.type`                          | `"deployment"`                    | `"deployment"`, `"job"`, or `"cronJob"`                             |
| `config.ingress`                       | —                                 | Hostname, path, entraID auth, CIDR whitelist                        |
| `config.replicas`                      | `{min:1, max:1}`                  | HPA config (min/max/cpuThreshold)                                   |
| `config.managedIdentity`               | `false`                           | Azure workload identity                                             |
| `config.instrumentation`               | —                                 | OpenTelemetry: `go`, `python`, `nodejs`, `dotnet`, `sdk`            |
| `config.promotion.strategy`            | `"Lexical"`                       | `"Lexical"`, `"SemVer"`, or `"Manual"`                              |
| `config.inboundAccess`                 | —                                 | Allow traffic from other cluster apps (creates CiliumNetworkPolicy) |
| `config.outboundAccess`                | —                                 | Allow egress to FQDNs or internet (creates CiliumNetworkPolicy)     |
| `config.envVars`                       | —                                 | Key/value environment variables                                     |
| `config.envFrom`                       | —                                 | Env vars from ConfigMap/Secret sources                              |
| `config.readiness` / `config.liveness` | —                                 | HTTP probe paths                                                    |

## Adding a New App

1. **Create the CUE file:**

   ```bash
   just new-app <team> <service> <appname>
   # Creates apps/<team>/<service>-<appname>.cue
   ```

2. **Edit the generated file** — see `example/minimal.cue` for the simplest case, `example/full.cue` for all features.

3. **Validate:**

   ```bash
   just vet
   ```

4. **Render:**

   ```bash
   just render
   ```

5. **Commit the rendered manifests** — both the `.cue` source and `apps/_rendered/` output go in the same commit.

## Escape Hatches

For Kubernetes resources not covered by the schema, use the escape hatch pattern from `example/escape-hatches.cue`:

- **Override a schema field:** Add the field directly to the env block (e.g. `deployment: spec: template: spec: containers: [{imagePullPolicy: "Always"}]`)
- **Raw YAML resource:** Use `yaml.Unmarshal(_data)` with a raw YAML string
- **Inline CUE resource:** Add any struct with `apiVersion` and `kind` fields directly — the renderer picks up any value that looks like a Kubernetes resource

## Registered Teams

Defined in `schema/org.cue`: `enav`, `datavisualisering`, `dataplattform`, `fyr`, `platform`

To add a new team, add an entry to the `teams` list in `schema/org.cue`.

## How Rendering Works

`main.go` (or the pre-built `render_<arch>` binary):

1. Walks all `.cue` files in the target directory
2. Finds top-level values containing a `config` field (`#AppSchema`)
3. Collects all sibling values that have `apiVersion` (Kubernetes resources)
4. Writes each resource as `<kind>-<name>.yaml` under `apps/_rendered/<team>/<service>/<env>/<app>/`

The output directory is always cleared before rendering. Never edit files in `_rendered/` manually.

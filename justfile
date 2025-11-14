[private]
default:
  just --list -u

# Create a new application
[working-directory: "apps"]
new-app NAME TEAM REPO:
  cp base.cue.template {{NAME}}.cue
  sed -i  's/APP/{{NAME}}/g' {{NAME}}.cue
  sed -i  's/TEAM/{{TEAM}}/g' {{NAME}}.cue
  sed -i  's/SERVICE/{{REPO}}/g' {{NAME}}.cue
  sed -i  's/#{{NAME}}/#{{replace(NAME, "-", "_")}}/g' {{NAME}}.cue


[working-directory: "platform"]
[private]
tidy-platform:
  cue mod tidy
  go mod tidy

# Tidy go and cue modules
tidy:
  cue mod tidy
  go mod tidy
  @just tidy-platform

# Render argo project and applicationsets (using render_tool.cue)
[working-directory: "platform"]
render-platform:
  cue cmd render

# Render gitops manifests for applications
render DIR="apps":
  ## Can also run main.go directly
  #go run main.go --dir={{DIR}}
  @./render --dir={{DIR}}

# Dump yaml resources to terminal
export DIR="apps": 
  @cue export --out yaml ./{{DIR}}

# Build the render binary
build:
  go build -o render

# Remove cue code using cue trim
trim:
  cue trim -s ./...

# Run schema schema tests
test:
  cue export schema/test/test.cue --out yaml
  cue vet schema/test/test.cue

# Validate all cue folders
vet:
  cue vet ./example
  cue vet ./apps
  cue vet ./schema
  cue vet ./platform

# Scan for config errors using trivy
trivy PATH="apps/_rendered":
  trivy config  {{PATH}}

# Scan for config errors using kube-score
kube-score PATH="apps/_rendered":
  kube-score score {{PATH}}/*.yaml

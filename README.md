# Driftly: CUE powered gitops

You have set up every 3rd party helmchart and cloud dependencies, your cluster runs like a dream and then the day comes;

```
That's cool, but how can i get my app in there?
```

Developers don't want to reference kubernetes docs or specifications, so we need application abstractions.
With NAVs [app manifest](https://doc.nais.io/workloads/application/reference/application-spec/)
being a great example (which we have used as inspiration).

CUEs unification model has shown to be a great fit for this, but for a deeper dive see [Why CUE](#why-cue-and-why-now)

## Getting started

Use whatever you want, here's brew

```
brew install cue just go trivy kube-score
```

For LSP see [cue wiki](https://github.com/cue-lang/cue/wiki/LSP:-Getting-started)
or just use the [official vscode extension](https://marketplace.visualstudio.com/items?itemName=cuelangorg.vscode-cue)

:bulb: VSCode might not recognize `cue` in your `PATH`. To make this work, you can hard code the path to `cue` in the extension settings (clicking the small cog, and pasting the full path to the `cue` executable, instead of just `cue`).

To see available commands, run:

```
just
```

To render example manifests:

```
just render example
```

To see available configuration:

- Select go to definition on the `#AppSchema` under any `apps/*.cue` file
- or open `schema/app.cue`

## Organization settings

Ideally, modifying `schema/org.cue` should get most things working for your organization.

## Adding more teams to the platform

<table>
<tr>
<th>platform/apps.cue</th>
<th>schema/app.cue</th>
</tr>
<tr>
<td>
<pre>

```cue
Apps: TEAM: #Apps & {
  _config: {
    team: "TEAM"
    roles: dev: name: "ENTRA GROUP NAME"
    roles: dev: id:   "ENTRA GROUP ID"
    roles: admin: name: "ENTRA GROUP NAME"
    roles: admin: id:   "ENTRA GROUP ID"
  }
}
```

</pre>
</td>
<td>

```cue
#AppSchema: {
 config: {
  team!: "FOO" | "BAR" | "TEAM"
```

</td>
</tr>
</table>

## Creating a new app

```
just new-app NAME TEAM REPO
just render
```

Inspect new files under `apps/_rendered`

## Adding a CRD

Thanks to [timoni](https://timoni.sh/) for laying the groundwork for native CRD support,
importing any kubernetes CRD is as easy as:

```
kubectl get crd ciliumnetworkpolicies.cilium.io -oyaml | cue get crd yaml: -
```

This will create a `v1` folder or similar, and you are free to put it
anywhere. We have a dedicated `crd` folder for this.

## Tips

CUE can return some pretty incredible error messages. We recommend to
enable auto format on save in your editor, and together with autocomplete,
use it as a guiding line for when you have done something illegal.

Any time the auto format does not kick in, CUE will not render.
Work in small increments, and render _often_ (abbr r "just render" | alias r="just render"),
and `git diff` the rendered output against what you are trying to achieve.

## Rendered manifest pattern

CUE will unify all output into one yaml, and needs to be dumped into a
folder structure which argo ApplicationSets can pick up. We have tried to
keep rendering logic as slim as possible;

`main.go`:

- Find all cue files under `apps/`
- Walk the cue structure until a `config` section is found
  - Use it to build a path `apps/_rendered/{team}/{service}/{env}/{app}`
- Render any other objects containing `apiVersion` field to that path

`platform/render_tool.cue`:

For more static configuration, using the native cue tool layer is
good enough, even though looping in cue like this does not feel very elegant.

## Current limitations

- Unification model is hard to grasp
- Little in terms of out-of the box render solutions. Though it is relatively easy to make your own
- Error messages can be extremely verbose
- keep it simple and use simple primitives, otherwise the CUE
  unification model might work against you.
- Rendered manifest pattern does not play well with kargo (see opinonated setup)
- CUE openAPI / docs generation should work, but has bugs with this setup
- With great power; Escape hatches lets you specify any yaml outside the schema, so you might still need OPA / Kyverno to catch `allowPrivilegeEscalation: true` type issues. Or some CUE way to run validation on dynamic content.

## Opinionated setup

While most of this will work on any k8s cluster, there are some assumptions:

- We use azure istio addon for API gateway, and also istio authorizationpolicy for ingerss traffic
- We use clilium for traffic encryption and l7 network policies for cluster egress and in-cluster traffic
  - (but we want to use cilium for API gateway as well)
- We use [azv2k8s](https://github.com/SparebankenVest/azure-key-vault-to-kubernetes)
  to sync platform related secrets. (e.g imagepullsecret)
- We use Kargo for environment promotion, and it is dependant on (TODO: make examples):
  - Kargo ClusterPromotionTask which posts tags to a custom image pusher
  - Custom image pusher (e.g go app) which pushes these tags to a separate repository,
    and triggers hard-refresh on the associated argo application to invalidate cache
  - Argo CMP plugin (bash script) which fetches tags from the separate repository and repleces references of `replacedbyargocmp` with the tag
- We use entraID roles in both argo and kargo RBAC, but any role ID provided by dex should work.
- Github

## Why CUE and why now

The configuration management space has evolved a lot recently, and [CUE](https://cuelang.org/)
has a lot of overlap with some other emerging tools like;

- [pkl](https://pkl-lang.org/main/current/introduction/comparison.html) (if its good enough for apple, its probably good enough for you)
- [kcl](https://www.kcl-lang.io/) (uncertain maintainer situation)
- [nixidy](https://github.com/arnarg/nixidy) (Really cool, but nix is still not for most mortals)

But with the [launch of CUE labs](https://cue.dev/blog/announcing-cue-labs/)
and with Kelsey Hightower as CUE labs advisor, CUE core is promised to be
always open source, and from our point of view, also feature complete.
Any further improvemets will only make our days even better.

Some (maybe not so) hot takes about other tools:  
Helm - Raw text templating on top of yaml is inherently a bad idea  
Kustomize - Layering based model (where did this value come from?)  
Kro - Throw more yaml at it to see if that solves the problem  
CDK8s - Great if every user and maintainer are competent developers, but too flexible for config management

In our opinion, a good configuration management tool should:

- Be opinionated through heavy defaulting
- Have strong type safety and constraints, reducing dependency on policy engines (shift left)
- Have native kubernetes CRD integration (you can still push wrong values, but never wrong schemas)
- Have good tooling; LSP, auto format, and more
- Support Good workflows around refactoring; configuration should stay dynamic to changing requirements
- Ideally not be a kubernetes only tool, but should speak
  [any schema](https://cue.dev/getting-started/schema-library/) fluently
- Support [escape hatches](./example/escape-hatches.cue) for when (not if) your defaults are wrong

What CUE lacks now are more real world usage examples,
and this repo aims to provide just that.
Examples like [timoni](https://timoni.sh/), [holos](https://holos.run/)
and [cuekit](https://github.com/slewiskelly/cuek8s)
are great, but CUE is hard enough to grasp on its own,
so here the focus is on keeping tooling lightweight and allow native
CUE commands to be run in any directory.

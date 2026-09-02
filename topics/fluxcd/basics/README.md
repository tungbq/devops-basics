# Basics of FluxCD

## Demo

Run `./fluxcd_sync_demo.sh` to spin up (or reuse) a local `kind` cluster, install Flux's controllers, and point Flux at a real public Git repo ([stefanprodan/podinfo](https://github.com/stefanprodan/podinfo)) — no GitHub token and no full `flux bootstrap` needed for this demo. You'll see Flux fetch the repo, apply its Kubernetes manifests, and bring up a running deployment, purely from a Git source it polls on an interval.

### Requirements

- `docker`
- `kind` (the script creates a `fluxcd-demo` cluster if one doesn't already exist — https://kind.sigs.k8s.io/docs/user/quick-start/#installation)
- `kubectl`
- `flux` CLI (see the [installation section](../README.md#3-installation) in the parent topic)

### Cleanup

The script prints the teardown commands at the end rather than running them automatically, so you can poke around the live cluster first:

```bash
flux delete kustomization podinfo --silent
flux delete source git podinfo --silent
kind delete cluster --name fluxcd-demo
```

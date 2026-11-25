# Basics of Crossplane

## Demo

Run `./crossplane_kubernetes_demo.sh` to spin up (or reuse) a local `kind` cluster, install Crossplane with Helm, install `provider-kubernetes`, and create a managed resource (`Object`) that makes Crossplane create a ConfigMap. No cloud account or credentials are needed.

### Requirements

- `docker`
- `kind` (the script creates a `crossplane-demo` cluster if one doesn't already exist — https://kind.sigs.k8s.io/docs/user/quick-start/#installation)
- `kubectl`
- `helm`

> Note: for simplicity the demo grants the provider `cluster-admin` on the throwaway local cluster. Don't do this in a real cluster.

### Cleanup

The script prints the teardown command at the end rather than running it automatically:

```bash
kind delete cluster --name crossplane-demo
```

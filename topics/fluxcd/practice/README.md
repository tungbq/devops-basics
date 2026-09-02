## FluxCD practice

1. **Fork-and-sync**: fork [stefanprodan/podinfo](https://github.com/stefanprodan/podinfo), point your `GitRepository` source at your fork instead of the upstream repo (`flux create source git podinfo --url=https://github.com/<you>/podinfo ...`), then edit a value under `kustomize/` (e.g. `replicaCount` via a `kustomization.yaml` patch) and push. Watch `flux get kustomizations --watch` pick up the new revision within the `--interval` window, without ever running `kubectl apply` yourself.

2. **Prune in action**: with the demo running, delete one of the manifests from your forked repo's `kustomize/` path and push. Run `flux reconcile kustomization podinfo` and confirm with `kubectl get all -n default` that Flux removed the corresponding resource from the cluster — this is what `--prune=true` buys you over a one-shot `kubectl apply -k`.

3. **Break it, then read the logs**: point a `GitRepository` at a branch or path that doesn't exist (`--branch=does-not-exist`) and observe `flux get sources git` report `Ready: False`. Use `flux logs --level=error` to find the actual error, then fix the source and confirm it recovers on its own — no manual intervention beyond fixing the config.

4. **ArgoCD side-by-side**: if you've done the [`argocd`](../../argocd/) topic, compare the two mental models — ArgoCD's `Application` CRD couples "what to sync" and "where from" in one object with a UI on top, while Flux splits "where from" (`GitRepository`/`HelmRepository`/`OCIRepository`) from "what to do with it" (`Kustomization`/`HelmRelease`) as separate, composable CRDs. Write down one scenario where that separation is genuinely useful (hint: one source, multiple environments).

- Official Flux GitOps guides: https://fluxcd.io/flux/guides/
- Flux vs ArgoCD FAQ: https://fluxcd.io/docs/faq/#flux-vs-argo-cd

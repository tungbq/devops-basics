## 1. What is FluxCD?

- https://fluxcd.io/docs/

### Overview

Flux is a CNCF-graduated, GitOps continuous delivery tool for Kubernetes. It keeps a cluster's state in sync with a source of truth stored in Git (or an OCI artifact / Helm repository) — you declare what you want deployed, Flux reconciles the cluster to match, on a schedule and automatically, with no `kubectl apply` in your deploy pipeline.

Flux is built as a set of specialized Kubernetes controllers, each with its own CRDs:

- **source-controller** — fetches artifacts (Git repos, Helm repos, OCI repos, S3 buckets) and makes them available as revisions
- **kustomize-controller** — applies Kustomize overlays from a source to the cluster, and prunes resources removed from Git
- **helm-controller** — reconciles `HelmRelease` resources by installing/upgrading Helm charts from a source
- **notification-controller** — sends events to Slack, Discord, webhooks, etc. and receives inbound webhooks to trigger reconciliation

This is the same category as ArgoCD (see the [`argocd`](../argocd/) topic) — both are GitOps engines for Kubernetes — but Flux is CLI/CRD-first (no bundled UI by default) and composes independent controllers you can install individually, rather than one monolithic application.

### FluxCD Architecture

```
 Git repo / Helm repo / OCI repo / S3 bucket
             │
             │ polls on --interval
             ▼
     ┌───────────────────┐
     │  source-controller │  fetches + verifies, exposes as a
     │                    │  versioned "Artifact"
     └─────────┬──────────┘
               │ Artifact (revision)
     ┌─────────┴──────────┐        ┌──────────────────────┐
     │ kustomize-controller│        │   helm-controller     │
     │  applies Kustomize   │       │  installs/upgrades    │
     │  overlays, prunes    │       │  HelmReleases         │
     │  removed resources   │       │                       │
     └─────────┬────────────┘       └───────────┬───────────┘
               │                                 │
               └───────────────┬─────────────────┘
                                ▼
                        Kubernetes cluster
                                │
                                ▼
                  ┌──────────────────────────┐
                  │  notification-controller  │  events out (Slack/
                  │                           │  webhook), triggers in
                  └──────────────────────────┘
```

### Official Documentation

- https://fluxcd.io/docs/
- GitHub: https://github.com/fluxcd/flux2

## 2. Prerequisites

- A Kubernetes cluster (this topic uses a local [`kind`](../k8s/) cluster — no cloud account needed)
- `kubectl` configured against that cluster
- Familiarity with the [`git`](../git/) and [`k8s`](../k8s/) topics helps, but isn't required

## 3. Installation

### How to install the Flux CLI?

```bash
# macOS / Linux
curl -s https://fluxcd.io/install.sh | sudo bash

# macOS via Homebrew
brew install fluxcd/tap/flux

# Verify
flux version --client
```

- Official install guide: https://fluxcd.io/flux/installation/

### Check your cluster is ready for Flux

```bash
flux check --pre
```

## 4. Basics of FluxCD

### Getting started with FluxCD

- To get started visit [`basics/`](./basics/) — a runnable script that installs Flux's controllers on a local `kind` cluster and syncs a real public repo ([stefanprodan/podinfo](https://github.com/stefanprodan/podinfo)) without needing a GitHub token or full `flux bootstrap`.

### FluxCD Hello World

```bash
# Install Flux's controllers (source, kustomize, helm, notification)
flux install

# Point Flux at a Git repo — no PAT needed for a public repo
flux create source git podinfo \
  --url=https://github.com/stefanprodan/podinfo \
  --branch=master \
  --interval=1m

# Tell Flux to apply a path from that repo, and keep the cluster in sync
flux create kustomization podinfo \
  --target-namespace=default \
  --source=podinfo \
  --path="./kustomize" \
  --prune=true \
  --interval=10m

# Watch it reconcile
flux get sources git
flux get kustomizations
kubectl get deployments -n default
```

## 5. Beyond the Basics

### `flux bootstrap` — the production pattern

The commands above (`flux create source git` + `flux create kustomization`) are the fastest way to see Flux work, but production setups almost always use `flux bootstrap`, which additionally:

- commits Flux's own manifests into your Git repo (so Flux manages itself via GitOps too)
- sets up a deploy key / GitHub App so Flux can push status commits back
- is idempotent — safe to re-run against an existing cluster

```bash
export GITHUB_TOKEN=<your-pat>
flux bootstrap github \
  --owner=<your-github-username> \
  --repository=<your-fleet-repo> \
  --branch=main \
  --path=clusters/my-cluster \
  --personal
```

### Multi-tenancy and multiple environments

Flux's `Kustomization` and `GitRepository` are namespaced CRDs, so a common pattern is one `flux-system` per cluster with per-team or per-environment `Kustomization`s pointing at different paths (`clusters/staging`, `clusters/production`) of the same monorepo — see the [official multi-tenancy guide](https://fluxcd.io/flux/installation/configuration/multitenancy/).

### Automating image updates

Flux's [image automation controllers](https://fluxcd.io/flux/components/image/) can watch a container registry and open a commit against your Git repo whenever a new image tag matching a policy is pushed — closing the loop from CI (build+push image) to CD (Flux picks it up) without a separate deploy step.

### Hands-On Examples

- See: [practice/](./practice/)

## 6. More

### FluxCD Cheatsheet

```bash
# Sources
flux get sources git                    # list Git sources and their sync status
flux reconcile source git podinfo       # force an immediate re-sync

# Kustomizations
flux get kustomizations                 # list Kustomizations and their apply status
flux reconcile kustomization podinfo    # force an immediate re-apply
flux suspend kustomization podinfo      # pause reconciliation
flux resume kustomization podinfo       # resume reconciliation

# Everything at once
flux get all -A

# Logs (useful when a Kustomization is stuck)
flux logs --follow --tail=50

# Tear down
flux delete kustomization podinfo
flux delete source git podinfo
flux uninstall --namespace=flux-system
```

### Recommended Resources

- [Flux Documentation](https://fluxcd.io/docs/)
- [Flux GitHub](https://github.com/fluxcd/flux2)
- [Flux vs ArgoCD comparison (official FAQ)](https://fluxcd.io/docs/faq/#flux-vs-argo-cd)

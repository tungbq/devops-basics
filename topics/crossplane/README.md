## 1. What is Crossplane?

- https://docs.crossplane.io/

### Overview

Crossplane is a CNCF project that extends Kubernetes so you can provision and manage cloud infrastructure (databases, networks, buckets, ...) the same way you manage Pods and Deployments: with declarative YAML, `kubectl`, and a control loop that continuously reconciles reality to match what you declared.

Core ideas:

- **Provider** — a package that installs CRDs and a controller for an external system (AWS, Azure, GCP, Kubernetes itself, Helm, ...).
- **Managed Resource (MR)** — a Kubernetes object that represents one real external resource (e.g. an S3 bucket). Created by a Provider.
- **Composite Resource Definition (XRD)** — defines your own platform API (e.g. `XDatabase`) as a new CRD.
- **Composition** — a template describing which managed resources are created when someone requests your XRD.
- **Composition Function** — a small program (e.g. `function-patch-and-transform`) that renders the resources for a Composition.

Platform teams publish simple APIs (XRDs + Compositions); application teams consume them without needing to know the cloud details. This is why Crossplane is a common building block of platform engineering (see also the [`argocd`](../argocd/) and [`fluxcd`](../fluxcd/) topics, which can deliver Crossplane YAML from Git).

### Crossplane Architecture

```
  kubectl / GitOps (ArgoCD, Flux)
             │  applies YAML
             ▼
   ┌──────────────────────────┐
   │  Kubernetes API server    │
   │  Claim / XR  (your API)   │
   └────────────┬─────────────┘
                │ Composition + Functions render...
                ▼
   ┌──────────────────────────┐
   │  Managed Resources        │  (Bucket, RDSInstance, Object, ...)
   └────────────┬─────────────┘
                │ Provider controllers reconcile
                ▼
     Cloud APIs / external systems
```

### Official Documentation

- https://docs.crossplane.io/
- GitHub: https://github.com/crossplane/crossplane

## 2. Prerequisites

- A Kubernetes cluster (this topic uses a local [`kind`](../k8s/) cluster — no cloud account needed)
- `kubectl` and `helm`
- Familiarity with the [`k8s`](../k8s/) topic helps, but isn't required

## 3. Installation

### How to install Crossplane?

```bash
helm repo add crossplane-stable https://charts.crossplane.io/stable
helm repo update

helm install crossplane crossplane-stable/crossplane \
  --namespace crossplane-system --create-namespace

# Verify
kubectl get pods -n crossplane-system
```

- Official install guide: https://docs.crossplane.io/latest/software/install/

## 4. Basics of Crossplane

### Install a Provider

```yaml
apiVersion: pkg.crossplane.io/v1
kind: Provider
metadata:
  name: provider-kubernetes
spec:
  package: xpkg.upbound.io/crossplane-contrib/provider-kubernetes:v0.15.0
```

```bash
kubectl get providers
```

Wait until `INSTALLED` and `HEALTHY` are `True`.

### Create a Managed Resource

With `provider-kubernetes`, an `Object` managed resource wraps any Kubernetes manifest. This is a handy way to learn Crossplane without cloud credentials:

```yaml
apiVersion: kubernetes.crossplane.io/v1alpha2
kind: Object
metadata:
  name: hello-config
spec:
  providerConfigRef:
    name: default
  forProvider:
    manifest:
      apiVersion: v1
      kind: ConfigMap
      metadata:
        namespace: default
        name: hello-from-crossplane
      data:
        greeting: hello
```

```bash
kubectl get objects
kubectl get configmap hello-from-crossplane
```

Delete the `Object` and Crossplane deletes the ConfigMap too; edit it and Crossplane reconciles the change. Run the full walkthrough with the [basics demo](./basics/).

## 5. Beyond the Basics

### XRDs and Compositions

A Composition turns one high-level request into several managed resources. Sketch of the flow:

1. Install a composition function, e.g. `function-patch-and-transform`.
2. Define an XRD (your new API kind and its schema).
3. Write a Composition that maps the XRD fields onto managed resources.
4. Users create an instance of your API; Crossplane creates and manages everything underneath.

Guide: https://docs.crossplane.io/latest/composition/compositions/

### Cloud providers

For real infrastructure, install a cloud provider (for example the AWS, Azure or GCP provider families from the Upbound Marketplace) and configure a `ProviderConfig` with credentials. Prefer short-lived / workload identity credentials over long-lived keys.

### Useful commands

```bash
kubectl get managed                      # all managed resources
kubectl describe <kind> <name>           # conditions: Ready / Synced
kubectl get providers,functions          # installed packages
kubectl get composite                    # composite resources
```

## 6. More

- [Crossplane docs](https://docs.crossplane.io/)
- [Upbound Marketplace](https://marketplace.upbound.io/) — providers and configurations
- [Crossplane contrib providers](https://github.com/crossplane-contrib)

#!/bin/bash
# Crossplane Demo - installs Crossplane on a local kind cluster, installs
# provider-kubernetes and provisions a managed resource (a ConfigMap) with it.
# No cloud account required.

set -e

CLUSTER_NAME="crossplane-demo"

echo "==> Tool versions:"
kubectl version --client
helm version --short

echo ""
echo "=============================="
echo "1. Ensuring a local cluster exists"
echo "=============================="
if kubectl config get-contexts "kind-${CLUSTER_NAME}" >/dev/null 2>&1; then
  echo "Reusing existing kind cluster: ${CLUSTER_NAME}"
  kubectl config use-context "kind-${CLUSTER_NAME}"
else
  echo "Creating kind cluster: ${CLUSTER_NAME}"
  kind create cluster --name "${CLUSTER_NAME}"
fi

echo ""
echo "=============================="
echo "2. Installing Crossplane"
echo "=============================="
helm repo add crossplane-stable https://charts.crossplane.io/stable
helm repo update
helm upgrade --install crossplane crossplane-stable/crossplane \
  --namespace crossplane-system --create-namespace --wait

echo ""
echo "=============================="
echo "3. Installing provider-kubernetes"
echo "=============================="
# A DeploymentRuntimeConfig gives the provider a predictable ServiceAccount name
# so we can grant it permissions below.
kubectl apply -f - <<YAML
apiVersion: pkg.crossplane.io/v1beta1
kind: DeploymentRuntimeConfig
metadata:
  name: provider-kubernetes
spec:
  serviceAccountTemplate:
    metadata:
      name: provider-kubernetes
---
apiVersion: pkg.crossplane.io/v1
kind: Provider
metadata:
  name: provider-kubernetes
spec:
  package: xpkg.upbound.io/crossplane-contrib/provider-kubernetes:v0.15.0
  runtimeConfigRef:
    name: provider-kubernetes
YAML

kubectl wait --for=condition=Healthy provider/provider-kubernetes --timeout=300s

echo ""
echo "=============================="
echo "4. Configuring the provider (demo only: cluster-admin on a local cluster)"
echo "=============================="
kubectl create clusterrolebinding provider-kubernetes-admin \
  --clusterrole=cluster-admin \
  --serviceaccount=crossplane-system:provider-kubernetes \
  --dry-run=client -o yaml | kubectl apply -f -

kubectl apply -f - <<YAML
apiVersion: kubernetes.crossplane.io/v1alpha1
kind: ProviderConfig
metadata:
  name: default
spec:
  credentials:
    source: InjectedIdentity
YAML

echo ""
echo "=============================="
echo "5. Creating a managed resource"
echo "=============================="
kubectl apply -f - <<YAML
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
YAML

kubectl wait --for=condition=Ready object/hello-config --timeout=120s

echo ""
kubectl get objects
kubectl get configmap hello-from-crossplane -o yaml

echo ""
echo "==> Done! Crossplane created the ConfigMap from the 'Object' managed resource."
echo "==> Tip: 'kubectl delete object hello-config' removes the ConfigMap too."
echo ""
echo "==> Cleanup:"
echo "    kind delete cluster --name ${CLUSTER_NAME}"

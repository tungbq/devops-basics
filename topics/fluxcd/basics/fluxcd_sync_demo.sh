#!/bin/bash
# FluxCD Sync Demo - installs Flux on a local kind cluster and syncs a real
# public repo (stefanprodan/podinfo) via GitRepository + Kustomization,
# with no GitHub token and no full `flux bootstrap` required.

set -e

CLUSTER_NAME="fluxcd-demo"

echo "==> flux version:"
flux version --client

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
echo "2. Checking cluster prerequisites"
echo "=============================="
flux check --pre

echo ""
echo "=============================="
echo "3. Installing Flux controllers"
echo "=============================="
flux install

echo ""
echo "=============================="
echo "4. Pointing Flux at a public Git repo"
echo "=============================="
flux create source git podinfo \
  --url=https://github.com/stefanprodan/podinfo \
  --branch=master \
  --interval=1m

echo ""
echo "=============================="
echo "5. Telling Flux to apply and keep this path in sync"
echo "=============================="
flux create kustomization podinfo \
  --target-namespace=default \
  --source=podinfo \
  --path="./kustomize" \
  --prune=true \
  --interval=10m

echo ""
echo "=============================="
echo "6. Watching it reconcile"
echo "=============================="
flux get sources git
flux get kustomizations

echo ""
echo "Waiting for the synced deployment to become available..."
kubectl wait --for=condition=available --timeout=120s deployment/podinfo -n default

kubectl get deployments -n default
kubectl get pods -n default

echo ""
echo "==> Done! Flux fetched podinfo from Git and reconciled it onto the cluster."
echo "==> Tip: edit anything under ./kustomize in a fork of the repo, push, and"
echo "    wait up to the --interval — Flux picks the change up automatically."
echo ""
echo "==> Cleanup:"
echo "    flux delete kustomization podinfo --silent"
echo "    flux delete source git podinfo --silent"
echo "    kind delete cluster --name ${CLUSTER_NAME}"

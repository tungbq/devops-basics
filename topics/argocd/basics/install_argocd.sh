#!/bin/bash

install_argocd_cli() {
  pushd /tmp
  curl -sSL -o argocd-linux-amd64 https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
  ls -la
  sudo install -m 555 argocd-linux-amd64 /usr/local/bin/argocd
  rm argocd-linux-amd64
  popd
}
# Deploy argocd
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# Check pods
kubectl get pods -n argocd

# Check service
kubectl get svc -n argocd

# Install the CLI
install_argocd_cli

# Change the argocd-server service type to LoadBalancer
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'

# Port forwarding
kubectl port-forward svc/argocd-server -n argocd 8080:443

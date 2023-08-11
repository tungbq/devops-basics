console_log() {
  echo ">>> [Kubernetes] $1"
}

console_log "Welcome to Kubernetes!"

console_log "Deploying your first app on Kubernetes"
kubectl apply -f hello-world/nginx-deployment.yaml

console_log "Check deployment rollout status"
kubectl rollout status deployment/nginx-deployment

console_log "Check deployemnt"
kubectl get deployments

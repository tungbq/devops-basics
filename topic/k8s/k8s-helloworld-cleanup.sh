console_log() {
  echo ">>> [Kubernetes] $1"
}

console_log "Welcome to Kubernetes!"
kubectl delete -f hello-world/nginx-deployment.yaml
kubectl delete -f hello-world/nginx-service.yaml

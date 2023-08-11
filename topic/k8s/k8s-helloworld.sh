console_log() {
  echo ">>> [Kubernetes] $1"
}

./k8s-helloworld-cleanup.sh

console_log "Welcome to Kubernetes!"

console_log "Deploying your first app on Kubernetes"
kubectl apply -f hello-world/nginx-deployment.yaml

console_log "Check deployment rollout status"
kubectl rollout status deployment/nginx-deployment

console_log "Check deployemnt"
kubectl get deployments

console_log "Check pod"
kubectl get pods

console_log "Apply service"
kubectl apply -f hello-world/nginx-service.yaml

console_log "Check services"
kubectl get services

kubectl port-forward service/nginx-service 9080:8081 &
sleep 10
curl localhost:9080

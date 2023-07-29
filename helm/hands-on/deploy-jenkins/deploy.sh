# Init and configure Helm
echo "Adding Jenkins repo and get latest updates"
helm repo add jenkinsci https://charts.jenkins.io
helm repo update

# Create Persistent Volume
echo "Create the volume"
kubectl apply -f jenkins-volume.yaml
echo "Check the volume"
kubectl get pv

# Create a service account
kubectl apply -f jenkins-sa.yaml

# Update the values manually: Done. TODO: Automate this step

# Deploy
echo "Start deploying..."
chart="jenkinsci/jenkins"
helm install jenkins -n jenkins -f jenkins-values.yaml $chart

# Check deployment
echo "Check deployment"
kubectl get pods -n jenkins

# Get metadata
echo "Get 'admin' password"
jsonpath="{.data.jenkins-admin-password}"
secret=$(kubectl get secret -n jenkins jenkins -o jsonpath=$jsonpath)
echo $(echo $secret | base64 --decode)

# Portforward
echo "Port forwarding..."
kubectl port-forward service/jenkins 8090:8080 -n jenkins &

# login URL
login_url="http://localhost:8090/login"
curl $login_url
echo $login_url

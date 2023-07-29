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



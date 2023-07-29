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


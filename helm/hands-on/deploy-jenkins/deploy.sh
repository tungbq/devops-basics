# Init and configure Helm
echo "Adding Jenkins repo and get latest updates"
helm repo add jenkinsci https://charts.jenkins.io
helm repo update

# Create Persistent Volume

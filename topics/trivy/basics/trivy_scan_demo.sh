#!/bin/bash
# Trivy Scan Demo - demonstrates image and filesystem scanning

set -e

echo "==> Trivy version:"
trivy --version

echo ""
echo "=============================="
echo "1. Scanning a container image"
echo "=============================="
echo "Scanning nginx:1.24 for HIGH and CRITICAL vulnerabilities..."
trivy image --severity HIGH,CRITICAL --no-progress nginx:1.24

echo ""
echo "================================"
echo "2. Scanning a filesystem/IaC"
echo "================================"
TEMPDIR=$(mktemp -d)
trap 'rm -rf "$TEMPDIR"' EXIT

# Create a sample Dockerfile with a known issue
cat > "${TEMPDIR}/Dockerfile" <<'EOF'
FROM ubuntu:18.04
RUN apt-get update && apt-get install -y curl
USER root
EOF

# Create a sample Kubernetes manifest
cat > "${TEMPDIR}/deployment.yaml" <<'EOF'
apiVersion: apps/v1
kind: Deployment
metadata:
  name: insecure-app
spec:
  replicas: 1
  selector:
    matchLabels:
      app: insecure
  template:
    metadata:
      labels:
        app: insecure
    spec:
      containers:
      - name: app
        image: nginx:latest
        securityContext:
          privileged: true
          runAsRoot: true
EOF

echo "Scanning IaC files for misconfigurations..."
trivy config --no-progress "${TEMPDIR}/"

echo ""
echo "==================================="
echo "3. Scanning for secrets in a repo"
echo "==================================="
# Create a file with a fake secret pattern for demo
cat > "${TEMPDIR}/config.env" <<'EOF'
DATABASE_URL=postgres://user:password@localhost/db
API_KEY=AKIAIOSFODNN7EXAMPLE
EOF

echo "Scanning for embedded secrets..."
trivy fs --scanners secret --no-progress "${TEMPDIR}/" || true

echo ""
echo "==> Done! See the findings above."
echo "==> Tip: Run 'trivy image --help' to explore more options."

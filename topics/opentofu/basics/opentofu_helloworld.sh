#!/bin/bash
# OpenTofu Hello World - creates a local file resource to demonstrate the basic workflow

set -e

WORKDIR=$(mktemp -d)
trap 'rm -rf "$WORKDIR"' EXIT

echo "==> Creating OpenTofu configuration in ${WORKDIR}..."
cat > "${WORKDIR}/main.tf" <<'EOF'
terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4"
    }
  }
}

resource "local_file" "hello" {
  content  = "Hello from OpenTofu! Infrastructure as Code made simple."
  filename = "${path.module}/hello.txt"
}

output "message" {
  value = local_file.hello.content
}
EOF

cd "${WORKDIR}"

echo "==> OpenTofu version:"
tofu version

echo ""
echo "==> Initializing OpenTofu..."
tofu init

echo ""
echo "==> Planning infrastructure changes..."
tofu plan

echo ""
echo "==> Applying configuration..."
tofu apply -auto-approve

echo ""
echo "==> Showing outputs..."
tofu output

echo ""
echo "==> File created:"
cat hello.txt

echo ""
echo "==> Current state:"
tofu state list

echo ""
echo "==> Destroying resources..."
tofu destroy -auto-approve

echo ""
echo "==> Done! OpenTofu Hello World complete."

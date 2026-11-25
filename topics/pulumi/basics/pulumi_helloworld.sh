#!/bin/bash
# Pulumi Hello World - deploys a minimal program with a local backend (no cloud account needed)

set -e

WORKDIR=$(mktemp -d)
trap 'rm -rf "$WORKDIR"' EXIT

# Keep state inside the temp dir so your own Pulumi login is untouched
export PULUMI_BACKEND_URL="file://${WORKDIR}/state"
# The local backend encrypts secrets with a passphrase; an empty one is fine for a demo
export PULUMI_CONFIG_PASSPHRASE=""
export PULUMI_SKIP_UPDATE_CHECK=true

mkdir -p "${WORKDIR}/state" "${WORKDIR}/project"

echo "==> Creating Pulumi project in ${WORKDIR}/project..."
cat > "${WORKDIR}/project/Pulumi.yaml" <<'YAML'
name: hello-pulumi
runtime: yaml
description: Pulumi Hello World using the random provider

resources:
  pet:
    type: random:RandomPet
    properties:
      length: 2

outputs:
  message: Hello from Pulumi! Meet ${pet.id}.
YAML

cd "${WORKDIR}/project"

echo "==> Pulumi version:"
pulumi version

echo ""
echo "==> Creating stack..."
pulumi stack init dev

echo ""
echo "==> Previewing changes..."
pulumi preview

echo ""
echo "==> Applying (pulumi up)..."
pulumi up --yes --skip-preview

echo ""
echo "==> Showing outputs..."
pulumi stack output

echo ""
echo "==> Destroying resources..."
pulumi destroy --yes --skip-preview

pulumi stack rm dev --yes

echo ""
echo "==> Done! Pulumi Hello World complete."

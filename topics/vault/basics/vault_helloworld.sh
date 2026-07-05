#!/bin/bash
# Vault Hello World - starts Vault dev server and demonstrates basic secret operations

set -e

VAULT_ADDR="http://127.0.0.1:8200"
VAULT_TOKEN="myroot"

echo "==> Starting Vault dev server in background..."
docker run -d --rm --name vault-dev \
  -p 8200:8200 \
  -e "VAULT_DEV_ROOT_TOKEN_ID=${VAULT_TOKEN}" \
  hashicorp/vault

echo "==> Waiting for Vault to be ready..."
sleep 3

export VAULT_ADDR
export VAULT_TOKEN

echo "==> Vault status:"
vault status

echo ""
echo "==> Writing a secret..."
vault kv put secret/devops-basics \
  username="admin" \
  password="supersecret" \
  environment="demo"

echo ""
echo "==> Reading the secret back..."
vault kv get secret/devops-basics

echo ""
echo "==> Reading a specific field..."
PASS=$(vault kv get -field=password secret/devops-basics)
echo "Password field: ${PASS}"

echo ""
echo "==> Listing secrets..."
vault kv list secret/

echo ""
echo "==> Deleting the secret..."
vault kv delete secret/devops-basics

echo ""
echo "==> Cleaning up: stopping Vault container..."
docker stop vault-dev

echo "==> Done! Vault Hello World complete."

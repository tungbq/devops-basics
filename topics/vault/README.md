## 1. What is HashiCorp Vault?

- https://developer.hashicorp.com/vault/docs/what-is-vault

### Overview

HashiCorp Vault is an identity-based secrets and encryption management system. It provides a secure, automated way to manage secrets, credentials, and sensitive data across dynamic cloud environments.

Key capabilities:
- **Secrets management**: Store and tightly control access to tokens, passwords, certificates, API keys, and other secrets
- **Dynamic secrets**: Generate secrets on-demand for AWS, databases, SSH, and more — they expire automatically
- **Data encryption**: Encrypt application data without storing it in Vault
- **Leasing and renewal**: All secrets in Vault have a lease; clients must renew before expiry
- **Revocation**: Revoke secrets individually or by tree, enabling rolling credential rotation

### Vault Architecture

```
                ┌──────────────────────────────────────┐
                │              Vault Server             │
                │  ┌────────────┐  ┌─────────────────┐ │
Client ────────►│  │  Auth      │  │  Secret Engines │ │
                │  │  Methods   │  │  - KV, PKI      │ │
                │  │  - Token   │  │  - AWS, DB      │ │
                │  │  - AppRole │  │  - SSH, Transit │ │
                │  │  - K8s     │  └─────────────────┘ │
                │  └────────────┘                       │
                │  ┌─────────────────────────────────┐  │
                │  │        Storage Backend          │  │
                │  │  (Consul, Raft, S3, etcd...)    │  │
                │  └─────────────────────────────────┘  │
                └──────────────────────────────────────┘
```

### Official Documentation

- https://developer.hashicorp.com/vault/docs

## 2. Prerequisites

- Basic Linux command-line skills
- Understanding of secrets and credential management concepts
- Docker (for running Vault in dev mode)

## 3. Installation

### Install Vault CLI

- Official guide: https://developer.hashicorp.com/vault/install

```bash
# macOS
brew tap hashicorp/tap
brew install hashicorp/tap/vault

# Linux (Ubuntu/Debian)
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install vault
```

### Run Vault in Dev Mode (Docker)

```bash
docker run --rm -p 8200:8200 \
  -e 'VAULT_DEV_ROOT_TOKEN_ID=myroot' \
  hashicorp/vault
```

## 4. Basics of Vault

### Vault Hello World

- See: [basics/](./basics/)

### Common Vault Commands

```bash
# Set Vault address and token
export VAULT_ADDR='http://127.0.0.1:8200'
export VAULT_TOKEN='myroot'

# Check status
vault status

# Write a secret
vault kv put secret/myapp username="admin" password="s3cr3t"

# Read a secret
vault kv get secret/myapp

# Read only a specific field
vault kv get -field=password secret/myapp

# List secrets
vault kv list secret/

# Delete a secret
vault kv delete secret/myapp
```

## 5. Beyond the Basics

### Dynamic Secrets (AWS)

Vault can generate short-lived AWS credentials on demand:

```bash
# Enable the AWS secrets engine
vault secrets enable -path=aws aws

# Configure AWS credentials
vault write aws/config/root access_key=$AWS_ACCESS_KEY secret_key=$AWS_SECRET_KEY

# Create a role
vault write aws/roles/my-role credential_type=iam_user policy_arns=arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess

# Generate credentials
vault read aws/creds/my-role
```

### Vault with Kubernetes

- Official guide: https://developer.hashicorp.com/vault/docs/platform/k8s
- Use the Vault Agent Sidecar Injector or the Vault Secrets Operator to inject secrets into Pods

### Vault with Terraform

```hcl
provider "vault" {
  address = "https://vault.example.com"
}

data "vault_kv_secret_v2" "example" {
  mount = "secret"
  name  = "myapp"
}
```

### Hands-On Examples

- See: [practice/](./practice/)

## 6. More

### Vault Cheatsheet

- https://developer.hashicorp.com/vault/docs/commands

### Recommended Books

- [HashiCorp Vault: Securing Secrets at Scale](https://www.oreilly.com/library/view/hashicorp-vault-securing/9781098116644/)

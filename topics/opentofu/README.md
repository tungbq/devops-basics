## 1. What is OpenTofu?

- https://opentofu.org/docs/intro/

### Overview

OpenTofu is an open-source Infrastructure as Code (IaC) tool that is a fork of Terraform, maintained by the Linux Foundation. It was created in response to HashiCorp's license change from MPL to the Business Source License (BSL) in August 2023.

OpenTofu is:
- **Drop-in replacement for Terraform**: Fully compatible with existing Terraform configurations (HCL syntax, providers, modules, state files)
- **Open source**: Licensed under MPL 2.0, governed by the Linux Foundation
- **Community-driven**: Backed by major companies including AWS, Google, IBM, Red Hat, and many others
- **Feature-rich**: Includes all Terraform features plus new additions like state encryption and enhanced test framework

### OpenTofu vs Terraform

| Feature | OpenTofu | Terraform |
|---------|----------|-----------|
| License | MPL 2.0 (open source) | BSL 1.1 (source available) |
| Governance | Linux Foundation | HashiCorp / IBM |
| State encryption | ✅ Built-in | ❌ Not available |
| Provider compatibility | ✅ Same as Terraform | ✅ Native |
| Module registry | registry.opentofu.org | registry.terraform.io |
| Community | Open contributors | HashiCorp-controlled |

### Official Documentation

- https://opentofu.org/docs/

## 2. Prerequisites

- Basic Linux command-line skills
- Understanding of Infrastructure as Code concepts
- Cloud provider account (AWS, Azure, or GCP) for cloud examples

## 3. Installation

### Install OpenTofu

- Official guide: https://opentofu.org/docs/intro/install/

```bash
# macOS
brew install opentofu

# Linux (official installer)
curl --proto '=https' --tlsv1.2 -fsSL https://get.opentofu.org/install-opentofu.sh | sh

# Verify installation
tofu version
```

### Migrate from Terraform

```bash
# OpenTofu is CLI-compatible with Terraform
# Simply replace 'terraform' with 'tofu' in your commands
terraform init    →  tofu init
terraform plan    →  tofu plan
terraform apply   →  tofu apply
terraform destroy →  tofu destroy
```

## 4. Basics of OpenTofu

### OpenTofu Hello World

- See: [basics/](./basics/)

### Core Workflow

```bash
# Initialize working directory (downloads providers)
tofu init

# Preview infrastructure changes
tofu plan

# Apply the changes
tofu apply

# Show current state
tofu show

# Destroy all managed infrastructure
tofu destroy
```

### Basic Configuration Example

```hcl
# main.tf
terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4"
    }
  }
}

resource "local_file" "hello" {
  content  = "Hello from OpenTofu!"
  filename = "${path.module}/hello.txt"
}

output "file_content" {
  value = local_file.hello.content
}
```

## 5. Beyond the Basics

### State Encryption (OpenTofu-exclusive feature)

```hcl
# Encrypt state with a passphrase (OpenTofu only)
terraform {
  encryption {
    key_provider "pbkdf2" "my_passphrase" {
      passphrase = var.state_passphrase
    }
    method "aes_gcm" "my_method" {
      keys = key_provider.pbkdf2.my_passphrase
    }
    state {
      method = method.aes_gcm.my_method
    }
  }
}
```

### Testing with OpenTofu

```hcl
# tests/basic.tftest.hcl
run "verify_file_created" {
  command = apply

  assert {
    condition     = local_file.hello.content == "Hello from OpenTofu!"
    error_message = "File content does not match expected value"
  }
}
```

### Hands-On Examples

- See: [practice/](./practice/)

## 6. More

### OpenTofu Cheatsheet

```bash
tofu init          # Initialize directory
tofu validate      # Validate configuration
tofu plan          # Show execution plan
tofu apply         # Apply changes
tofu apply -auto-approve  # Apply without confirmation
tofu destroy       # Destroy infrastructure
tofu state list    # List resources in state
tofu state show <resource>  # Show resource details
tofu output        # Show output values
tofu fmt           # Format configuration files
```

### Recommended Resources

- [OpenTofu Official Docs](https://opentofu.org/docs/)
- [OpenTofu GitHub](https://github.com/opentofu/opentofu)
- [OpenTofu Registry](https://registry.opentofu.org/)
- [Migration Guide from Terraform](https://opentofu.org/docs/intro/migration/)

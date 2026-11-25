## 1. What is Pulumi?

- https://www.pulumi.com/

### Overview

- Pulumi is an open-source Infrastructure as Code (IaC) tool that lets you define cloud infrastructure using general-purpose programming languages (TypeScript, Python, Go, C#, Java) or YAML, instead of a domain-specific language such as HCL.
- Because it is real code, you get loops, functions, classes, package managers, IDE completion and unit tests for your infrastructure.
- Pulumi tracks what it has deployed in a **state** stored in a backend (Pulumi Cloud, or a self-managed backend such as the local filesystem or an S3 bucket). See the [`terraform`](../terraform/) and [`opentofu`](../opentofu/) topics for the HCL-based approach.

### Core concepts

| Concept | Meaning |
|---------|---------|
| **Project** | A directory with a `Pulumi.yaml` file describing the program and its runtime |
| **Program** | The code (or YAML) that declares the resources you want |
| **Stack** | An isolated instance of a project (for example `dev`, `staging`, `prod`), each with its own config and state |
| **Resource** | A piece of infrastructure managed by a provider (for example `aws:s3:Bucket`) |
| **Config** | Per-stack settings, set with `pulumi config set` |
| **Outputs** | Values exported from a stack, read with `pulumi stack output` |

### Official website documentation of Pulumi

- https://www.pulumi.com/docs/

## 2. Prerequisites

- For the [Hello World demo](./basics/): only the Pulumi CLI. It uses a local state backend and the `random` provider, so no cloud account is needed.
- For real cloud resources (for example an S3 bucket): a cloud account with credentials configured (see the [`aws`](../aws/) topic) and the language runtime of your choice (Node.js, Python, Go, ...).

## 3. Installation

### How to install Pulumi?

- Installing Pulumi: https://www.pulumi.com/docs/iac/download-install/

```bash
# Linux / macOS
curl -fsSL https://get.pulumi.com | sh

# macOS (Homebrew)
brew install pulumi/tap/pulumi

# Verify
pulumi version
```

## 4. Basics of Pulumi

### Getting started with Pulumi

- Refer to the [Official Pulumi getting started guide](https://www.pulumi.com/docs/iac/get-started/) for a comprehensive introduction.

### The core workflow

```bash
pulumi new <template>   # create a project from a template
pulumi stack init dev   # create a stack
pulumi preview          # show what would change (like `terraform plan`)
pulumi up               # create/update resources (like `terraform apply`)
pulumi stack output     # read exported values
pulumi destroy          # delete all resources in the stack
pulumi stack rm dev     # remove the (empty) stack
```

### Pulumi Hello World

- Check the [basics/](./basics/) directory to run a minimal Pulumi program with a local backend and no cloud account.

## 5. Beyond the Basics

### Provisioning a cloud resource

The same workflow works for real cloud resources. A minimal Python program that creates an S3 bucket:

```python
import pulumi
import pulumi_aws as aws

bucket = aws.s3.BucketV2("my-bucket")

pulumi.export("bucket_name", bucket.id)
```

Create the project with `pulumi new aws-python`, then run `pulumi up`.

### Hands-On Example

- Try the [Pulumi tutorials](https://www.pulumi.com/tutorials/) and the [practice exercises](./practice/) in this repo.

## 6. More

### Pulumi learning resource

- Pulumi documentation: https://www.pulumi.com/docs/
- Pulumi examples: https://github.com/pulumi/examples
- Pulumi vs Terraform: https://www.pulumi.com/docs/iac/concepts/vs/terraform/

### Recommended Books

- N/A

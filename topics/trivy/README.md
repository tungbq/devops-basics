## 1. What is Trivy?

- https://trivy.dev/latest/docs/

### Overview

Trivy is the world's most popular open-source vulnerability and misconfiguration scanner. Built by Aqua Security, it detects security issues across the entire software supply chain — container images, filesystems, Git repositories, Kubernetes clusters, and Infrastructure as Code.

Trivy scans for:
- **OS packages**: Alpine, Debian, Ubuntu, RHEL, CentOS, Amazon Linux, and more
- **Language-specific packages**: npm, pip, gem, cargo, go modules, Maven, NuGet
- **Infrastructure as Code**: Terraform, CloudFormation, Kubernetes, Helm, Dockerfile
- **Kubernetes misconfigurations**: NSA/CISA hardening guidelines, CIS benchmarks
- **Secrets**: Embedded credentials, API keys, tokens in code and images
- **Licenses**: Open source license compliance

### Trivy Architecture

```
                ┌─────────────────────────────────────────┐
                │                Trivy CLI                 │
                │  ┌──────────┐  ┌───────────────────────┐│
Input ─────────►│  │  Scanner │  │      Detectors        ││
(image/fs/repo) │  │          │  │  - Vulnerabilities    ││
                │  │  ┌───────┤  │  - Misconfigurations  ││
                │  │  │Parser │  │  - Secrets            ││
                │  │  │ SBOM  │  │  - Licenses           ││
                │  └──┴───────┘  └───────────────────────┘│
                │         │                                │
                │  ┌──────▼──────────────────────────────┐ │
                │  │  Vulnerability DB (auto-updated)    │ │
                │  │  NVD, GitHub Advisory, OSV, RedHat  │ │
                │  └─────────────────────────────────────┘ │
                └─────────────────────────────────────────┘
```

### Official Documentation

- https://trivy.dev/latest/docs/
- GitHub: https://github.com/aquasecurity/trivy

## 2. Prerequisites

- Docker (to scan container images)
- Basic understanding of vulnerabilities and CVEs

## 3. Installation

### Install Trivy

```bash
# macOS
brew install trivy

# Linux (Ubuntu/Debian)
sudo apt-get install wget apt-transport-https gnupg lsb-release
wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | gpg --dearmor | sudo tee /usr/share/keyrings/trivy.gpg > /dev/null
echo "deb [signed-by=/usr/share/keyrings/trivy.gpg] https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main" | sudo tee -a /etc/apt/sources.list.d/trivy.list
sudo apt-get update && sudo apt-get install trivy

# Docker
docker run aquasec/trivy

# Verify
trivy --version
```

- Official install guide: https://trivy.dev/latest/docs/getting-started/installation/

## 4. Basics of Trivy

### Trivy Hello World

- See: [basics/](./basics/)

### Scan a Container Image

```bash
# Scan an image for vulnerabilities
trivy image nginx:latest

# Scan only HIGH and CRITICAL
trivy image --severity HIGH,CRITICAL nginx:latest

# Output as JSON
trivy image --format json --output result.json nginx:latest

# Scan a local image
trivy image myapp:local
```

### Scan a Filesystem or Repository

```bash
# Scan current directory
trivy fs .

# Scan a Git repository
trivy repo https://github.com/knqyf263/trivy-ci-test

# Scan for secrets
trivy fs --scanners secret .

# Scan IaC (Terraform, K8s manifests)
trivy config ./terraform/
```

### Scan Kubernetes Cluster

```bash
# Scan entire cluster
trivy k8s --report summary cluster

# Scan a specific namespace
trivy k8s --namespace production --report all cluster

# Scan a specific workload
trivy k8s deployment/myapp
```

## 5. Beyond the Basics

### Integrate with GitHub Actions

```yaml
- name: Scan Docker image
  uses: aquasecurity/trivy-action@master
  with:
    image-ref: 'myapp:${{ github.sha }}'
    format: 'sarif'
    output: 'trivy-results.sarif'
    severity: 'CRITICAL,HIGH'

- name: Upload results to GitHub Security
  uses: github/codeql-action/upload-sarif@v3
  with:
    sarif_file: 'trivy-results.sarif'
```

### Generate SBOM (Software Bill of Materials)

```bash
# Generate SBOM in CycloneDX format
trivy image --format cyclonedx --output sbom.json nginx:latest

# Generate SBOM in SPDX format
trivy image --format spdx-json --output sbom.spdx.json nginx:latest
```

### Policy as Code with Rego

```bash
# Use custom Rego policies for IaC scanning
trivy config --policy ./policies/ ./kubernetes/
```

### Hands-On Examples

- See: [practice/](./practice/)

## 6. More

### Trivy Cheatsheet

```bash
# Image scanning
trivy image <image>                           # Scan image
trivy image --severity HIGH,CRITICAL <image>  # Filter by severity
trivy image --ignore-unfixed <image>          # Skip unfixed CVEs
trivy image --format json <image>             # JSON output

# Filesystem scanning
trivy fs .                                    # Scan directory
trivy fs --scanners vuln,secret,config .     # All scanners

# Config/IaC scanning
trivy config ./                               # Scan IaC files

# Kubernetes
trivy k8s cluster --report summary           # Cluster summary
```

### Recommended Resources

- [Trivy Documentation](https://trivy.dev/latest/docs/)
- [Trivy GitHub](https://github.com/aquasecurity/trivy)
- [Aqua Security Blog](https://www.aquasec.com/blog/)

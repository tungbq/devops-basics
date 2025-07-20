# Snyk

## 1. What is Snyk?

### Overview

The **Snyk** platform quickly finds and fixes security issues in proprietary code, open source dependencies, container images, and cloud infrastructure so businesses can build security directly into their continuous development process.
Source: https://snyk.io/about/

### Official Website of Snyk

- https://snyk.io/

### Official Documentation of Snyk

- https://docs.snyk.io/

### What You Can Do with Snyk

- Scan and fix vulnerabilities in application code, dependencies, Docker images, and IaC (Terraform, Kubernetes, etc.).
- Integrate security into your CI/CD pipelines.
- Monitor projects for newly disclosed vulnerabilities.
- Collaborate across Dev, Sec, and Ops teams.

Learn more: https://snyk.io/product/

---

## 2. Prerequisites

- Basic understanding of software development, dependencies, and build tools (npm, Maven, Docker, etc.).
- Node.js installed (required for Snyk CLI).
- Git (for scanning Git-based repositories).
- A free Snyk account (sign up at https://snyk.io/login).

---

## 3. Installation

### How to Install Snyk CLI?

1. **Install Node.js** (if not already installed):

   - https://nodejs.org/

2. **Install Snyk CLI**:

   ```bash
   npm install -g snyk
   ```

3. **Authenticate with Snyk**:
   ```bash
   snyk auth
   ```
   - This will open a browser for you to log in.

See more: https://snyk.io/platform/snyk-cli/

---

## 4. Basics of Snyk

### Getting started

- Getting started with https://docs.snyk.io/getting-started

### Scanning Your Project

1. Navigate to your project directory:

   ```bash
   cd /path/to/your/project
   ```

2. Run a test:

   ```bash
   snyk test
   ```

3. To monitor the project continuously:
   ```bash
   snyk monitor
   ```

### Fixing Vulnerabilities

- Use:
  ```bash
  snyk fix
  ```
  - Automatically applies safe upgrades and patches where possible.

### Docker Image Scanning

```bash
snyk container test your-image:tag
```

### IaC Scanning (Terraform, Kubernetes YAML, etc.)

```bash
snyk iac test
```

---

## 5. Snyk Hands-On

- See: [basics](./basics/) for hands-on examples and test cases.

---

## 6. More...

### Recommended Resources

- [Snyk Open Source Guide](https://snyk.io/product/open-source-security-management/)

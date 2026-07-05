# Trivy Practice

## Exercises

### Exercise 1: Scan and Fix a Container Image

1. Scan `python:3.9` for CRITICAL vulnerabilities
2. Run: `trivy image --severity CRITICAL python:3.9`
3. Note the CVEs found
4. Scan `python:3.12-slim` — compare the results
5. Understand why using minimal/newer base images reduces your attack surface

---

### Exercise 2: IaC Misconfiguration Scanning

1. Create a Terraform file defining an S3 bucket with public access enabled
2. Scan it with: `trivy config ./`
3. Note the misconfigurations flagged (ACL, versioning, encryption)
4. Fix each finding and re-scan until it passes

**Goal**: Practice secure IaC development with fast feedback

---

### Exercise 3: Integrate Trivy in GitHub Actions

1. Create a `Dockerfile` for a simple Node.js app
2. Add a GitHub Actions workflow that:
   - Builds the Docker image
   - Scans it with Trivy
   - Fails the build if CRITICAL CVEs are found
   - Uploads SARIF results to GitHub Security tab
3. Intentionally use an older base image and observe the pipeline fail

**Reference**: https://github.com/aquasecurity/trivy-action

---

### Exercise 4: Generate and Validate an SBOM

1. Pull an image: `docker pull redis:7`
2. Generate a CycloneDX SBOM: `trivy image --format cyclonedx --output sbom.json redis:7`
3. Inspect the SBOM to list all components
4. Use the SBOM to scan for vulnerabilities: `trivy sbom sbom.json`

**Goal**: Understand Software Bill of Materials in supply chain security

---

### Exercise 5: Kubernetes Cluster Security Audit

1. If you have a running Kubernetes cluster (minikube/kind), run:
   ```bash
   trivy k8s --report summary cluster
   ```
2. Review findings by category (vulnerabilities, misconfigurations)
3. Pick one HIGH finding and research how to fix it
4. Apply the fix and re-run to confirm remediation

**Reference**: https://trivy.dev/latest/docs/target/kubernetes/

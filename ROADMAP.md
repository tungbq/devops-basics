# Roadmap

This document outlines the planned improvements and upcoming content for DevOps Basics. It reflects community requests and emerging industry trends.

> Want to influence the roadmap? [Open a topic request](https://github.com/tungbq/devops-basics/issues/new?template=new_topic_request.yml) or [vote on existing issues](https://github.com/tungbq/devops-basics/issues?q=is%3Aissue+is%3Aopen+label%3Aenhancement).

## Recently Added ✅

| Topic | Description |
|-------|-------------|
| Grafana | Metrics visualization and dashboards |
| Vault | HashiCorp Vault secrets management |
| OpenTofu | Open-source Terraform fork (Linux Foundation) |
| Trivy | Container and IaC security scanning |
| GCP | Google Cloud Platform |

## Upcoming Topics 🔜

These are planned or in-progress based on community demand and industry relevance:

| Topic | Category | Priority | Notes |
|-------|----------|----------|-------|
| **FluxCD** | GitOps / CI-CD | High | CNCF-graduated GitOps engine, complement to ArgoCD |
| **Crossplane** | IaC / Platform Eng | High | Kubernetes-native infrastructure management |
| **Backstage** | Platform Engineering | High | Developer portal framework by Spotify |
| **Dagger** | CI/CD | Medium | Portable CI/CD pipelines as code |
| **Pulumi** | IaC | Medium | IaC with real programming languages |
| **Cilium / eBPF** | Networking | Medium | eBPF-based networking and security for K8s |
| **Kustomize** | Kubernetes | Medium | Kubernetes-native config management |
| **OPA / Gatekeeper** | Security / Policy | Medium | Policy as code for Kubernetes |
| **Tekton** | CI/CD | Low | Kubernetes-native CI/CD pipelines |
| **Podman** | Containers | Low | Daemonless Docker alternative |
| **Vault (Advanced)** | Security | Medium | Advanced Vault patterns (PKI, dynamic secrets) |
| **GCP (Advanced)** | Cloud | Low | GKE, Cloud Run, Cloud Build deep dives |

## Planned Improvements 🛠️

### Content Quality

- [ ] Add more runnable `advanced/` examples to topics that only have `basics/`
- [ ] Add video links for key topics (YouTube, official training)
- [ ] Add comparison guides: Docker vs Podman, Terraform vs OpenTofu, ArgoCD vs FluxCD
- [ ] Expand practice exercises for existing topics (aim for 5+ exercises each)

### Website (devops-basics.thedevopshub.org)

- [x] MkDocs Material theme setup
- [ ] Add search functionality
- [ ] Add dark/light mode toggle
- [ ] Improve mobile responsiveness
- [ ] Add topic difficulty tags (Beginner / Intermediate / Advanced)

### Community & Discoverability

- [x] GitHub issue templates (bug report, topic request, content improvement)
- [ ] GitHub Discussions for Q&A
- [ ] Learning paths for different roles (SRE, Platform Engineer, Developer)
- [ ] Monthly "New Topics" highlight in README
- [ ] Add repo to awesome-devops lists

### Automation

- [ ] Automated broken link checker (weekly)
- [ ] Script linting for all `.sh` files in CI
- [ ] Auto-generate topics table in README from directory structure

## Learning Paths (Planned) 🗺️

We plan to add structured learning paths for different DevOps roles:

- **DevOps Beginner**: Git → Shell → Docker → Kubernetes → CI/CD basics
- **Platform Engineer**: Kubernetes → Helm → Terraform → ArgoCD → Backstage → Crossplane
- **SRE/Ops**: Linux → Shell → Prometheus → Grafana → ELK → Kubernetes
- **Cloud Engineer**: AWS/Azure/GCP → Terraform → Kubernetes → CI/CD → Security

---

*Last updated: 2025 — This roadmap is a living document and will be updated as we grow.*

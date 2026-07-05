## 1. What is Google Cloud Platform (GCP)?

- https://cloud.google.com/docs/overview

### Overview

Google Cloud Platform (GCP) is Google's suite of cloud computing services that runs on the same infrastructure that Google uses internally for its end-user products. GCP offers over 300 products across compute, storage, databases, networking, AI/ML, DevOps, and security.

### Key GCP Services for DevOps

| Category | Service | Description |
|----------|---------|-------------|
| **Compute** | Compute Engine (GCE) | Virtual machines |
| **Compute** | Google Kubernetes Engine (GKE) | Managed Kubernetes |
| **Compute** | Cloud Run | Serverless containers |
| **Compute** | App Engine | PaaS platform |
| **Storage** | Cloud Storage (GCS) | Object storage |
| **Storage** | Persistent Disk | Block storage for VMs |
| **Database** | Cloud SQL | Managed relational DB |
| **Database** | Firestore / Bigtable | NoSQL databases |
| **Database** | BigQuery | Data warehouse / analytics |
| **Networking** | VPC | Virtual Private Cloud |
| **Networking** | Cloud Load Balancing | Global load balancer |
| **Networking** | Cloud DNS | Managed DNS |
| **CI/CD** | Cloud Build | Serverless CI/CD |
| **CI/CD** | Artifact Registry | Container/package registry |
| **Monitoring** | Cloud Monitoring | Metrics and alerting |
| **Monitoring** | Cloud Logging | Log management |
| **Monitoring** | Cloud Trace | Distributed tracing |
| **Security** | IAM | Identity and access management |
| **Security** | Secret Manager | Secrets storage |
| **IaC** | Deployment Manager | GCP-native IaC |

### GCP Global Infrastructure

- **Regions**: 40+ geographic regions worldwide
- **Zones**: 3+ availability zones per region
- **Points of Presence**: 200+ edge locations (Cloud CDN)
- **Network**: Google's private global fiber network

### Official Documentation

- https://cloud.google.com/docs

## 2. Prerequisites

- Basic Linux command-line skills
- Understanding of cloud computing concepts
- Google account to access GCP Free Tier ($300 credit for new users)

## 3. Installation

### Install Google Cloud CLI (gcloud)

- Official guide: https://cloud.google.com/sdk/docs/install

```bash
# macOS
brew install google-cloud-sdk

# Linux
curl https://sdk.cloud.google.com | bash
exec -l $SHELL

# Initialize and authenticate
gcloud init
gcloud auth login

# Set default project
gcloud config set project YOUR_PROJECT_ID

# Verify
gcloud version
gcloud config list
```

## 4. Basics of GCP

### GCP Hello World

- See: [basics/](./basics/)

### Essential gcloud Commands

```bash
# Authentication
gcloud auth login                        # Authenticate with browser
gcloud auth application-default login   # Set application credentials
gcloud auth list                         # List active accounts

# Project management
gcloud projects list                     # List all projects
gcloud config set project PROJECT_ID    # Set active project
gcloud config get-value project         # Show active project

# Compute Engine (VMs)
gcloud compute instances list           # List VM instances
gcloud compute instances create my-vm \
  --zone=us-central1-a \
  --machine-type=e2-micro \
  --image-family=debian-12 \
  --image-project=debian-cloud

# GKE
gcloud container clusters list          # List GKE clusters
gcloud container clusters create my-cluster \
  --zone=us-central1-a \
  --num-nodes=3
gcloud container clusters get-credentials my-cluster --zone=us-central1-a

# Cloud Storage
gsutil ls                               # List buckets
gsutil mb gs://my-bucket               # Create bucket
gsutil cp file.txt gs://my-bucket/     # Upload file
gsutil cat gs://my-bucket/file.txt     # Read file

# IAM
gcloud iam service-accounts list        # List service accounts
gcloud projects get-iam-policy PROJECT_ID  # View IAM policy
```

## 5. Beyond the Basics

### GKE (Google Kubernetes Engine) — Best-in-class Managed Kubernetes

```bash
# Create an Autopilot cluster (Google manages nodes)
gcloud container clusters create-auto my-autopilot-cluster \
  --region=us-central1

# Deploy an application
kubectl create deployment hello --image=us-docker.pkg.dev/google-samples/containers/gke/hello-app:1.0
kubectl expose deployment hello --type=LoadBalancer --port=80 --target-port=8080

# Get the external IP
kubectl get service hello
```

### Cloud Run — Serverless Containers

```bash
# Deploy a container to Cloud Run
gcloud run deploy my-service \
  --image=gcr.io/cloudrun/hello \
  --platform=managed \
  --region=us-central1 \
  --allow-unauthenticated

# List services
gcloud run services list
```

### Cloud Build — CI/CD

```yaml
# cloudbuild.yaml
steps:
  - name: 'gcr.io/cloud-builders/docker'
    args: ['build', '-t', 'gcr.io/$PROJECT_ID/my-app', '.']
  - name: 'gcr.io/cloud-builders/docker'
    args: ['push', 'gcr.io/$PROJECT_ID/my-app']
  - name: 'gcr.io/cloud-builders/gke-deploy'
    args:
      - run
      - --filename=kubernetes/
      - --image=gcr.io/$PROJECT_ID/my-app
      - --location=us-central1-a
      - --cluster=my-cluster
```

### Terraform with GCP

```hcl
provider "google" {
  project = var.project_id
  region  = "us-central1"
}

resource "google_compute_instance" "vm" {
  name         = "my-vm"
  machine_type = "e2-micro"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }
}
```

### Hands-On Examples

- See: [practice/](./practice/)

## 6. More

### GCP Cheatsheet

- https://cloud.google.com/sdk/docs/cheatsheet

### GCP Free Tier

- https://cloud.google.com/free — Always-free tier + $300 trial credit

### Recommended Learning Paths

- [Google Cloud Skills Boost](https://www.cloudskillsboost.google/)
- [GCP Associate Cloud Engineer](https://cloud.google.com/certification/cloud-engineer)
- [GCP Professional DevOps Engineer](https://cloud.google.com/certification/cloud-devops-engineer)

### Recommended Books

- [Google Cloud Platform in Action](https://www.manning.com/books/google-cloud-platform-in-action)

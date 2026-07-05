# GCP Practice

## Exercises

### Exercise 1: Compute Engine VM

1. Create a Compute Engine VM using `gcloud compute instances create`
2. SSH into the VM: `gcloud compute ssh my-vm --zone=us-central1-a`
3. Install nginx on the VM
4. Open port 80 in the firewall: `gcloud compute firewall-rules create allow-http --allow=tcp:80`
5. Visit the VM's external IP in a browser
6. Clean up: delete the VM and firewall rule

**Reference**: https://cloud.google.com/compute/docs/instances/create-start-instance

---

### Exercise 2: GKE Autopilot Cluster

1. Create a GKE Autopilot cluster in `us-central1`
2. Configure `kubectl` to use the new cluster
3. Deploy the Google sample app: `kubectl create deployment hello-app --image=us-docker.pkg.dev/google-samples/containers/gke/hello-app:1.0`
4. Expose it with a LoadBalancer service
5. Access the app via the external IP
6. Scale the deployment to 3 replicas
7. Clean up: delete the cluster

**Reference**: https://cloud.google.com/kubernetes-engine/docs/quickstarts/autopilot

---

### Exercise 3: Cloud Run Deployment

1. Create a simple Dockerfile for a "Hello World" HTTP server
2. Build and push it to Artifact Registry
3. Deploy to Cloud Run with `--allow-unauthenticated`
4. Test the URL that Cloud Run provides
5. Update the service with a new image revision
6. Split traffic 50/50 between two revisions

**Reference**: https://cloud.google.com/run/docs/quickstarts/build-and-deploy

---

### Exercise 4: Cloud Build CI/CD Pipeline

1. Fork a sample application repository
2. Create a `cloudbuild.yaml` that:
   - Builds a Docker image
   - Runs tests
   - Pushes to Artifact Registry
   - Deploys to Cloud Run
3. Connect Cloud Build to your repository
4. Trigger a build by pushing a commit
5. Observe the build logs in Cloud Console

**Reference**: https://cloud.google.com/build/docs/quickstart-build

---

### Exercise 5: Infrastructure with Terraform on GCP

1. Create a Terraform configuration that provisions:
   - A VPC network with a subnet
   - A GCS bucket
   - A Compute Engine VM in the VPC
2. Store Terraform state in a GCS backend
3. Run `tofu init`, `tofu plan`, `tofu apply`
4. Verify resources in GCP Console
5. Run `tofu destroy` to clean up

**Reference**: https://registry.terraform.io/providers/hashicorp/google/latest/docs

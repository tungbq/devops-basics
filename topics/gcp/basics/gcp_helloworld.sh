#!/bin/bash
# GCP Hello World - demonstrates basic gcloud and gsutil operations
# Prerequisite: gcloud auth login && gcloud config set project YOUR_PROJECT_ID

set -e

PROJECT_ID=$(gcloud config get-value project 2>/dev/null)
if [ -z "${PROJECT_ID}" ]; then
  echo "ERROR: No GCP project set. Run: gcloud config set project YOUR_PROJECT_ID"
  exit 1
fi

BUCKET_NAME="devops-basics-demo-${RANDOM}"
REGION="us-central1"

echo "==> Using GCP project: ${PROJECT_ID}"
echo ""

echo "==> gcloud version:"
gcloud version --format="value(Google Cloud SDK)"

echo ""
echo "==> Active account:"
gcloud auth list --filter=status:ACTIVE --format="value(account)"

echo ""
echo "==> Available projects:"
gcloud projects list --format="table(projectId,name)"

echo ""
echo "==> Creating a Cloud Storage bucket: gs://${BUCKET_NAME}"
gsutil mb -l "${REGION}" "gs://${BUCKET_NAME}"

echo ""
echo "==> Uploading a file..."
echo "Hello from GCP DevOps Basics!" > /tmp/hello-gcp.txt
gsutil cp /tmp/hello-gcp.txt "gs://${BUCKET_NAME}/hello-gcp.txt"

echo ""
echo "==> Listing bucket contents:"
gsutil ls "gs://${BUCKET_NAME}/"

echo ""
echo "==> Reading the file back:"
gsutil cat "gs://${BUCKET_NAME}/hello-gcp.txt"

echo ""
echo "==> Cleaning up: deleting bucket..."
gsutil rm -r "gs://${BUCKET_NAME}"
rm -f /tmp/hello-gcp.txt

echo ""
echo "==> Done! GCP Hello World complete."

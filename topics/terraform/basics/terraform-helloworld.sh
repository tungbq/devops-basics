#!/bin/bash

console_log() {
  echo ">>> [Terraform] $1"
}

console_log "Demo creating an EC2 instance on AWS using Terraform"

console_log "Navigating to aws ec2 example"
cd aws-ec2

console_log "Checking the AWS EC2 example structure"
ls -la

console_log "Checking the variables content"
cat variables.tf

console_log "Init the terraform"
terraform init

console_log "Plan the terraform code"
terraform plan

console_log "Apply the terraform code"
# --auto-approve is to approve automatically, no need to type 'yes'
terraform apply --auto-approve

console_log "Navigate to your AWS account to verify the created EC2 instance"
console_log "Keep exploring from AWS..."

console_log "IMPORTANT! Please terminate the resource after the hands on to avoid unexpected AWS cost!"
console_log "Once verification completed! Run terraform destroy, and type 'yes' to confirm"
terraform destroy

console_log "Done! Congratulations, you've just created the EC2 instance on AWS using Terraform!"

variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "ExampleAppServerInstance"
}

variable "deploy_region" {
  description = "Value of the region to provision the EC2 instance"
  type        = string
  default     = "us-west-1"
}


variable "ami_template" {
  description = "Value of the AMI to provision the EC2 instance"
  type        = string
  default     = "ami-018d291ca9ffc002f"
}

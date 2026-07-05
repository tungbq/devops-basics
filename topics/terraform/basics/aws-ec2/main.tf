terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.34"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = var.deploy_region
}

resource "aws_instance" "app_server" {
  ami           = var.ami_template
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name
  }
}

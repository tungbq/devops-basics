terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {

    # This backend configuration is filled in automatically at test time by Terratest. If you wish to run this example
    # manually, uncomment and fill in the config below.

    bucket         = "tungleo-terraform-state-s3"
    key            = "global/s3/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-up-and-running-locks"
    encrypt        = true

  }
}

data "terraform_remote_state" "db" {
  backend = "s3"
  config = {
    bucket = "tungleo-terraform-state-s3"
    key = "stage/data-stores/mysql/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example_chap03" {
  ami = "ami-0c4e4b4eb2e11d1d4"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.instance_chap03.id]

  # Render the User Data script as a template
  user_data = templatefile("user-data.sh", {
    server_port = var.server_port
    db_address  = data.terraform_remote_state.db.outputs.address
    db_port     = data.terraform_remote_state.db.outputs.port
  })

  user_data_replace_on_change = true

  tags = {
    Name = "terraform-example"
  }
}


# Create security group
resource "aws_security_group" "instance_chap03" {
  name = "terraform-example-instance-chap03"

  # Inbound rules
  ingress {
    from_port = var.server_port
    to_port = var.server_port
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound rules
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

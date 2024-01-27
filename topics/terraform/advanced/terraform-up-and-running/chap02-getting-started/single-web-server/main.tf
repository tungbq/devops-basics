provider "aws" {
  region = "us-east-1"
}

variable "server_port" {
  description = "The port the server will use for HTTP requests"
  type = number
  default = 80
}

variable "ssh_port" {
  description = "The SSH port to instance (might helpful for debugging purpose)"
  type = number
  default = 22
}

# Create security group
resource "aws_security_group" "instance" {
  name = "terraform-example-instance"

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

# Create SSH security group
resource "aws_security_group" "ssh_instance" {
  name = "terraform-example-instance-SSH"

  # Inbound rules
  ingress {
    from_port = var.ssh_port
    to_port = var.ssh_port
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Launch an EC2 instance
resource "aws_instance" "example" {
  ami = "ami-0c4e4b4eb2e11d1d4"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.instance.id, aws_security_group.ssh_instance.id]

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl enable httpd.service
              systemctl start httpd.service
              # Create the HTML file
              touch /var/www/html/index.html
              echo "[tungbq] This is $(hostname)" > /var/www/html/index.html
              EOF
  tags = {
    Name = "terraform-example-leo"
  }
}

output "public_ip" {
  value = aws_instance.example.public_ip
  description = "The public IP address of the web server"
}

terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}

# Define ami
data "aws_ami" "amazon-linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn-ami-hvm-*-x86_64-ebs"]
  }
}

# Create new VPC
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.77.0"

  name = "main-vpc"
  cidr = "10.0.0.0/16"

  azs                  = data.aws_availability_zones.available.names
  public_subnets       = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  enable_dns_hostnames = true
  enable_dns_support   = true
}

# Launch configuration
resource "aws_launch_configuration" "terramino" {
  name_prefix     = "learn-terraform-aws-asg--${var.environment}-"
  # image_id        = data.aws_ami.amazon-linux.id
  image_id = "ami-0c4e4b4eb2e11d1d4"
  instance_type   = "t2.micro"
  user_data = file("${path.module}/asg-user-data.sh")
  security_groups = [aws_security_group.terramino_instance.id]

  lifecycle {
    create_before_destroy = true
  }
}

# ASG
resource "aws_autoscaling_group" "terramino" {
  min_size             = var.asg_min_size
  max_size             = var.asg_max_size
  desired_capacity     = var.asg_desired_capacity
  launch_configuration = aws_launch_configuration.terramino.name
  vpc_zone_identifier  = module.vpc.public_subnets

  tag {
    key                 = "Name"
    value               = "HashiCorp Learn ASG - Terramino"
    propagate_at_launch = true
  }
}

# ALB
resource "aws_lb" "terramino" {
  name               = var.alb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.terramino_lb.id]
  subnets            = module.vpc.public_subnets
}

# ALB listener
resource "aws_lb_listener" "terramino" {
  load_balancer_arn = aws_lb.terramino.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.terramino.arn
  }
}

# ALB target group
 resource "aws_lb_target_group" "terramino" {
   name     = "learn-asg-terramino-${var.environment}"
   port     = 80
   protocol = "HTTP"
   vpc_id   = module.vpc.vpc_id
 }

resource "aws_autoscaling_attachment" "terramino" {
  autoscaling_group_name = aws_autoscaling_group.terramino.id
  alb_target_group_arn   = aws_lb_target_group.terramino.arn
}

# SG-01: EC2 instance
resource "aws_security_group" "terramino_instance" {
  name = "learn-asg-terramino-instance-${var.environment}"
  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.terramino_lb.id]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    security_groups = [aws_security_group.terramino_lb.id]
  }


  # Tmp workaround - Allow instance to reachout to the internet to start HTTP service
  # TODO: Handle in VPC scope
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  vpc_id = module.vpc.vpc_id
}

# SG-02: Load balancer
resource "aws_security_group" "terramino_lb" {
  name = "learn-asg-terramino-lb-${var.environment}"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  vpc_id = module.vpc.vpc_id
}

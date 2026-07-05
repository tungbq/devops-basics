# LATEST AMI FROM PARAMETER STORE

data "aws_ssm_parameter" "three-tier-ami" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

# LAUNCH TEMPLATES AND AUTOSCALING GROUPS FOR BASTION

resource "aws_launch_template" "three_tier_bastion" {
  name_prefix            = "three_tier_bastion"
  instance_type          = var.instance_type
  image_id               = data.aws_ssm_parameter.three-tier-ami.value
  vpc_security_group_ids = [var.bastion_sg]
  key_name               = var.key_name

  tags = {
    Name = "three_tier_bastion"
  }
}

resource "aws_autoscaling_group" "three_tier_bastion" {
  name                = "three_tier_bastion"
  vpc_zone_identifier = var.public_subnets
  min_size            = 1
  max_size            = 1
  desired_capacity    = 1

  launch_template {
    id      = aws_launch_template.three_tier_bastion.id
    version = "$Latest"
  }
}

# LAUNCH TEMPLATES AND AUTOSCALING GROUPS FOR FRONTEND APP TIER

resource "aws_launch_template" "three_tier_app" {
  name_prefix            = "three_tier_app"
  instance_type          = var.instance_type
  image_id               = data.aws_ssm_parameter.three-tier-ami.value
  vpc_security_group_ids = [var.frontend_app_sg]
  user_data              = filebase64("install_apache.sh")
  key_name               = var.key_name

  tags = {
    Name = "three_tier_app"
  }
}

data "aws_lb_target_group" "three_tier_tg" {
  name = var.lb_tg_name
}

resource "aws_autoscaling_group" "three_tier_app" {
  name                = "three_tier_app"
  vpc_zone_identifier = var.private_subnets
  min_size            = 2
  max_size            = 3
  desired_capacity    = 2

  target_group_arns = [data.aws_lb_target_group.three_tier_tg.arn]

  launch_template {
    id      = aws_launch_template.three_tier_app.id
    version = "$Latest"
  }
}


# LAUNCH TEMPLATES AND AUTOSCALING GROUPS FOR BACKEND

resource "aws_launch_template" "three_tier_backend" {
  name_prefix            = "three_tier_backend"
  instance_type          = var.instance_type
  image_id               = data.aws_ssm_parameter.three-tier-ami.value
  vpc_security_group_ids = [var.backend_app_sg]
  key_name               = var.key_name
  user_data              = filebase64("install_node.sh")

  tags = {
    Name = "three_tier_backend"
  }
}

resource "aws_autoscaling_group" "three_tier_backend" {
  name                = "three_tier_backend"
  vpc_zone_identifier = var.private_subnets
  min_size            = 2
  max_size            = 3
  desired_capacity    = 2

  launch_template {
    id      = aws_launch_template.three_tier_backend.id
    version = "$Latest"
  }
}

# AUTOSCALING ATTACHMENT FOR APP TIER TO LOADBALANCER

resource "aws_autoscaling_attachment" "asg_attach" {
  autoscaling_group_name = aws_autoscaling_group.three_tier_app.id
  lb_target_group_arn    = var.lb_tg
}

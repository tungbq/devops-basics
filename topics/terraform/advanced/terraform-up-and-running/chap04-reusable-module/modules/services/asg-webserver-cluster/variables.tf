variable "alb_name" {
  description = "ALB name to be created"
  type = string
}

variable "environment" {
  description = "ALB name to be created"
  type = string
}

variable "asg_min_size" {
  description = "ASG min size"
  type = number
  default = 1
}

variable "asg_max_size" {
  description = "ASG max size"
  type = number
  default = 2
}

variable "asg_desired_capacity" {
  description = "ASG desired capacity"
  type = number
  default = 1
}

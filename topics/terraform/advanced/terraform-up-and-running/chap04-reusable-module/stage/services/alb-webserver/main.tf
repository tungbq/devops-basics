provider "aws" {
  region = "us-east-1"
}
module "webserver_alb" {
  source = "../../../modules/services/asg-webserver-cluster"

  alb_name = "testing-alb"
  environment = "staging"
  asg_min_size = 1
  asg_max_size = 3
  asg_desired_capacity = 2
}

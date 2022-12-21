provider "aws" {
  region = "us-east-1"
}
module "webserver_alb" {
  source = "../../../modules/services/asg-webserver-cluster"

  alb_name = "testing-alb"
  environment = "staging"
}

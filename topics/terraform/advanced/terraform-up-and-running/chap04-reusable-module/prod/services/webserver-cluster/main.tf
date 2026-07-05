provider "aws" {
  region = "us-east-1"
}
module "webserver_cluster" {
  source = "../../../modules/services/webserver-cluster"
}

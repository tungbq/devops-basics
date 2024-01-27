provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "tungleo-terraform-state-s3"
    key = "stage/data-stores/mysql/terraform.tfstate"
    region = "us-east-1"
    # Replace this with your DynamoDB table name!
    dynamodb_table = "terraform-up-and-running-locks"
    encrypt = true
  }
}

resource "aws_db_instance" "example" {
  identifier_prefix = "example-db"
  engine = "mysql"
  allocated_storage = 10
  instance_class = "db.t2.micro"
  db_name = "example_database"
  username = "admin"
  password = "admin0123456"
  skip_final_snapshot = true
  # This is a better way, but we dont use for practice as it costs money
  # password = data.aws_secretsmanager_secret_version.db_password.secret_string
}

# This is a better way, but we dont use for practice as it costs money
# data "aws_secretsmanager_secret_version" "db_password" {
#   secret_id = "mysql-master-password-stage"
# }

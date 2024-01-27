provider "aws" {
  region = local.location
}

locals {
  instance_type = "t2.micro"
  location      = "us-east-1"
  environment   = "dev"
  vpc_cidr      = "10.123.0.0/16"
}

module "networking" {
  source            = "../modules/three-tier-deployment/networking"
  vpc_cidr          = local.vpc_cidr
  access_ip         = var.access_ip
  public_sn_count   = 2
  private_sn_count  = 2
  db_subnet_group   = true
  availabilityzone  = "us-east-1a"
  azs               = 2
}

module "compute" {
  source                  = "../modules/three-tier-deployment/compute"
  frontend_app_sg         = module.networking.frontend_app_sg
  backend_app_sg          = module.networking.backend_app_sg
  bastion_sg              = module.networking.bastion_sg
  public_subnets          = module.networking.public_subnets
  private_subnets         = module.networking.private_subnets
  bastion_instance_count  = 1
  instance_type           = local.instance_type
  key_name                = "MyTestEC2"
  lb_tg_name              = module.loadbalancing.lb_tg_name
  lb_tg                   = module.loadbalancing.lb_tg
}

module "database" {
  source               = "../modules/three-tier-deployment/database"
  db_storage           = 10
  db_engine_version    = "8.0.28"
  db_instance_class    = "db.t2.micro"
  db_name              = var.db_name
  dbuser               = var.dbuser
  dbpassword           = var.dbpassword
  db_identifier        = "three-tier-db"
  skip_db_snapshot     = true
  rds_sg               = module.networking.rds_sg
  db_subnet_group_name = module.networking.db_subnet_group_name[0]
}

module "loadbalancing" {
  source                  = "../modules/three-tier-deployment/loadbalancing"
  lb_sg                   = module.networking.lb_sg
  public_subnets          = module.networking.public_subnets
  tg_port                 = 80
  tg_protocol             = "HTTP"
  vpc_id                  = module.networking.vpc_id
  app_asg                 = module.compute.app_asg
  listener_port           = 80
  listener_protocol       = "HTTP"
  azs                     = 2
}

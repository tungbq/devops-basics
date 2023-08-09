output "alb_dns_name" {
  value = module.webserver_alb.alb_dns_name
  description = "The domain name of the load balancer"
}


output "lb_endpoint" {
  value = module.webserver_alb.lb_endpoint
}

output "application_endpoint" {
  value = module.webserver_alb.application_endpoint
}

output "asg_name" {
  value = module.webserver_alb.asg_name
}

output "alb_dns_name" {
  value = aws_lb.terramino.dns_name
  description = "The domain name of the load balancer"
}

output "lb_endpoint" {
  value = "https://${aws_lb.terramino.dns_name}"
}

output "application_endpoint" {
  value = "https://${aws_lb.terramino.dns_name}/index.php"
}

output "asg_name" {
  value = aws_autoscaling_group.terramino.name
}
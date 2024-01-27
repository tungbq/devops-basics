output "app_asg" {
  value = aws_autoscaling_group.three_tier_app
}

output "app_backend_asg" {
  value = aws_autoscaling_group.three_tier_backend
}

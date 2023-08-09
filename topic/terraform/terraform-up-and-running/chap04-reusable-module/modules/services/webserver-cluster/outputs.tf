output "public_ip" {
  value = aws_instance.example_chap03.public_ip
  description = "The public IP address of the web server"
}

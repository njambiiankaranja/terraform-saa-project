output "vpc_id" {
  description = "ID of the created VPC"
  value       = aws_vpc.main.id
}

output "public_ip" {
  description = "Public IP address of the EC2 Web Server"
  value       = aws_instance.web.public_ip
}
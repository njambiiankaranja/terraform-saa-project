variable "my_ip" {
  type        = string
  description = "My public IP address for secure SSH access"
  default     = "0.0.0.0/32" # Change this to your IP/32 or supply via terraform.tfvars
}

variable "admin_email" {
  type        = string
  description = "Email address for CloudWatch alarm notifications"
  default     = "admin@example.com"
}
variable "aws_region" {
  type        = string
  default     = "us-east-1"
  description = "AWS region to deploy resources"
}

variable "environment" {
  type        = string
  default     = "dev"
  description = "Environment name tag"
}

variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "Base CIDR block for the VPC"
}

variable "public_subnet_cidr" {
  type        = string
  default     = "10.0.1.0/24"
  description = "CIDR block for the public subnet"
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "EC2 instance type"
}
# AWS Multi-Tier Infrastructure with Terraform (SAA-C03)

[![Terraform](https://img.shields.io/badge/Terraform-1.0%2B-purple?logo=terraform)](https://www.terraform.io/)
[![AWS](https://img.shields.io/badge/AWS-Cloud-orange?logo=amazon-aws)](https://aws.amazon.com/)
[![Certification](https://img.shields.io/badge/AWS%20Certified-Solutions%20Architect%20Associate-blue)](https://aws.amazon.com/certification/certified-solutions-architect-associate/)

Automated Infrastructure as Code (IaC) repository built using HashiCorp Terraform to provision a scalable, multi-tier AWS cloud architecture aligned with **AWS Certified Solutions Architect - Associate (SAA-C03)** design principles.

---

## Architecture Overview

This project provisions a secure, production-grade end-to-end AWS environment:

* **Networking**: Custom VPC, Dual-AZ Public & Private Subnets, Internet Gateway, and Custom Route Tables.
* **Security**: Stateful AWS Security Groups enforcing the principle of least privilege (HTTP/SSH access).
* **Compute**: Automated EC2 Web Server deployment running standard Ubuntu Server AMIs with boot-time provisioning scripts.
* **Storage & IAM**: 
  * **Amazon S3**: Secure bucket provisioned for application data, logs, or backups.
  * **IAM Instance Profile**: Attached directly to the EC2 instance to allow secure communication with S3 without hardcoded credentials.
* **Monitoring & Alerting**: 
  * **Amazon CloudWatch**: Automatically monitors EC2 CPU utilization (triggers if usage exceeds 80% for 5 minutes).
  * **Amazon SNS**: Integrated with CloudWatch to instantly dispatch email alerts to administrators upon state changes.
* **State Management**: Remote backend using Amazon S3 with DynamoDB distributed state locking.

---

## Repository Structure

* `main.tf` — Core AWS infrastructure resource definitions.
* `variables.tf` — Input variable declarations for dynamic configuration.
* `terraform.tfvars` — Local variable overrides (ignored by Git for security).
* `outputs.tf` — Key operational outputs (e.g., EC2 Public IP, VPC ID).
* `providers.tf` — AWS Provider configuration and required version pins.

---

## Quickstart

### Prerequisites
* [Terraform](https://www.developer.hashicorp.com/terraform/downloads) installed locally.
* An active [AWS Account](https://aws.amazon.com/) with configured AWS CLI credentials (`aws configure`).

### Deployment Steps

1. **Clone the repository:**
   ```bash
   git clone [https://github.com/njambiiankaranja/terraform-saa-project.git](https://github.com/njambiiankaranja/terraform-saa-project.git)
   cd terraform-saa-project
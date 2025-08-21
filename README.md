# aws-infra-terraform

Modular, scalable Terraform AWS infrastructure for VPC, EC2, IAM, and security. Designed to be easily extendable and production-ready.

## Overview

This repo provisions foundational AWS resources including:

- VPC, Subnets, Internet Gateway, Route Tables  
- EC2 instances with IAM roles and security groups  
- IAM roles, policies, and instance profiles  
- Secure management via AWS Systems Manager (SSM)  

## Structure

- `main.tf` — Root module invoking all submodules  
- `modules/` — Reusable Terraform modules for VPC, EC2, IAM, etc.  
- `outputs.tf` — Outputs for important resource info  
- `provider.tf` — AWS provider configuration  
- `variables.tf` — Variables definitions  

## Important

`terraform.tfvars` is excluded from version control as it contains sensitive environment-specific values like IP addresses and keys.

## Notes

This project aims for production-grade AWS infrastructure automation, following best practices for security and maintainability.
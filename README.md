# aws-infra-terraform

Modular, scalable Terraform AWS infrastructure for VPC, EC2, IAM, and security. Designed to be easily extendable and production-ready.

## Overview

This repo contains Terraform code to provision foundational AWS resources including:

- VPC, Subnets, Internet Gateway, Route Tables  
- EC2 instances with IAM roles and security groups  
- IAM roles, policies, and instance profiles  
- Secure management via AWS Systems Manager (SSM)  

## Structure

- `vpc.tf` — Network components  
- `ec2.tf` — EC2 instance resources  
- `iam.tf` — IAM roles and policies  
- `key_pair.tf` — SSH key pair management  
- `outputs.tf` — Outputs for important resource info  
- `provider.tf` — AWS provider configuration  
- `variables.tf` — Variables definitions  

## Important

`terraform.tfvars` is excluded from version control as it contains sensitive environment-specific values like IP addresses and keys.

## Notes

This is a work in progress aiming for production-grade AWS infrastructure automation, built with best practices for security and maintainability.
# aws-infra-terraform

Modular, scalable Terraform AWS infrastructure for VPC, EC2, IAM, and security. Designed for extendable, production-ready deployments.

## Overview

This repository contains Terraform code to provision foundational AWS resources using a modular approach:

- VPC, Subnets, Internet Gateway, Route Tables  
- EC2 instances with IAM roles and security groups  
- IAM roles, policies, and instance profiles  
- Secure instance management via AWS Systems Manager (SSM)  

## Structure

- `modules/vpc/` — Network components (VPC, subnets, IGW, route tables, security groups)  
- `modules/ec2/` — EC2 instance resources  
- `modules/iam/` — IAM roles, policies, and instance profiles  
- `key_pair.tf` — SSH key pair management  
- `outputs.tf` — Outputs for important resource info  
- `provider.tf` — AWS provider configuration  
- `variables.tf` — Variable definitions  

## Important

- `terraform.tfvars` is excluded from version control as it contains sensitive, environment-specific values like IP addresses and keys.  
- The root folder contains only module calls and minimal glue code; all main resources are managed inside modules.  

## Notes

This repo is a work in progress for building production-grade, modular AWS infrastructure automation, following best practices for security and maintainability.
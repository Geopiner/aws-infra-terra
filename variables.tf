variable "my_ip" {
  description = "Your IP in CIDR format for SSH access"
  type        = string
}

variable "env_prefix" {
  description = "Environment name prefix (e.g. dev, prod)"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "key_name" {
  description = "Name for AWS key pair"
  type        = string
}

variable "public_key_location" {
  description = "Full path to SSH public key file"
  type        = string
}

variable "private_key_location" {
  description = "Full path to SSH private key file"
  type        = string
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "subnet_cidr_block" {
  description = "CIDR block for the subnet"
  type        = string
}

variable "avail_zone" {
  description = "AWS availability zone"
  type        = string
}

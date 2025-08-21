variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "security_group_id" {
  type = string
}

variable "availability_zone" {
  type = string
}

variable "key_name" {
  type = string
}

variable "private_key_location" {
  type = string
}

variable "env_prefix" {
  type = string
}

variable "iam_instance_profile" {
  type = string
}

variable "user_data" {
  type = string
}

variable "provisioner_inline" {
  type = list(string)
}
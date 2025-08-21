output "ec2_public_ip" {
  value = module.ec2.public_ip
}

output "ec2_instance_id" {
  value = module.ec2.instance_id
}

output "iam_instance_profile" {
  value = module.iam.instance_profile_name
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "subnet_id" {
  value = module.vpc.subnet_id
}

output "security_group_id" {
  value = module.vpc.security_group_id
}

output "ec2_ami_id" {
  description = "The AMI ID used to launch EC2"
  value       = data.aws_ami.latest_amazon_linux.id
}
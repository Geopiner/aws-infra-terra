output "ec2_public_ip" {
  description = "The public IP of the EC2 instance"
  value       = aws_instance.myapp_server.public_ip
}

output "ec2_instance_id" {
  description = "The instance ID of the EC2"
  value       = aws_instance.myapp_server.id
}

output "iam_instance_profile" {
  description = "Name of the IAM instance profile attached to EC2"
  value       = aws_iam_instance_profile.ec2_instance_profile.name
}

output "vpc_id" {
  description = "The VPC ID"
  value       = aws_vpc.myapp_vpc.id
}

output "subnet_id" {
  description = "The Subnet ID"
  value       = aws_subnet.myapp_subnet_1.id
}

output "security_group_id" {
  description = "The Security Group ID"
  value       = aws_security_group.myapp_sg.id
}

output "ec2_ami_id" {
  description = "The AMI ID used to launch EC2"
  value       = data.aws_ami.latest_amazon_linux.id
}
module "vpc" {
  source            = "./modules/vpc"
  vpc_cidr_block    = var.vpc_cidr_block
  subnet_cidr_block = var.subnet_cidr_block
  avail_zone        = var.avail_zone
  env_prefix        = var.env_prefix
  my_ip             = var.my_ip
}

module "iam" {
  source      = "./modules/iam"
  env_prefix  = var.env_prefix
}

module "ec2" {
  source               = "./modules/ec2"
  ami_id               = data.aws_ami.latest_amazon_linux.id
  instance_type        = var.instance_type
  subnet_id            = module.vpc.subnet_id
  security_group_id    = module.vpc.security_group_id
  availability_zone    = var.avail_zone
  key_name             = var.key_name
  private_key_location = var.private_key_location
  env_prefix           = var.env_prefix
  iam_instance_profile = module.iam.instance_profile_name
  user_data            = var.user_data
  provisioner_inline   = var.provisioner_inline
}

data "aws_ssm_parameter" "al2023_ami" {
  name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
}

data "aws_ami" "latest_amazon_linux" {
  filter {
    name   = "image-id"
    values = [data.aws_ssm_parameter.al2023_ami.value]
  }
  owners = ["amazon"]
}

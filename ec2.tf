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

resource "aws_instance" "myapp_server" {
    ami = data.aws_ami.latest_amazon_linux.id
    instance_type = var.instance_type
    subnet_id = aws_subnet.myapp_subnet_1.id
    vpc_security_group_ids = [aws_security_group.myapp_sg.id]
    availability_zone = var.avail_zone
    associate_public_ip_address = true
    key_name = var.key_name
    iam_instance_profile = aws_iam_instance_profile.ec2_instance_profile.name
    user_data = <<-EOF
      #!/bin/bash
      sudo dnf update -y
      sudo dnf install -y amazon-ssm-agent
      sudo systemctl enable amazon-ssm-agent
      sudo systemctl start amazon-ssm-agent
    EOF
    connection {
        type        = "ssh"
        host        = self.public_ip
        user        = "ec2-user"
        private_key = file(var.private_key_location)
    }
    provisioner "remote-exec" {
        inline = [
            "export ENV=${var.env_prefix}",
            "mkdir newdir"
        ]
    }
    tags = {
        Name = "${var.env_prefix}-server"
    }
}
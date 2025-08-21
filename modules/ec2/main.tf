resource "aws_instance" "this" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [var.security_group_id]
  availability_zone           = var.availability_zone
  associate_public_ip_address = true
  key_name                    = var.key_name
  iam_instance_profile        = var.iam_instance_profile

  user_data = var.user_data

  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ec2-user"
    private_key = file(var.private_key_location)
  }

  provisioner "remote-exec" {
    inline = var.provisioner_inline
  }

  tags = {
    Name = "${var.env_prefix}-server"
  }
}
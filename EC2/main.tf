# Bastion host creation
resource "aws_instance" "web" {
  ami                         = var.AMI_ID
  instance_type               = var.instance_type
  key_name                    = var.key_name
  vpc_security_group_ids      = [var.aws_SG_public_id]
  subnet_id                   = var.public_sub_01
  associate_public_ip_address = true
  tags = {
    Name = var.instance_name_public
  }
}

# Private instance 01 creation
resource "aws_instance" "server_01" {
  ami                    = var.AMI_ID
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [var.aws_SG_private_id]
  subnet_id              = var.private_sub_02
  tags = {
    Name = var.instance02_name_private
  }
}

# Private instance 02 creation
resource "aws_instance" "server_02" {
  ami                    = var.AMI_ID
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [var.aws_SG_private_id]
  subnet_id              = var.private_sub_02
  tags = {
    Name = var.instance03_name_private
  }
}

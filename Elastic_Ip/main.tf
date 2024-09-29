# creation of elastic IP1
resource "aws_eip" "EIP04" {
  tags = {
    Name = var.aws_eip_name
  }
}
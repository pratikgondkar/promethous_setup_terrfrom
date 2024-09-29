resource "aws_internet_gateway" "igw" {
  vpc_id = var.aws_vpc_id

  tags = {
    Name = var.aws_internet_gateway_tags
  }
}
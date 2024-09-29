# creation of public RT
resource "aws_route_table" "pub-Route01" {
  vpc_id = var.aws_vpc_id
 route  {
  cidr_block = "0.0.0.0/0"
  gateway_id = var.aws_internet_gateway_id
 }
  tags = {
    Name = var.publicRT_tags
  }
}
# creation of private RT
 resource "aws_route_table" "pri-Route02" {
  vpc_id = var.aws_vpc_id
 route  {
  cidr_block = "0.0.0.0/0"
  gateway_id = var.aws_nat_gateway_id
 }
  tags = {
    Name = var.privateRT_tags
  }
}
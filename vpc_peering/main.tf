#Data block
data "aws_vpc" "default_vpc" {
  default = true
}

resource "aws_vpc_peering_connection" "vpc_peering" {
  vpc_id        = data.aws_vpc.default_vpc.id              # ID of the VPC from which the peering is initiated
  peer_vpc_id   = var.vpc_id        # The actual ID of the peer VPC
  peer_region   = var.region_name          # If the peer VPC is in a different region
  tags = {
    Name = var.vpc_peering_name
  }
}

resource "aws_vpc_peering_connection_accepter" "accepter" {
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peering.id
  auto_accept               = true
}

data "aws_route_table" "default_RT" {
  vpc_id = data.aws_vpc.default_vpc.id
  filter {
    name = "association.main"
    values = [ "true" ]

  }
}

resource "aws_route" "default_rt" {
route_table_id = data.aws_route_table.default_RT.id
destination_cidr_block = var.tool_vpc_cidr_range
vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peering.id
  
}

resource "aws_route" "RT-1" {
  route_table_id =var.aws_publicRT_id
  destination_cidr_block = var.default_vpc_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peering.id

}
resource "aws_route" "RT-2" {
  route_table_id =var.aws_private_id
  destination_cidr_block = var.default_vpc_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peering.id

}

data "aws_security_group" "default_sg" {
  vpc_id = data.aws_vpc.default_vpc.id
  filter {
    name = "group-name"
    values = [ "default" ]
  }
}
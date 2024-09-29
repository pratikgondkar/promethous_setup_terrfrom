# public subnet-01 association
resource "aws_route_table_association" "public-subnet01-association" {
  subnet_id      = var.public_subnet01_assosiation_id
  route_table_id = var.publicRT_assosiation_id
}
# public subnet-02 association
resource "aws_route_table_association" "public-subnet02-association" {
  subnet_id      = var.public_subnet02_assosiation_id
  route_table_id = var.publicRT_assosiation_id
}
# private subnet-01 association
resource "aws_route_table_association" "private-subnet01-association" {
  subnet_id      = var.private_subnet01_assosiation_id
  route_table_id = var.privateRT_assosiation_id
}
# private subnet-02 association
resource "aws_route_table_association" "private-subnet02-association" {
  subnet_id      = var.private_subnet02_assosiation_id
  route_table_id = var.privateRT_assosiation_id
}

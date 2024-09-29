# creation of nat gateway01
resource "aws_nat_gateway" "Nat-gate01" {
connectivity_type = "public"
subnet_id         = var.aws_subnet_public
allocation_id = var.aws_eip_forNAT
tags = {
    Name = var.aws_nat_gateway_tags
  }
}
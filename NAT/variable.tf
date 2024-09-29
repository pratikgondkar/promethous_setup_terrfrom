variable "aws_nat_gateway_tags" {
  type = string
  default = "NAT04"
}

variable "aws_subnet_public" {
  type = string
}

variable "aws_eip_forNAT" {
  type = string
}
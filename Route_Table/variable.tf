variable "publicRT_tags" {
  type = string
  default = "publicRT"
}

variable "privateRT_tags" {
  type = string
  default = "privateRT"
} 

variable "aws_internet_gateway_id" {
  type = string
}

variable "aws_vpc_id" {
  type = string
}

variable "aws_nat_gateway_id" {
  type = string
}
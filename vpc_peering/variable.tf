variable "vpc_id" {
  type = string
}
variable "region_name" {
  type = string
  default = "ap-south-1"
  
}

variable "vpc_peering_name" {
  type = string
  default = "promethous_peering"
}

variable "tool_vpc_cidr_range" {
  type = string
  default = "10.0.0.0/17"
}

variable "aws_publicRT_id" {
  type = string
}

variable "aws_private_id" {
  type = string
} 
variable "default_vpc_cidr" {
  type = string
  default = "172.31.0.0/16"
}
variable "public_subnet-01_cidr" {
    type = string
    default = "10.0.1.0/24"
}

variable "public_subnet-01_tags" {
  type = string
  default = "public_subnet-01"
}

variable "public_subnet-02_cidr" {
    type = string
    default = "10.0.2.0/24"
}

variable "public_subnet-02_tags" {
  type = string
  default = "public_subnet-02"
}

variable "private_subnet-01_cidr" {
    type = string
    default = "10.0.3.0/24"
}

variable "private_subnet-01_tags" {
  type = string
  default = "private_subnet-01"
}

variable "private_subnet-02_cidr" {
    type = string
    default = "10.0.4.0/24"
}

variable "private_subnet-02_tags" {
  type = string
  default = "private_subnet-02"
}

variable "aws_vpc_id" {
  type = string
}
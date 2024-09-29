resource "aws_subnet" "public_subnet-01" {
  vpc_id     = var.aws_vpc_id
  cidr_block = var.public_subnet-01_cidr
  availability_zone = "ap-south-1a"

  tags = {
    Name = var.public_subnet-01_tags
  }
}

resource "aws_subnet" "public_subnet-02" {
  vpc_id     = var.aws_vpc_id
  cidr_block = var.public_subnet-02_cidr
  availability_zone = "ap-south-1b"

  tags = {
    Name = var.public_subnet-02_tags
  }
}


resource "aws_subnet" "private_subnet-01" {
  vpc_id     = var.aws_vpc_id
  cidr_block = var.private_subnet-01_cidr
  availability_zone = "ap-south-1a"

  tags = {
    Name = var.private_subnet-01_tags
  }
}

resource "aws_subnet" "private_subnet-02" {
  vpc_id     = var.aws_vpc_id
  cidr_block = var.private_subnet-02_cidr
  availability_zone = "ap-south-1b"

  tags = {
    Name = var.private_subnet-02_tags
  }
}
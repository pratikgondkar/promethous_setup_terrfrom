module "aws_vpc" {
  source = "./vpc"
  cidr_block = var.cidr_block
  tags = var.tags
}

# subnet 

module "aws_subnet" {
  source = "./subnet"
  aws_vpc_id = module.aws_vpc.aws_vpc_id
  public_subnet-01_cidr = var.public_subnet-01_cidr
  public_subnet-01_tags = var.public_subnet-01_tags
  public_subnet-02_cidr = var.public_subnet-02_cidr
  public_subnet-02_tags = var.public_subnet-02_tags
  private_subnet-01_cidr = var.private_subnet-01_cidr
  private_subnet-01_tags = var.private_subnet-01_tags
  private_subnet-02_cidr = var.private_subnet-02_cidr
  private_subnet-02_tags = var.private_subnet-02_tags

}

#IGW
module "aws_internet_gateway" {
  source = "./IGW"
  aws_vpc_id = module.aws_vpc.aws_vpc_id
  aws_internet_gateway_tags = var.aws_internet_gateway_tags
}

#Elastic-ip
module "aws_eip" {
  source = "./Elastic_Ip"
  aws_eip_name = var.aws_eip_name
}

#NAT Gateway
module "aws_nat_gateway" {
  source = "./NAT"
  aws_subnet_public = module.aws_subnet.public_subnet-01_id
  aws_eip_forNAT = module.aws_eip.aws_eip_id
  aws_nat_gateway_tags = var.aws_nat_gateway_tags
}


#Route Table
module "aws_route_table" {
  source = "./Route_Table"
  aws_vpc_id = module.aws_vpc.aws_vpc_id
  aws_internet_gateway_id = module.aws_internet_gateway.aws_internet_gateway_id
  publicRT_tags = var.publicRT_tags
  aws_nat_gateway_id = module.aws_nat_gateway.aws_nat_gateway_id
  privateRT_tags = var.privateRT_tags
}

# RouteTable Association
module "aws_route_table_association" {
  source = "./RT_Association"
  public_subnet01_assosiation_id = module.aws_subnet.public_subnet-01_id
  public_subnet02_assosiation_id = module.aws_subnet.public_subnet-02_id
  publicRT_assosiation_id = module.aws_route_table.aws_publicRT_id
  private_subnet01_assosiation_id = module.aws_subnet.private_subnet-01_id
  private_subnet02_assosiation_id = module.aws_subnet.private_subnet-02_id
  privateRT_assosiation_id = module.aws_route_table.aws_private_id
}

# Security Group
module "aws_security_group" {
  source = "./Security Group"
  aws_vpc = module.aws_vpc.aws_vpc_id
  aws_SG_public = var.aws_SG_public
  aws_SG_private = var.aws_SG_private
  vpc_id-01 = module.vpc_peering.vpc_id-01
}


#instance 
# EC2 instance module
module "aws_instance" {
  source                  = "./EC2"
  AMI_ID                  = var.AMI_ID
  instance_type           = var.instance_type
  key_name                = var.key_name
  instance_name_public    = var.instance_name_public
  instance02_name_private = var.instance02_name_private
  instance03_name_private = var.instance03_name_private
  public_sub_01           = module.aws_subnet.public_subnet-01_id
  private_sub_02          = module.aws_subnet.private_subnet-01_id
  aws_SG_public_id        = module.aws_security_group.aws_SG_public_id
  aws_SG_private_id       = module.aws_security_group.aws_SG_private_id
}

#Target Group
module "aws_lb_target_group" {
  source = "./Taget Group"
  tool-name = var.tool-name
  aws_vpc_id = module.aws_vpc.aws_vpc_id
}

# TG Attachement 
module "aws_lb_target_group_attachment" {
  source = "./TG Acttachement"
  port-num = var.port-num
  TG-arn = module.aws_lb_target_group.tg_arn
  aws_instance_server-1 = module.aws_instance.private_instance_id-01
  aws_instance_server-2 = module.aws_instance.private_instance_id-02
  
}

# ALB
module "aws_lb" {
  source = "./Application-Load-Balancer"
  ALB-Name = var.ALB-Name
  ALB-type = var.ALB-type
  SG-02_id = module.aws_security_group.aws_SG_private_id
  sub-pub-1-id = module.aws_subnet.public_subnet-01_id
  sub-pub-2-id = module.aws_subnet.public_subnet-02_id
}

# VPC peering 
module "vpc_peering" {
  source          = "./vpc_peering"
  vpc_id          = module.aws_vpc.aws_vpc_id
  region_name =  var.region_name
  vpc_peering_name =  var.vpc_peering_name
  tool_vpc_cidr_range = var.tool_vpc_cidr_range
  aws_publicRT_id = module.aws_route_table.aws_publicRT_id
  aws_private_id = module.aws_route_table.aws_private_id
  default_vpc_cidr = var.default_vpc_cidr

}

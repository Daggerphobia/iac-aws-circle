terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }

  backend "s3" {
    bucket = "teststateiac"
    key    = "Layer/scaffolding.state"
    region = "eu-central-1"
  }



}

provider "aws" {
  region = var.region
}


//Create a VPC with specific cidr
module "vpc" {
  source      = "./network/vpc"
  common_tags = local.common_tags
  name        = format("%s-%s", var.area, var.account_type)
  cidr        = var.cidr_block
}

//Create a Internet Gateway and attach to vpc
module "igw" {
  source      = "./network/gateways"
  common_tags = local.common_tags
  vpc_id      = module.vpc.vpc_id
  name        = format("%s-%s-IGW", var.area, var.account_type)
}

//Create a public, private subnets with multiple AZs prepared and tested
module "subnet" {
  source           = "./network/subnet"
  common_tags      = local.common_tags
  vpc_id           = module.vpc.vpc_id
  zones            = var.zones
  private_subnets  = var.private_subnets
  public_subnets   = var.public_subnets

  priv_name         = format("%s-%s-Private",var.area, var.account_type)
  pub_name          = format("%s-%s-Public",var.area, var.account_type)

}


module "natgw" {
 source           = "./network/nat_gateway"
 common_tags      = local.common_tags
 vpc_id           = module.vpc.vpc_id
 name             = format("%s-%s-NatGW", var.area, var.account_type)
#  public_subnet_id = var.natgw_public_subnet_id != "" ? var.natgw_public_subnet_id : module.subnet.public-subnets
 public_subnet_id = module.subnet.public-subnets
}

module "route-tables" {
 source                              = "./network/route_tables"
 common_tags                         = local.common_tags
 vpc_id                              = module.vpc.vpc_id
 internet_gw                         = module.igw.igw_id
 nat_gw                              = module.natgw.natgw_id
 zones                               = var.zones

 priv_name    = format("%s-%s-Private", var.area, var.account_type)
 priv_subnets = module.subnet.priv-subnets

 pub_name    = format("%s-%s-Public", var.area, var.account_type)
 pub_subnets = module.subnet.public-subnets
}
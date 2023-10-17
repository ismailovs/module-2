provider "aws" {
  region = "us-east-1"  # Change this to your desired region
}

module "vpc" {
  source          = "./vpc"
  vpc_cidr_block  = var.vpc_cidr_block
}

module "subnets" {
  source      = "./subnets"
  vpc_id      = module.vpc.vpc_id
  subnet_info = var.subnet_info
}
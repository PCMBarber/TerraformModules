provider "aws" {
    region = "eu-west-2"
    access_key = var.access_key
    secret_key = var.secret_key
}

module "ec2" {
    source          = "./ec2"
    net_id          = module.subnets.net_id
}
module "subnets" {
    source          = "./subnets"
    vpc_id          = module.vpc.vpc_id
    route_id        = module.vpc.route_id
    sec_group_id    = module.vpc.sec_group_id
    internet_gate   = module.vpc.internet_gate
}
module "vpc" {
    source          = "./vpc"
}
module "vpc" {
  source              = "./modules/vpc"
  vpc_name            = var.vpc_name
  vpc_ipv4_cidr_block = var.vpc_ipv4_cidr_block
  vpc_dns_support     = var.vpc_dns_support
  vpc_dns_hostnames   = var.vpc_dns_hostnames
}

module "subnets" {
  source            = "./modules/subnet"
  for_each          = var.subnets
  vpc_id            = module.vpc.vpc_id
  subnet_name       = each.key
  availability_zone = each.value.availability_zone
  ipv4_cidr_block   = each.value.ipv4_cidr_block
}

module "internet_gateway" {
  source = "./modules/internet_gateway"
  vpc_id = module.vpc.vpc_id
  internet_gateway_name = var.internet_gateway_name
}
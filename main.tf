module "vpc" {
  source                  = "./modules/vpc"
  vpc_name                = var.vpc_name
  vpc_ipv4_cidr_block     = var.vpc_ipv4_cidr_block
  request_ipv6_cidr_block = var.request_ipv6_cidr_block
  vpc_dns_support         = var.vpc_dns_support
  vpc_dns_hostnames       = var.vpc_dns_hostnames
}


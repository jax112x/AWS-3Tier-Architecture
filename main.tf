module "vpc" {
  source              = "./modules/vpc"
  vpc_name            = var.vpc_name
  vpc_ipv4_cidr_block = var.vpc_ipv4_cidr_block
  vpc_dns_support     = var.vpc_dns_support
  vpc_dns_hostnames   = var.vpc_dns_hostnames
}

module "internet_gateway" {
  source                = "./modules/internet_gateway"
  vpc_id                = module.vpc.id
  internet_gateway_name = var.internet_gateway_name
}

module "ig_route_table" {
  source              = "./modules/route_table"
  vpc_id              = module.vpc.id
  name                = var.ig_route_table_name
  internet_gateway_id = module.internet_gateway.id
  routes              = var.ig_route_table_routes
  subnet_association_ids = [
    for k,v in var.ig_route_table_subnet_associations : local.modules[v].id
  ]
}

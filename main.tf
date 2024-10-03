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
  nat_gateway_id = null
  routes              = var.ig_route_table_routes
  subnet_association_ids = [
    for k, v in var.ig_route_table_subnet_associations : local.modules[v].id
  ]
}

module "eip_ng_a" {
  source = "./modules/elastic_ip"
  name   = var.eip_ng_a_name
}

module "nat_gateway_a" {
  source                   = "./modules/nat_gateway"
  elastic_ip_allocation_id = module.eip_ng_a.allocation_id
  connectivity_type        = var.nat_gateway_a["connectivity_type"]
  subnet_id                = module.sn_web_a.id
  name                     = var.nat_gateway_a["name"]
}

module "ng_a_route_table" {
  source              = "./modules/route_table"
  vpc_id              = module.vpc.id
  name                = var.ng_a_route_table_name
  nat_gateway_id = module.nat_gateway_a.id
  internet_gateway_id = null
  routes              = var.ng_a_route_table_routes
  subnet_association_ids = [
    for k, v in var.ng_a_route_table_subnet_associations : local.modules[v].id
  ]
}

module "eip_ng_b" {
  source = "./modules/elastic_ip"
  name   = var.eip_ng_b_name
}

module "nat_gateway_b" {
  source                   = "./modules/nat_gateway"
  elastic_ip_allocation_id = module.eip_ng_b.allocation_id
  connectivity_type        = var.nat_gateway_b["connectivity_type"]
  subnet_id                = module.sn_web_b.id
  name                     = var.nat_gateway_b["name"]
}

module "ng_b_route_table" {
  source              = "./modules/route_table"
  vpc_id              = module.vpc.id
  name                = var.ng_b_route_table_name
  nat_gateway_id = module.nat_gateway_b.id
  internet_gateway_id = null
  routes              = var.ng_b_route_table_routes
  subnet_association_ids = [
    for k, v in var.ng_b_route_table_subnet_associations : local.modules[v].id
  ]
}
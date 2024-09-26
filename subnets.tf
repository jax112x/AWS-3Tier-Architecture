module "sn_web_a" {
  source            = "./modules/subnet"
  vpc_id            = module.vpc.id
  subnet_name       = "3t-sn-web-a"
  availability_zone = var.subnets["sn_web_a"].availability_zone
  ipv4_cidr_block   = var.subnets["sn_web_a"].ipv4_cidr_block
}

module "sn_app_a" {
  source            = "./modules/subnet"
  vpc_id            = module.vpc.id
  subnet_name       = "3t-sn-app-a"
  availability_zone = var.subnets["sn_app_a"].availability_zone
  ipv4_cidr_block   = var.subnets["sn_app_a"].ipv4_cidr_block
}

module "sn_db_a" {
  source            = "./modules/subnet"
  vpc_id            = module.vpc.id
  subnet_name       = "3t-sn-db-a"
  availability_zone = var.subnets["sn_db_a"].availability_zone
  ipv4_cidr_block   = var.subnets["sn_db_a"].ipv4_cidr_block
}

module "sn_web_b" {
  source            = "./modules/subnet"
  vpc_id            = module.vpc.id
  subnet_name       = "3t-sn-web-b"
  availability_zone = var.subnets["sn_web_b"].availability_zone
  ipv4_cidr_block   = var.subnets["sn_web_b"].ipv4_cidr_block
}

module "sn_app_b" {
  source            = "./modules/subnet"
  vpc_id            = module.vpc.id
  subnet_name       = "3t-sn-app-b"
  availability_zone = var.subnets["sn_app_b"].availability_zone
  ipv4_cidr_block   = var.subnets["sn_app_b"].ipv4_cidr_block
}

module "sn_db_b" {
  source            = "./modules/subnet"
  vpc_id            = module.vpc.id
  subnet_name       = "3t-sn-db-b"
  availability_zone = var.subnets["sn_db_b"].availability_zone
  ipv4_cidr_block   = var.subnets["sn_db_b"].ipv4_cidr_block
}
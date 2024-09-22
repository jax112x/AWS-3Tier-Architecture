resource "aws_vpc" "vpc" {
    cidr_block = var.vpc_ipv4_cidr_block
    assign_generated_ipv6_cidr_block = var.request_ipv6_cidr_block
    enable_dns_support = var.vpc_dns_support
    enable_dns_hostnames = var.vpc_dns_hostnames
    
    tags = {
      Name : var.vpc_name
    }
}
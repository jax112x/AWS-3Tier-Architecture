variable "vpc_ipv4_cidr_block" {
  type        = string
  description = "IPv4 CIDR range for VPC"
}

variable "request_ipv6_cidr_block" {
  type        = bool
  description = "Request AWS IPv6 CIDR Block"
}

variable "vpc_dns_support" {
  type        = bool
  description = "Enable/Disable DNS support for VPC"
}

variable "vpc_dns_hostnames" {
  type        = bool
  description = "Enable/Disable DNS hostnames for VPC"
}

variable "vpc_name" {
  type        = string
  description = "VPC name"
}


variable "vpc_id" {
 type = string
 description = "VPC Id"
}

variable "ipv4_cidr_block" {
  type = string
  description = "IPv4 CIdR block for subnet"
}

variable "subnet_name" {
    type = string
    description = "Subnet Name"
}

variable "availability_zone" {
    type = string
    description = "Availabilty Zone in which subnet should be deployed"
}

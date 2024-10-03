variable "elastic_ip_allocation_id" {
  type = string
  description = "Elastic IP Allocation ID"
}

variable "connectivity_type" {
    type = string
    description = "Public/Private Connectivity"
}

variable "subnet_id" {
    type = string
    description = "ID of subnet to place NAT gateway in"
}

variable "name" {
    type = string
    description = "Name of NAT Gateway"
}


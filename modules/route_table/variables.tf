variable "vpc_id" {
  type = string
  description = "VPC Id"
}

variable "name" {
  type = string
  description = "Name of the Routing Table"
}

variable "internet_gateway_id" {
  type = string
  description = "Internet Gateway Id"
  nullable = true
}

variable "nat_gateway_id" {
  type = string
  description = "Nat Gateway Id"
  nullable = true
}

variable "routes" {
  type = map(object({
    destination = string
    # target = string
  }))
  description = "Route destinations and targets"
}

variable "subnet_association_ids" {
  type = list(string)
  description = "Subnet Ids"
}
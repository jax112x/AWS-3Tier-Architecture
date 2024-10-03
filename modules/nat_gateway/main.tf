resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = var.elastic_ip_allocation_id
  connectivity_type = var.connectivity_type
  subnet_id = var.subnet_id
  tags = {
    Name : var.name
  }
}
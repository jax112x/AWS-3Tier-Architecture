resource "aws_route_table" "route_table" {
  vpc_id = var.vpc_id
  tags = {
    Name : var.name
  }
}

resource "aws_route" "route" {
    for_each = var.routes
    route_table_id = aws_route_table.route_table.id
    destination_cidr_block = each.value.destination
    gateway_id = var.internet_gateway_id
    nat_gateway_id = var.nat_gateway_id
}

resource "aws_route_table_association" "subnet_associations" {
    route_table_id = aws_route_table.route_table.id
    count = length(var.subnet_association_ids)
    subnet_id = var.subnet_association_ids[count.index]
}
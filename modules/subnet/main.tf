resource "aws_subnet" "subnet" {
  vpc_id = var.vpc_id
  cidr_block = var.ipv4_cidr_block
  availability_zone = var.availability_zone
  tags = {
    Name = var.subnet_name
  }
}
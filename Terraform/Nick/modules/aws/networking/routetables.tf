
resource "aws_default_route_table" "private_rt" {
  default_route_table_id = aws_vpc.cashmoney_vpc.default_route_table_id

  tags = {
    Name        = "cashmoney-private-rt"
    Environment = var.environment
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.cashmoney_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gateway.id
  }

  tags = {
    Name        = "cashmoney-public-rt"
    Environment = var.environment
  }
}

resource "aws_route" "private_r" {
  route_table_id         = aws_default_route_table.private_rt.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat.id
}

resource "aws_route_table_association" "public_rt_associations" {
  count = length(aws_subnet.public_subnets)

  subnet_id      = aws_subnet.public_subnets[count.index].id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "private_rt_associations" {
  count = length(aws_subnet.private_subnets)

  subnet_id      = aws_subnet.private_subnets[count.index].id
  route_table_id = aws_default_route_table.private_rt.id
}

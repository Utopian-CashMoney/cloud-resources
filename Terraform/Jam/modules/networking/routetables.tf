
resource "aws_default_route_table" "public_rt" {
  default_route_table_id = aws_vpc.cashmoney_vpc_dev.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gateway.id
  }

  tags = {
    Name = "cashmoney-rt-public-jam"
    Environment = "ucm-dev"
  }
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.cashmoney_vpc_dev.id

  route = []

  tags = {
    Name = "cashmoney-rt-private-jam"
    Environment = "ucm-dev"
  }
}

resource "aws_route" "private_r" {
  route_table_id         = aws_route_table.private_rt.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat.id
}

resource "aws_route_table_association" "public_2a" {
  subnet_id      = aws_subnet.public_2a.id
  route_table_id = aws_default_route_table.public_rt.id
}

resource "aws_route_table_association" "public_2b" {
  subnet_id      = aws_subnet.public_2b.id
  route_table_id = aws_default_route_table.public_rt.id
}

resource "aws_route_table_association" "private_2a" {
  subnet_id      = aws_subnet.private_2a.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "private_2b" {
  subnet_id      = aws_subnet.private_2b.id
  route_table_id = aws_route_table.private_rt.id
}


resource "aws_internet_gateway" "gateway" {
  vpc_id = aws_vpc.cashmoney_vpc_dev.id

  tags = {
    Name = "cashmoney-gateway-jam"
  }
}

resource "aws_nat_gateway" "nat" {
  connectivity_type = "private"
  subnet_id         = aws_subnet.private_2a.id

  tags = {
    Name = "cashmoney-nat-jam"
  }
}

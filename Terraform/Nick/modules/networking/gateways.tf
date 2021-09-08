
resource "aws_internet_gateway" "gateway" {
  vpc_id = aws_vpc.cashmoney_vpc.id

  tags = {
    Name = "cashmoney"
  }
}

resource "aws_nat_gateway" "nat" {
  connectivity_type = "private"
  subnet_id         = aws_subnet.private_1a.id

  tags = {
    Name = "cashmoney-nat"
  }
}

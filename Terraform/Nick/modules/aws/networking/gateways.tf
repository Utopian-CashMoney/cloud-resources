
resource "aws_internet_gateway" "gateway" {
  vpc_id = aws_vpc.cashmoney_vpc.id

  tags = {
    Name        = "cashmoney-${var.environment}"
    Environment = var.environment
  }
}

resource "aws_nat_gateway" "nat" {
  connectivity_type = "private"
  subnet_id         = aws_subnet.private_subnets[0].id

  tags = {
    Name        = "cashmoney-nat-${var.environment}"
    Environment = var.environment
  }
}

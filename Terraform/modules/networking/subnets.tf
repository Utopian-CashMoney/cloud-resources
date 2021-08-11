
resource "aws_subnet" "public_1a" {
  vpc_id                  = aws_vpc.cashmoney_vpc.id
  cidr_block              = var.subnet_cidr_block_public_1a
  availability_zone       = var.subnet_zone_1
  map_public_ip_on_launch = true

  tags = {
    Name = "cashmoney-public-1a"
  }
}

resource "aws_subnet" "public_1b" {
  vpc_id                  = aws_vpc.cashmoney_vpc.id
  cidr_block              = var.subnet_cidr_block_public_1b
  availability_zone       = var.subnet_zone_2
  map_public_ip_on_launch = true

  tags = {
    Name = "cashmoney-public-1b"
  }
}

resource "aws_subnet" "private_1a" {
  vpc_id            = aws_vpc.cashmoney_vpc.id
  cidr_block        = var.subnet_cidr_block_private_1a
  availability_zone = var.subnet_zone_1

  tags = {
    Name = "cashmoney-private-1a"
  }
}

resource "aws_subnet" "private_1b" {
  vpc_id            = aws_vpc.cashmoney_vpc.id
  cidr_block        = var.subnet_cidr_block_private_1b
  availability_zone = var.subnet_zone_2

  tags = {
    Name = "cashmoney-private-1b"
  }
}

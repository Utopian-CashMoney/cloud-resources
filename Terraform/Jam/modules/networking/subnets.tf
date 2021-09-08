
resource "aws_subnet" "public_2a" {
  vpc_id                  = aws_vpc.cashmoney_vpc_dev.id
  cidr_block              = var.subnet_cidr_block_public_2a
  availability_zone       = var.subnet_zone_1
  map_public_ip_on_launch = true

  tags = {
    Name = "cashmoney-public-2a-jam"
    Environment = "ucm-dev"
  }
}

resource "aws_subnet" "public_2b" {
  vpc_id                  = aws_vpc.cashmoney_vpc_dev.id
  cidr_block              = var.subnet_cidr_block_public_2b
  availability_zone       = var.subnet_zone_2
  map_public_ip_on_launch = true

  tags = {
    Name = "cashmoney-public-2b-jam"
    Environment = "ucm-dev"
  }
}

resource "aws_subnet" "private_2a" {
  vpc_id            = aws_vpc.cashmoney_vpc_dev.id
  cidr_block        = var.subnet_cidr_block_private_2a
  availability_zone = var.subnet_zone_1

  tags = {
    Name = "cashmoney-private-2a-jam"
    Environment = "ucm-dev"
  }
}

resource "aws_subnet" "private_2b" {
  vpc_id            = aws_vpc.cashmoney_vpc_dev.id
  cidr_block        = var.subnet_cidr_block_private_2b
  availability_zone = var.subnet_zone_2

  tags = {
    Name = "cashmoney-private-2b-jam"
    Environment = "ucm-dev"
  }
}


data "aws_availability_zones" "zones" {
  state = "available"
}

resource "aws_subnet" "public_subnets" {
  count = length(var.public_subnet_cidrs)

  vpc_id                  = aws_vpc.cashmoney_vpc.id
  cidr_block              = var.public_subnet_cidrs[count.index]
  availability_zone       = element(data.aws_availability_zones.zones.names, count.index)
  map_public_ip_on_launch = true

  tags = {
    Name        = "public-${count.index + 1}"
    Environment = var.environment
  }
}

resource "aws_subnet" "private_subnets" {
  count = length(var.private_subnet_cidrs)

  vpc_id            = aws_vpc.cashmoney_vpc.id
  cidr_block        = var.private_subnet_cidrs[count.index]
  availability_zone = element(data.aws_availability_zones.zones.names, count.index)

  tags = {
    Name        = "private-${count.index + 1}"
    Environment = var.environment
  }
}

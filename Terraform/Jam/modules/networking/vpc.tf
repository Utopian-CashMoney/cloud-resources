
resource "aws_vpc" "cashmoney_vpc_dev" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = "cashmoney-dev-jam"
    Environment = "ucm-dev"
  }
}

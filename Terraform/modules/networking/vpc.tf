
resource "aws_vpc" "cashmoney_vpc" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = "cashmoney"
  }
}

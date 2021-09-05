
output "cashmoney_vpc" {
  value = aws_vpc.cashmoney_vpc
}

output "private_subnet_ids" {
  value = [aws_subnet.private_1a.id, aws_subnet.private_1b.id]
}

output "public_subnet_ids" {
  value = [aws_subnet.public_1a.id, aws_subnet.public_1b.id]
}

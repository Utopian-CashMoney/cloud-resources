
output "cashmoney_vpc_id" {
  value = aws_vpc.cashmoney_vpc_dev.id
}

output "private_subnet_ids" {
  value = [aws_subnet.private_2a.id, aws_subnet.private_2b.id]
}

output "public_subnet_ids" {
  value = [aws_subnet.public_2a.id, aws_subnet.public_2b.id]
}

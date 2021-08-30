
resource "aws_ecr_repository" "repository" {
  name = var.service_name
}

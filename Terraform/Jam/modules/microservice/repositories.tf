resource "aws_ecr_repository" "repository" {
  repository_name = var.service_name
}

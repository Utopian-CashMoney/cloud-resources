
# Microservice repository resources

resource "aws_ecrpublic_repository" "repository" {
  repository_name = var.service_name
}

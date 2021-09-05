
resource "aws_ecs_cluster" "microservices" {
  name = var.cluster_name

  capacity_providers = ["FARGATE_SPOT", "FARGATE"]

  default_capacity_provider_strategy {
    capacity_provider = "FARGATE_SPOT"
  }

  setting {
    name  = "containerInsights"
    value = "disabled"
  }

  tags = {
    "com.docker.compose.project" = var.cluster_name
  }
}

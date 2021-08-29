
resource "aws_ecs_cluster" "microservices" {
  name = var.cluster_name

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}

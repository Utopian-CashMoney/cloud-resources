resource "aws_ecs_task_definition" "task-def" {
  family                   = "service"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.task_cpu
  memory                   = var.task_memory
  execution_role_arn       = var.task_execution_role_arn
  container_definitions = jsonencode([
    {
      name      = var.service_name
      image     = aws_ecr_repository.repository.repository_uri
      essential = true
      portMappings = [
        {
          containerPort = var.container_port
        }
      ]
    }
  ])
}

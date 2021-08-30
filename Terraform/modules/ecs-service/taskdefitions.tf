
// Cloudformation this

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
      image     = aws_ecr_repository.repository.repository_url
      essential = true
      portMappings = [
        {
          containerPort = var.container_port
        }
      ]
      logConfiguration = [
        {
          Options = [
            {
              awslogs-group = aws_cloudwatch_log_group.logs
            }
          ]
        }
      ]
    }
  ])
}

resource "aws_cloudwatch_log_group" "logs" {
  name = "TDLogs"

  tags = {
    Environment = "development"
    Application = var.service_name
  }
}

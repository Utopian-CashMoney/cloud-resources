
# Microservice repository resources

resource "aws_ecrpublic_repository" "repository" {
  repository_name = var.service_name
}

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
      image     = aws_ecrpublic_repository.repository.repository_uri
      essential = true
      portMappings = [
        {
          containerPort = var.container_port
        }
      ]
    }
  ])
}

resource "aws_lb_target_group" "target-group" {
  name        = var.service_name
  port        = var.container_port
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = var.cashmoney_vpc_id
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = var.alb_arn
  port              = var.container_port
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target-group.arn
  }
}

resource "aws_ecs_service" "service" {
  name            = var.service_name
  cluster         = var.cluster_id
  task_definition = aws_ecs_task_definition.task-def.arn
  desired_count   = var.task_count
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = var.private_subnet_ids
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.target-group.arn
    container_name   = var.service_name
    container_port   = var.container_port
  }
}


# Microservice repository resources

resource "aws_ecr_repository" "accounts_ms" {
  name = "accounts_ms"
}

resource "aws_ecr_repository" "branches_ms" {
  name = "branches_ms"
}

resource "aws_ecr_repository" "user_ms" {
  name = "user_ms"
}

# Microservice ECS cluster services

resource "aws_ecs_cluster" "microservices" {
  name = "cashmoney-microservices"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}

resource "aws_iam_role" "ecsExecution" {
  name               = "ecsExecutionRole"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": [
          "ec2.amazonaws.com"
        ]
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "ec2-container-service-attachment" {
  role       = aws_iam_role.ecsExecution.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}

resource "aws_iam_role_policy_attachment" "ssm-managed-instance-attachment" {
  role       = aws_iam_role.ecsExecution.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_ecs_task_definition" "user_ms" {
  family                   = "service"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 256
  memory                   = 512
  execution_role_arn       = aws_iam_role.ecsExecution.arn
  container_definitions = jsonencode([
    {
      name      = "user_ms"
      image     = aws_ecr_repository.user_ms.repository_url
      essential = true
      portMappings = [
        {
          containerPort = 8000
        }
      ]
    }
  ])
}

resource "aws_lb" "alb" {
  name               = "cashmoney-alb"
  internal           = true
  load_balancer_type = "application"
  subnets            = var.private_subnet_ids

  enable_deletion_protection = false
}

resource "aws_lb_target_group" "user_ms" {
  name        = "user-ms"
  port        = 8000
  protocol    = "TCP"
  target_type = "ip"
  vpc_id      = var.cashmoney_vpc_id
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "8000"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.user_ms.arn
  }
}

resource "aws_ecs_service" "user_ms" {
  name            = "user-ms"
  cluster         = aws_ecs_cluster.microservices.id
  task_definition = aws_ecs_task_definition.user_ms.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  load_balancer {
    target_group_arn = aws_lb_target_group.user_ms.arn
    container_name   = "user_ms"
    container_port   = 8000
  }
}

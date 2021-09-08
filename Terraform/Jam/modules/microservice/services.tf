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


resource "aws_lb_target_group" "target-group" {
  name        = var.service_name
  port        = var.container_port
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = var.cashmoney_vpc_id

  health_check {
    path = "/actuator/info"
  }
}

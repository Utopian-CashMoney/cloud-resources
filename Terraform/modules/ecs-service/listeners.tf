
resource "aws_lb_listener" "listener" {
  load_balancer_arn = var.alb_arn
  port              = var.container_port
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target-group.arn
  }
}

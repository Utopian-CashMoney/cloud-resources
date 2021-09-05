
resource "aws_lb_target_group" "drop-traffic" {
  name        = "ucm-drop-traffic"
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = var.cashmoney_vpc.id
}

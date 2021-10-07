
resource "aws_lb" "alb" {
  name               = "cashmoney-${var.environment}-alb"
  internal           = var.is_private
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = var.subnet_ids
}

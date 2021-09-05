
resource "aws_lb" "alb" {
  name               = "cashmoney-alb"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = var.private_subnet_ids
}

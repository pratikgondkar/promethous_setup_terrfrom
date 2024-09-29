# creating target group
resource "aws_lb_target_group" "test" {
  name     = var.tool-name
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.aws_vpc_id
   health_check {
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
  }
}


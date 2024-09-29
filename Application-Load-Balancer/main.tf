# Application Load Balancer
resource "aws_lb" "Promethous-alb" {
  name               = var.ALB-Name
  internal           = false
  load_balancer_type = var.ALB-type
  security_groups    = [var.SG-02_id]
  subnets            = [var.sub-pub-1-id , var.sub-pub-2-id]
}

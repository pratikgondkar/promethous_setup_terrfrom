# register target
resource "aws_lb_target_group_attachment" "test-01" {
  target_group_arn = var.TG-arn
  target_id        = var.aws_instance_server-1
  port             = var.port-num
}
resource "aws_lb_target_group_attachment" "test-02" {
  target_group_arn = var.TG-arn
  target_id        = var.aws_instance_server-2
  port             = var.port-num
}
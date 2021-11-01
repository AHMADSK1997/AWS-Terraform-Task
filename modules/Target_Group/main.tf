# Create target group
resource "aws_lb_target_group" "nginx_tg" {
  name               = "nginx-tg"
  port               = 80
  protocol           = "HTTP"
  vpc_id   = "vpc-7b843e02"
}

# attach instances to target group
resource "aws_lb_target_group_attachment" "test" {
  target_group_arn = aws_lb_target_group.nginx_tg.arn
  target_id        = var.instance_one_id
  port             = 80
}
resource "aws_lb_target_group_attachment" "test2" {
  target_group_arn = aws_lb_target_group.nginx_tg.arn
  target_id        = var.instance_two_id
  port             = 80
}
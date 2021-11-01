# get subnet ids in the default VPC
data "aws_subnet_ids" "this" {
  vpc_id = "vpc-7b843e02"
}

# Create Application load balancer
resource "aws_lb" "test-alb" {
  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.security_group_id]
  subnets            = data.aws_subnet_ids.this.ids

  enable_deletion_protection = true


  tags = {
    Name = "my-test-alb"
  }
}

# add listener to ALB and set the action to forward to the target group we've created .
resource "aws_lb_listener" "my-test-alb-listner" {
  load_balancer_arn = "${aws_lb.test-alb.arn}"
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = var.target_group_arn
  }
}

# AWS Load Balancer
resource "aws_lb" "web" {
  name               = "Django-ELB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb_security.id]

  subnets = module.vpc.public_subnets

  tags = {
    Name = "Load Balancer"
  }
}

resource "aws_lb_listener" "as_group" {
  load_balancer_arn = aws_lb.web.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.as_group.arn
  }
}

resource "aws_lb_target_group" "as_group" {
  name        = "asg-lab"
  port        = 8000
  protocol    = "HTTP"
  vpc_id      = module.vpc.vpc_id
  target_type = "ip"
}

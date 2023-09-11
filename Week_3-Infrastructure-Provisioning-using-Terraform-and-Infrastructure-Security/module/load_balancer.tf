# AWS Load Balancer
resource "aws_lb" "web" {
  name               = "WebServer-ELB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb_security.id]
  subnets            = [aws_default_subnet.default_az1.id, aws_default_subnet.default_az2.id, aws_default_subnet.default_az3.id]

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
  name     = "asg-lab"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_default_vpc.default.id
}

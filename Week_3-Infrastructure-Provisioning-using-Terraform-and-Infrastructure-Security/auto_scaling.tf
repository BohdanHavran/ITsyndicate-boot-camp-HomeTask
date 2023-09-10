# AWS autoscaling
resource "aws_autoscaling_group" "web" {
  name                 = "AS-${aws_launch_configuration.web.name}"
  launch_configuration = aws_launch_configuration.web.name
  min_size             = 1
  max_size             = 3
  desired_capacity     = 2
  vpc_zone_identifier  = [aws_default_subnet.default_az1.id, aws_default_subnet.default_az2.id, aws_default_subnet.default_az3.id]
  health_check_type    = "ELB"
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_policy" "up" {
  name                   = "${aws_launch_configuration.web.name}_up"
  autoscaling_group_name = aws_autoscaling_group.web.name
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = 1
  cooldown               = 30
}

resource "aws_autoscaling_policy" "down" {
  name                   = "${aws_launch_configuration.web.name}_down"
  autoscaling_group_name = aws_autoscaling_group.web.name
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = -1
  cooldown               = 30
}

resource "aws_autoscaling_attachment" "aasa" {
  autoscaling_group_name = aws_autoscaling_group.web.id
  lb_target_group_arn    = aws_lb_target_group.as_group.arn
}

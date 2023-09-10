# AWS cloudwatch
resource "aws_cloudwatch_metric_alarm" "Request_Count_up" {
  alarm_name          = "${aws_launch_configuration.web.name}_RequestCount_up"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "RequestCount"
  namespace           = "AWS/ApplicationELB"
  period              = 60
  statistic           = "Sum"
  threshold           = 300
  alarm_description   = "RequestCount is greater than or equal to 300 for 30 seconds."
  alarm_actions       = [aws_autoscaling_policy.up.arn]

  dimensions = {
    LoadBalancer = aws_lb.web.arn_suffix
    TargetGroup  = aws_lb_target_group.as_group.arn_suffix
  }
}

resource "aws_cloudwatch_metric_alarm" "Request_Count_down" {
  alarm_name          = "${aws_launch_configuration.web.name}_RequestCount_down"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "RequestCount"
  namespace           = "AWS/ApplicationELB"
  period              = 60
  statistic           = "Sum"
  threshold           = 10
  alarm_description   = "RequestCount is less than or equal to 10 for 30 seconds."
  alarm_actions       = [aws_autoscaling_policy.down.arn]

  dimensions = {
    LoadBalancer = aws_lb.web.arn_suffix
    TargetGroup  = aws_lb_target_group.as_group.arn_suffix
  }
}

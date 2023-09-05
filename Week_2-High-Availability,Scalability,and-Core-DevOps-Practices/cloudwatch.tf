# AWS cloudwatch
resource "aws_cloudwatch_metric_alarm" "Request_Count_up" {
  alarm_name          = "${aws_launch_configuration.web.name}_RequestCount"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "RequestCount"
  namespace           = "AWS/${aws_launch_configuration.web.name}"
  period              = 60
  statistic           = "Sum"
  threshold           = 300
  alarm_description   = "RequestCount is greater than or equal to 300 for 30 seconds."
  alarm_actions       = [aws_autoscaling_policy.up.arn]

  dimensions = {
    elb = aws_elb.web.arn
  }
}

resource "aws_cloudwatch_metric_alarm" "Request_Count_down" {
  alarm_name          = "${aws_launch_configuration.web.name}_RequestCount"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "RequestCount"
  namespace           = "AWS/${aws_launch_configuration.web.name}"
  period              = 60
  statistic           = "Sum"
  threshold           = 10
  alarm_description   = "RequestCount is less than or equal to 10 for 30 seconds."
  alarm_actions       = [aws_autoscaling_policy.down.arn]

  dimensions = {
    elb = aws_elb.web.arn
  }
}


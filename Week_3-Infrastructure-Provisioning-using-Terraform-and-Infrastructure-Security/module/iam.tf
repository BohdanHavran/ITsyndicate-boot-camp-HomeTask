resource "aws_iam_user_policy" "iam_policy" {
  name = "${var.iam_user}_policy"
  user = aws_iam_user.iam.name

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        "Action" : [
          "ec2:Describe*"
        ],
        Effect   = "Allow"
        Resource = "*"
      },
      {
        "Action" : [
          "elasticloadbalancing:DescribeLoadBalancers"
        ],
        Effect   = "Allow"
        Resource = "*"
      },
      {
        "Action" : [
          "iam:GenerateCredentialReport",
          "iam:GenerateServiceLastAccessedDetails",
          "iam:Get*",
          "iam:List*",
          "iam:SimulateCustomPolicy",
          "iam:SimulatePrincipalPolicy"
        ],
        Effect   = "Allow"
        Resource = "*"
      },
      {
        "Action" : [
          "cloudwatch:DescribeAlarmsForMetric",
          "cloudwatch:DescribeAlarmHistory",
          "cloudwatch:DescribeAlarms",
          "cloudwatch:ListMetrics",
          "cloudwatch:GetMetricStatistics",
          "cloudwatch:GetMetricData",
          "cloudwatch:GetInsightRuleReport"
        ],
        Effect   = "Allow"
        Resource = "*"
      },
      {
        "Action" : [
          "autoscaling:Describe*",
        ],
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_user" "iam" {
  name          = "${var.iam_user}_user"
  force_destroy = true
}

# resource "aws_iam_access_key" "lb" {
#   user = aws_iam_user.lb.name
# }

resource "aws_iam_user_login_profile" "iam_user_login" {
  user            = aws_iam_user.iam.name
  password_length = 12
}

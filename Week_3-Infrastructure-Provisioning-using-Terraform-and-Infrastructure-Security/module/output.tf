# Output
output "web_loadbalancer_url" {
  value = aws_lb.web.dns_name
}
output "IAM" {
  value = {
    password = aws_iam_user_login_profile.iam_user_login.password
    username = aws_iam_user.iam.name
  }
}

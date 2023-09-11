# ELC
resource "aws_launch_configuration" "web" {
  name_prefix     = "Webapplication-Docker"
  image_id        = data.aws_ami.ubuntu.id
  instance_type   = var.instance_type
  security_groups = [aws_security_group.Webapplication_security.id]
  user_data       = file(var.user_data)
  key_name        = var.key_name
  lifecycle {
    create_before_destroy = true
  }
}

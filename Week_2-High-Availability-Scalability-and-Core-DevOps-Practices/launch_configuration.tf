# ELC
resource "aws_launch_configuration" "web" {
  name_prefix     = "Webapplication-Docker"
  image_id        = data.aws_ami.ubuntu.id
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.Webapplication_security.id]
  key_name        = "id_rsa"
  user_data       = file("user_data.sh")
  lifecycle {
    create_before_destroy = true
  }
}


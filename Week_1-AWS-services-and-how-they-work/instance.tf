# EC2 Instance
resource "aws_instance" "instance1" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.subnet1.id
  security_groups = [aws_security_group.instance1_security.id]
  user_data       = file("user_data.sh")
  key_name        = "id_rsa"
  tags = {
    Name = "instance1"
  }
}
resource "aws_instance" "instance2" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.subnet2.id
  security_groups = [aws_security_group.instance2_security.id]
  user_data       = file("user_data.sh")
  key_name        = "id_rsa"
  tags = {
    Name = "instance2"
  }
}

resource "aws_instance" "instance3" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.subnet3.id
  security_groups = [aws_security_group.instance3_security.id]
  user_data       = file("user_data.sh")
  key_name        = "id_rsa"
  tags = {
    Name = "instance3"
  }
}

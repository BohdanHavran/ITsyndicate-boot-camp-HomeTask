# Subnet
resource "aws_subnet" "subnet1" {
  cidr_block              = "10.0.0.0/24"
  vpc_id                  = aws_vpc.vpc1.id
  map_public_ip_on_launch = true
}

resource "aws_subnet" "subnet2" {
  cidr_block              = "10.1.0.0/24"
  vpc_id                  = aws_vpc.vpc2.id
  map_public_ip_on_launch = true
}

resource "aws_subnet" "subnet3" {
  cidr_block              = "10.2.0.0/24"
  vpc_id                  = aws_vpc.vpc3.id
  map_public_ip_on_launch = true
}

# VPC
resource "aws_vpc" "vpc1" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "vpc1"
  }
}
resource "aws_vpc" "vpc2" {
  cidr_block           = "10.1.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "vpc2"
  }
}

resource "aws_vpc" "vpc3" {
  cidr_block           = "10.2.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "vpc3"
  }
}

resource "aws_vpc_peering_connection" "peer_vpc1_to_vpc2" {
  peer_vpc_id = aws_vpc.vpc2.id
  vpc_id      = aws_vpc.vpc1.id
  auto_accept = true
  tags = {
    Name = "VPC1 <> VPC2"
  }
}

resource "aws_vpc_peering_connection" "peer_vpc2_to_vpc3" {
  peer_vpc_id = aws_vpc.vpc3.id
  vpc_id      = aws_vpc.vpc2.id
  auto_accept = true
  tags = {
    Name = "VPC2 <> VPC3"
  }
}

resource "aws_vpc_peering_connection" "peer_vpc1_to_vpc3" {
  peer_vpc_id = aws_vpc.vpc3.id
  vpc_id      = aws_vpc.vpc1.id
  auto_accept = true
  tags = {
    Name = "VPC1 <> VPC3"
  }
}

resource "aws_internet_gateway" "ig1" {
  vpc_id = aws_vpc.vpc1.id
}
resource "aws_internet_gateway" "ig2" {
  vpc_id = aws_vpc.vpc2.id
}
resource "aws_internet_gateway" "ig3" {
  vpc_id = aws_vpc.vpc3.id
}

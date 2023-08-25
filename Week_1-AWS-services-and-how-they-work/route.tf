# Route
resource "aws_route_table" "route_table1" {
  vpc_id = aws_vpc.vpc1.id
}
resource "aws_route_table" "route_table2" {
  vpc_id = aws_vpc.vpc2.id
}
resource "aws_route_table" "route_table3" {
  vpc_id = aws_vpc.vpc3.id
}

resource "aws_route" "public_internet_gateway1" {
  route_table_id         = aws_route_table.route_table1.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.ig1.id
}

resource "aws_route" "public_internet_gateway2" {
  route_table_id         = aws_route_table.route_table2.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.ig2.id
}
resource "aws_route" "public_internet_gateway3" {
  route_table_id         = aws_route_table.route_table3.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.ig3.id
}

resource "aws_route_table_association" "public1" {
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.route_table1.id
}
resource "aws_route_table_association" "public2" {
  subnet_id      = aws_subnet.subnet2.id
  route_table_id = aws_route_table.route_table2.id
}
resource "aws_route_table_association" "public3" {
  subnet_id      = aws_subnet.subnet3.id
  route_table_id = aws_route_table.route_table3.id
}


resource "aws_route" "peer_1_2" {
  route_table_id            = aws_route_table.route_table1.id
  destination_cidr_block    = "10.1.0.0/16"
  vpc_peering_connection_id = aws_vpc_peering_connection.peer_vpc1_to_vpc2.id
}
resource "aws_route" "peer_2_1" {
  route_table_id            = aws_route_table.route_table2.id
  destination_cidr_block    = "10.0.0.0/16"
  vpc_peering_connection_id = aws_vpc_peering_connection.peer_vpc1_to_vpc2.id
}

resource "aws_route" "peer_2_3" {
  route_table_id            = aws_route_table.route_table2.id
  destination_cidr_block    = "10.2.0.0/16"
  vpc_peering_connection_id = aws_vpc_peering_connection.peer_vpc2_to_vpc3.id
}
resource "aws_route" "peer_3_2" {
  route_table_id            = aws_route_table.route_table3.id
  destination_cidr_block    = "10.1.0.0/16"
  vpc_peering_connection_id = aws_vpc_peering_connection.peer_vpc2_to_vpc3.id
}

resource "aws_route" "peer_1_3" {
  route_table_id            = aws_route_table.route_table1.id
  destination_cidr_block    = "10.2.0.0/16"
  vpc_peering_connection_id = aws_vpc_peering_connection.peer_vpc1_to_vpc3.id
}
resource "aws_route" "peer_3_1" {
  route_table_id            = aws_route_table.route_table3.id
  destination_cidr_block    = "10.0.0.0/16"
  vpc_peering_connection_id = aws_vpc_peering_connection.peer_vpc1_to_vpc3.id
}

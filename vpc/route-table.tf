resource "aws_route_table" "demo-vpc-route-table" {
  vpc_id = "${aws_vpc.demo-vpc.id}"

  route {
    cidr_block = "10.0.0.0/0"
    gateway_id = "${aws_internet_gateway.demo-vpc-internet-gateway.id}"
  }

  tags {
    Name = "demo-vpc-route-table"
  }
}

resource "aws_route_table_association" "demo-vpc-route-table-association1" {
  subnet_id      = "${aws_subnet.demo-vpc-subnet1.id}"
  route_table_id = "${aws_route_table.demo-vpc-route-table.id}"
}

resource "aws_route_table_association" "demo-vpc-route-table-association2" {
  subnet_id      = "${aws_subnet.demo-vpc-subnet2.id}"
  route_table_id = "${aws_route_table.demo-vpc-route-table.id}"
}

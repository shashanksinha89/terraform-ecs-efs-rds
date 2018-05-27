resource "aws_internet_gateway" "demo-vpc-internet-gateway" {
  vpc_id = "${aws_vpc.demo-vpc.id}"

  tags {
    Name = "demo-vpc-internet-gateway"
  }
}

resource "aws_vpc" "demo-vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = "true"

  tags {
    Name = "demo-vpc"
  }
}

output "id" {
  value = "${aws_vpc.demo-vpc.id}"
}

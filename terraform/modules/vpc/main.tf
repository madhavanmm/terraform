resource "aws_vpc" "vpc" {
  cidr_block = "${var.vpc-cidr}"
}
resource "aws_internet_gateway" "vpc-gw" {
  vpc_id = "${aws_vpc.vpc.id}"
}
# Public subnets
resource "aws_subnet" "vpc-public" {
	vpc_id = "${aws_vpc.vpc.id}"
	cidr_block = "${var.public-subnet}"
	availability_zone = "ap-south-1b" 
}
# Routing table for public subnets
resource "aws_route_table" "vpc-terra-rt" {
	vpc_id = "${aws_vpc.vpc.id}"
	route {
		cidr_block = "0.0.0.0/0"
		gateway_id = "${aws_internet_gateway.vpc-gw.id}"
	}
}
resource "aws_route_table_association" "public-ass" {
        
	subnet_id = "${aws_subnet.vpc-public.id}"
	route_table_id = "${aws_route_table.vpc-terra-rt.id}"
}
# Private subsets
resource "aws_subnet" "vpc-private" {
	vpc_id = "${aws_vpc.vpc.id}"
	cidr_block = "${var.private-subnet}"
	availability_zone = "ap-south-1a"
}
resource "aws_eip" "nat" {
  vpc              = true
  public_ipv4_pool = "amazon"
}

resource "aws_nat_gateway" "gw" {
  allocation_id = "${aws_eip.nat.id}"
  subnet_id     = "${aws_subnet.vpc-public.id}"
}

# Routing table for private subnets
resource "aws_route_table" "vpc-terra-rw-pr" {
	vpc_id = "${aws_vpc.vpc.id}"
	route {
        	cidr_block = "0.0.0.0/0"
       	        nat_gateway_id = "${aws_nat_gateway.gw.id}"
	}
}
resource "aws_route_table_association" "private-ass" {
       
	subnet_id = "${aws_subnet.vpc-private.id}"
	route_table_id = "${aws_route_table.vpc-terra-rw-pr.id}"
}

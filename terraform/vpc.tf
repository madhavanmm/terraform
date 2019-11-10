resource "aws_vpc" "terravpc" {
  cidr_block = "10.0.0.0/16"

}

resource "aws_internet_gateway" "terra-gw" {
  vpc_id = "${aws_vpc.terravpc.id}"
}

# Public subnets

resource "aws_subnet" "vpc-terra-public" {
	vpc_id = "${aws_vpc.terravpc.id}"

	cidr_block = "10.0.1.0/24"
	availability_zone = "ap-south-1"
}

#resource "aws_subnet" "vpc-terra-public" {
#	vpc_id = "${aws_vpc.terravpc.id}"
#
#	cidr_block = "10.0.2.0/24"
#	availability_zone = "ap-south-1"
#}

# Routing table for public subnets

resource "aws_route_table" "vpc-terra-rt" {
	vpc_id = "${aws_vpc.terravpc.id}"

	route {
		cidr_block = "0.0.0.0/0"
		gateway_id = "${aws_internet_gateway.terra-gw.id}"
	}
}
resource "aws_route_table_association" "public-ass" {
	subnet_id = "${aws_subnet.vpc-terra-public.id}"
	route_table_id = "${aws_route_table.vpc-terra-rt.id}"
}
# Private subsets

resource "aws_subnet" "vpc-terra-private" {
	vpc_id = "${aws_vpc.terravpc.id}"

	cidr_block = "10.0.3.0/24"
	availability_zone = "ap-south-1"
}

# Routing table for private subnets

resource "aws_route_table" "vpc-terra-rw-pr" {
	vpc_id = "${aws_vpc.terravpc.id}"

	route {
		cidr_block = "0.0.0.0/0"
		instance_id = "${aws_instance.terraec2.id}"
	}
}

resource "aws_route_table_association" "private-ass" {
	subnet_id = "${aws_subnet.vpc-terra-private.id}"
	route_table_id = "${aws_route_table.vpc-terra-rw-pr.id}"
}

#Security_group

resource "aws_security_group" "vpc-terra-sg" {
	name = "terravpcsp"
	description = "Allow ALL traffic from the internet"

	ingress {
		from_port = 0
		to_port = 65535
		protocol = "ALL"
		cidr_blocks = ["192.168.122.1/32"]
	}

	vpc_id = "${aws_vpc.terravpc.id}"
}

#create instance

resource "aws_instance" "terraec2" {
	ami = "ami-0a74bfeb190bd404f"
	availability_zone = "ap-south-1"
	instance_type = "t2.micro"
	key_name = "terravpc"
	security_groups = ["${aws_security_group.vpc-terra-sg.id}"]
	subnet_id = "${aws_subnet.vpc-terra-private.id}"
}

resource "aws_eip" "vpcec2" {
	instance = "${aws_instance.terraec2.id}"
	vpc = true
}

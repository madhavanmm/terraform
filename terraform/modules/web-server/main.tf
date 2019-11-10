provider "aws" {
region="${var.region}"
}
resource "aws_instance" "teraec2" {
  ami = "${var.ami}"
  #        availability_zone = "${var.region}"
  instance_type          = "${var.type}"
#  key_name               = "maddy"
  vpc_security_group_ids = ["${aws_security_group.ec2.id}"]
  user_data              = <<-EOF
	#!/bin/bash
	yum install httpd -y
	echo "Welcome to my terra_ec2 Instance web server" > /var/www/html/index.html
	service httpd start
	EOF
}


resource "aws_security_group" "ec2" {
  name = "terraform-security-goup"
  vpc_id      = "vpc-0e467d547146e67a9"
  #Inbound HTTP from anywhere
  ingress {
    from_port   = "${var.web_server_port}"
    to_port     = "${var.web_server_port}"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}










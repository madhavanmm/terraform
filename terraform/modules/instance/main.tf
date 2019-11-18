module "vpc" {
  source = "../../modules/vpc"
  ami = "${var.ami}"
  instance_type          = "${var.type}"
  vpc_security_group_ids = ["${aws_security_group.ec2.id}"]
  user_data              = <<-EOF
        #!/bin/bash
        yum install httpd -y
        echo "Welcome to my terra_ec2 Instance web server" > /var/www/html/index.html
        service httpd start
        EOF
}

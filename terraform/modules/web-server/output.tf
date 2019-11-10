
output "public_ip" {
  value = "${aws_instance.teraec2.public_ip}"
}

output "id" {
  value = "${aws_instance.teraec2.id}"
}

output "public_dns" {
  value = "${aws_instance.teraec2.public_dns}"
}

output "security_groups" {
  value = "${aws_instance.teraec2.security_groups}"
}

output "subnet_id" {
  value = "${aws_instance.teraec2.subnet_id}"
}

output "vpc_security_group" {
  value = "${aws_instance.teraec2.vpc_security_group_ids}"
}









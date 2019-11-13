output "private-subnet" {
  value = ["${aws_subnet.vpc-private.id}"]
}
output "public-subnet" {
  value = ["${aws_subnet.vpc-public.id}"]
}
output "public-rt" {
  value = ["${aws_route_table.vpc-terra-rt.id}"]
}
output "private-rt" {
  value = ["${aws_route_table.vpc-terra-rw-pr.id}"]
}
output "vpc-id"{
  value = ["${aws_vpc.vpc.id}"]
}
output "instance"{
  value = ["${aws_instance.instance.id}"]
}

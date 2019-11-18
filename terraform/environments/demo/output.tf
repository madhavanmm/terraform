output "public-subnet-id" {
  value = "${module.demo.public-subnet-id}"
}
output "private-subnet-ids" {
  value = "${module.demo.private-subnet-ids}"
}
output "instance-id" {
  value = "${module.demo.instance-id}"
}

output "public-rt" {
  value = "${module.demo.public-rt}"
}
output "private-rt" {                                                                
value = "${module.demo.public-rt}"                                               
}


output "public-subnet-id" {
  value = "${module.vpc.public-subnet}"
}
output "private-subnet-ids" {
  value = "${module.vpc.private-subnet}"
}
output "instance-id" {
  value = "${module.vpc.instance}"
}

output "public-rt" {
  value = "${module.vpc.public-rt}"
}
output "private-rt" {                                                                 value = "${module.vpc.public-rt}"                                                } 


output "public-subnet-id" {
  value = "${module.vpc.public-subnet}"
}
output "private-subnet-ids" {
  value = "${module.vpc.private-subnet}"
}


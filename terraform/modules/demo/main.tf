module "vpc" {
  source = "../../modules/vpc"
  region = "${var.region}"
  availability-zones = "${var.availability-zones}"
  vpc-cidr = "${var.vpc-cidr}"
  public-subnet = "${var.public-subnet}"
  private-subnet = "${var.private-subnet}"
}




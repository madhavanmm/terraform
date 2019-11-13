provider "aws" {
  region = "${var.region}"
}
terraform {
  backend "s3" {
    bucket = "maddydemo"
    key    = "demo1"
    region = "ap-south-1"

  }
}
module "demo" {
  source = "../../modules/demo"
  region = "${var.region}"
  vpc-cidr = "172.28.0.0/16"
  availability-zones = "${var.availability-zones}"
  public-subnet = "172.28.1.0/24"
  private-subnet = "172.28.2.0/24"
  ami = "${var.ami}"
  instance_type = "${var.instance_type}"
}
/*module "vpc" {
  source = "../../modules/vpc"
  ami = "${var.ami}"
  instance_type = "${var.instance_type}"
}*/



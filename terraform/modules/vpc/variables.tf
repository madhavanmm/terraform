variable "region"{
}

variable "availability-zones" {
  type = "list"
}
variable "private-subnet" {}
variable "public-subnet" {}
variable "vpc-cidr" {}

variable "ami"{
  default = "ami-0a74bfeb190bd404f"
}
variable "instance_type"{
  default = "t2.micro"
}

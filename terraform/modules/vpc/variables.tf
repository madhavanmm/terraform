variable "region"{
}

variable "availability-zones" {
  type = "list"
}
variable "private-subnet" {}
variable "public-subnet" {}
variable "vpc-cidr" {}

variable "ami"{
  default = "ami-02913db388613c3e1"
}
variable "instance_type"{
  default = "t2.micro"
}

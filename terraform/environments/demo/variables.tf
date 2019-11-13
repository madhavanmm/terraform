variable "availability-zones" {
  type = "list"
  default = [ "ap-south-1a", "ap-south-1b" ]
}
variable "region" {
  default = "ap-south-1"
}
variable "ami"{
  default = "ami-0a74bfeb190bd404f"
}
variable "instance_type"{
  default = "t2.micro"
}

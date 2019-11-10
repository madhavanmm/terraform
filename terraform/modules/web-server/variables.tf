variable "region" {
  #type = "list"
  default = "ap-south-1"
}

variable "web_server_port" {
  default = "80"
}

variable "ami" {
  default = "ami-0a74bfeb190bd404f"
}

variable "type" {
  default = "t2.micro"
}

variable "vpc" {
  default = "vpc-0e61baf9384844605"
}

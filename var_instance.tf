variable "aws_region" {
  default = "us-east-1"
}

variable "ami_id" {
  type = "map"
  default = {
    us-east-1 = "ami-09d069a04349dc3cb"
    us-east-2 = "ami-097834fcb3081f51a"
    us-west-2 = "ami-01f08ef3e76b957e5"
  }
}
variable "inst_type" {
    default = "t2-micro"
}
variable "public_subnet_id" {
    default = null
}
variable "private_subnet_id" {
    default = null
}
variable "instance_count" {
  default = "4"
}
variable "instance_tags" {
    type = "list"
    default = ["Public_Instance_Zone1", "Public_Instance_Zone2", "Public_Instance_Zone3", "Public_Instance_Zone4"]
}
variable "instance_tags_priv" {
  type = "list"
    default = ["Priv_Instance_Zone1", "Priv_Instance_Zone2", "Priv_Instance_Zone3", "Priv_Instance_Zone4"]
}





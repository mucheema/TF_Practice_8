variable "aws_region" {
  default = "us-east-1"
}
variable "vpc_cidr" {
  default = "10.0.0.0/16"
}
variable "public_subnet" {
  type = "list"
  default = ["10.0.128.0/20", "10.0.144.0/20", "10.0.160.0/20", "10.0.176.0/20"]
}
variable "azs" {
  type = "list"
  default = ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d"]
}
variable "private_subnet" {
  type = "list"
  default = ["10.0.16.0/19", "10.0.32.0/19", "10.0.64.0/19", "10.0.96.0/19"]
}


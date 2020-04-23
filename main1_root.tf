module "my_vpc" {
  source = "../module/Networking"
 # vpc_cidr       = "192.168.0.0/16"
 # subnet_cidr = "192.168.0.0/24"
  vpc_cidr = module.my_vpc.vpc_main.id
  
}
module "my_ec2_public" {
  source = "../module/instance"
  #instance_count = 4
  #ami_id = "ami-09d069a04349dc3cb"
  
  inst_type = "t2.micro"
  public_subnet_id = module.my_vpc.public_main.id
  
}
# module "my_ec2_private" {
#  source = "../module/instance"
#  #instance_count = 4
#  ami_id = "ami-09d069a04349dc3cb"
#  inst_type = "t2.micro"
#  private_subnet_id = module.my_ec2_private.private_main.id
  
#}
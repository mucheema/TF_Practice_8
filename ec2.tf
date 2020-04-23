# Create instance in each zone
#Ability to pick ami in a different region

resource "aws_instance" "my_instance" {
  count = var.instance_count
  ami           = lookup(var.ami_id, var.aws_region)
  instance_type = var.inst_type
  subnet_id = var.public_subnet_id
  
  tags = {
    Name = element(var.instance_tags, count.index)
  }
}
resource "aws_instance" "private_instance" {
  count = var.instance_count
  ami           = lookup(var.ami_id, var.aws_region)
  instance_type = var.inst_type
  subnet_id = var.private_subnet_id
  
  tags = {
    Name = element(var.instance_tags_priv, count.index)
  }
}
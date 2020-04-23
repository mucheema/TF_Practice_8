resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
}
# Internet gateway associate with VPC
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "main vpc"
  }
}
# Subnets - Pulic 
resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.vpc.id
  count = length(var.public_subnet)
  availability_zone = element(var.azs,count.index)
  cidr_block = element(var.public_subnet,count.index)
  map_public_ip_on_launch = true
  tags = {
    Name = "Public - count.index + 1"
  }
}
# Subnets - Private 
resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.vpc.id
  count = length(var.private_subnet)
  availability_zone = element(var.azs,count.index)
  cidr_block = element(var.private_subnet,count.index)
  
  tags = {
    Name = "Private - count.index + 1"
  }
}
# Route Table , attach with IGW
resource "aws_route_table" "public_rt" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }
}
# Attach route table with public subnet
resource "aws_route_table_association" "a" {
    count = length(var.public_subnet)
    subnet_id      = aws_subnet.public[count.index].id
    route_table_id = aws_route_table.public_rt.id
}
# Do we need to attach Route table with Private subnet?


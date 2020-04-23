output "vpc_main" {
  value = aws_vpc.vpc
}
output "public_main" {
  value = aws_subnet.public
}
output "private_main" {
  value = aws_subnet.private
}


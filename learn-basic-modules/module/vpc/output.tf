output "vpc_id" {
  value = aws_vpc.this1.id
}

output "subnet1_id" {
  value = aws_subnet.this1subnet1.id
}

output "subnet2_id" {
  value = aws_subnet.thissubnet2.id
}
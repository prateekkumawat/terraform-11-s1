output "this1_ins_private_ip" {
  value = aws_instance.this1.private_ip
}

output "this1_ins_public_ip" {
  value = aws_instance.this1.public_ip
}

output "this2_ins_private_ip" {
  value = aws_instance.this2.private_ip
}

output "this2_ins_public_ip" {
  value = aws_instance.this2.public_ip
}
output "aws_instnace1_id" {
  value = aws_instance.this1instnace1.id
}

output "aws_instnace2_id" {
  value = aws_instance.this1instnace2.id
}

output "aws_instnace1_privateip" {
  value = aws_instance.this1instnace1.private_ip
}

output "aws_instnace2_privateip" {
  value = aws_instance.this1instnace2.private_ip
}

output "aws_instance1_publicip"{
  value = aws_instance.this1instnace1.public_ip
}
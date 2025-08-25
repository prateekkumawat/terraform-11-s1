resource "aws_vpc" "this1" {
  cidr_block = var.vpc_network
  tags = { 
      Name = "${var.infra_name}-${var.infra_env}-vpc"
  }
}

resource "aws_subnet" "subnet1" {
  vpc_id = aws_vpc.this1.id 
  for_each = var.subnet_details 
  availability_zone = each.value.az 
  cidr_block        = each.value.subnet_cidr
  
}
# create vpc resource 
resource "aws_vpc" "this1" {
  cidr_block = var.vpc_network

 tags = {
    Name = "${var.infra_name}-${var.infra_env}-vpc"
 }   
}

# create subnet1 for vpc 
resource "aws_subnet" "this1subnet1" {
  vpc_id = aws_vpc.this1.id 
  cidr_block = var.subnet_cidr[0]
  availability_zone = var.subnet_az[0]
  tags = {
    Name = "${var.infra_name}-${var.infra_env}-subnet1-az1"
  }
}

# create subnet2 for vpc 
resource "aws_subnet" "thissubnet2" {
  vpc_id = aws_vpc.this1.id
  cidr_block = var.subnet_cidr[1]
  availability_zone = var.subnet_az[1]
  tags = { 
    Name = "${var.infra_name}-${var.infra_env}-subnet2-az2"
  }
}

# create internet gateway 
resource "aws_internet_gateway" "this1igw" {
  vpc_id = aws_vpc.this1.id
  tags = {
    Name = "${var.infra_name}-${var.infra_env}-igw"
  }
}
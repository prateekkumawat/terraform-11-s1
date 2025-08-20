# create vpc resource 
resource "aws_vpc" "this1" {
  cidr_block = "10.10.0.0/16"

 tags = {
    Name = "terraform-vpc"
 }   
}

# create subnet1 for vpc 
resource "aws_subnet" "this1subnet1" {
  vpc_id = aws_vpc.this1.id 
  cidr_block = "10.10.1.0/24" 
  availability_zone = "ap-south-1a"
  tags = {
    Name = "terraform-subnet1-az1"
  }
}

# create subnet2 for vpc 
resource "aws_subnet" "thissubnet2" {
  vpc_id = aws_vpc.this1.id
  cidr_block = "10.10.2.0/24"
  availability_zone = "ap-south-1b"
  tags = { 
    Name = "terraform-subnet2-az2"
  }
}

# create internet gateway 
resource "aws_internet_gateway" "this1igw" {
  vpc_id = aws_vpc.this1.id
  tags = {
    Name = "terraform-igw"
  }
}
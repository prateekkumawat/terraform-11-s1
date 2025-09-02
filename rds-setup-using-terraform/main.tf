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

# create subnet3 for vpc 
resource "aws_subnet" "thissubnet3" {
  vpc_id = aws_vpc.this1.id
  cidr_block = var.subnet_cidr[2]
  availability_zone = var.subnet_az[0]
  tags = { 
    Name = "${var.infra_name}-${var.infra_env}-subnet3-az1"
  }
}
# create internet gateway 
resource "aws_internet_gateway" "this1igw" {
  vpc_id = aws_vpc.this1.id
  tags = {
    Name = "${var.infra_name}-${var.infra_env}-igw"
  }
}

# create an EIP for natgateway 
resource "aws_eip" "this1eip" {
  domain = "vpc"
  tags = {
    Name = "${var.infra_name}-${var.infra_env}-eip-natgw"
  }
}

# create a nat gateaway 
resource "aws_nat_gateway" "this1nat" {
  subnet_id = aws_subnet.this1subnet1.id
  allocation_id = aws_eip.this1eip.id
  tags = {
    Name = "${var.infra_name}-${var.infra_env}-natgw"
  } 
}

resource "aws_route_table" "this1pub" {
  vpc_id = aws_vpc.this1.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this1igw.id 
  }
  tags = {
    Name = "${var.infra_name}-${var.infra_env}-pub-rt"
  } 
}

resource "aws_route_table" "this1pri" {
  vpc_id = aws_vpc.this1.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.this1nat.id
  }
  tags = {
    Name = "${var.infra_name}-${var.infra_env}-private-rt"
  } 
}

resource "aws_route_table_association" "this1pub1assosiate1" {
  route_table_id = aws_route_table.this1pub.id
  subnet_id = aws_subnet.this1subnet1.id
}

resource "aws_route_table_association" "this1pri1assosiate1" {
  route_table_id = aws_route_table.this1pri.id
  subnet_id = aws_subnet.thissubnet2.id
}

resource "aws_route_table_association" "this1pri2assosiate2" {
  route_table_id = aws_route_table.this1pri.id
  subnet_id = aws_subnet.thissubnet3.id
}

# create a RDS Security Group 
resource "aws_security_group" "this1rdssg" {
  vpc_id = aws_vpc.this1.id
  description = "Allow MYSQL PORT from RDS Security Group"
  name = "${var.infra_name}-${var.infra_env}-securitygroup-rds"
  ingress {
    from_port = "3306"
    to_port = "3306"
    protocol = "tcp"
    cidr_blocks = ["10.10.0.0/16"]
  }
  egress  {
    from_port = "0"
    to_port = "0"
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name =  "${var.infra_name}-${var.infra_env}-securitygroup-rds"
  }
}

# crate RDS Subnet Group for DB Instance 
resource "aws_db_subnet_group" "this1dbsubnetgrp" {
    name = "${var.infra_name}-${var.infra_env}-db-subnet-grp"
    subnet_ids = [aws_subnet.thissubnet2.id, aws_subnet.thissubnet3.id ]
    description = "allow subnet for db subnet instance"
    tags = {
        Name = "${var.infra_name}-${var.infra_env}-db-subnet-grp"
    }
}

# create RDS DB Instance 
resource "aws_db_instance" "this1rds" {
  identifier = "${var.infra_name}-${var.infra_env}-database"
  allocated_storage = 20
  db_name = "test"
  instance_class = "db.t3.micro"
  username = "prateek"
  password = "Redhat123456"
  engine = "mysql"
  engine_version = "8.0"
  db_subnet_group_name = aws_db_subnet_group.this1dbsubnetgrp.id
  vpc_security_group_ids = [aws_db_subnet_group.this1dbsubnetgrp.id]
  skip_final_snapshot = "false"
}
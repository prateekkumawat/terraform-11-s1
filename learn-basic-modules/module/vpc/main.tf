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
  map_public_ip_on_launch = var.map_public_ip_on_launch
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

resource "aws_route_table_association" "this1pub1assosiate2" {
  route_table_id = aws_route_table.this1pri.id
  subnet_id = aws_subnet.thissubnet2.id
}
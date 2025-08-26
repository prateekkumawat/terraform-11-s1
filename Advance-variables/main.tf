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
  map_public_ip_on_launch = true
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


resource "aws_route_table_association" "this1pub1assosiate1" {
  route_table_id = aws_route_table.this1pub.id
  subnet_id = aws_subnet.this1subnet1.id
}


# create a keypair for instance
resource "tls_private_key" "this1key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "this1keypair1" {
  key_name = var.keyname
  public_key = tls_private_key.this1key.public_key_openssh
}

resource "local_file" "thiskeypem" {
   filename = "./keypair/terraform"
   content  =  tls_private_key.this1key.private_key_openssh
}

# create security group for ec2 Instance 
resource "aws_security_group" "this1sg1" {
  name = "aws-terraform-sg"
  description = "Allow SSH and HTTP Rule"
  vpc_id = aws_vpc.this1.id

  ingress {
    from_port = "22"
    to_port   = "22"
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = "0"
    to_port   = "0"
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
     Name = "${var.infra_name}-${var.infra_env}-terraform-secgrp"
  }
}

# create a EC2 Instance using Count Examples  
# resource "aws_instance" "this1ins1" {
#   count = 3
#   ami = var.ami_id
#   instance_type = var.instance_type_flavours
#   security_groups = [aws_security_group.this1sg1.id]
#   subnet_id = aws_subnet.this1subnet1.id
#   key_name = aws_key_pair.this1keypair1.key_name
  
#   tags = { 
#      Name = "${var.infra_name}-${var.infra_env}-ins-${count.index}"
#   }
# }

# create a EC2 Instance using Examples 
resource "aws_instance" "this1" {
 for_each = var.aws_instnace_details 
 ami = each.value.ami_ids
 instance_type = each.value.instance_type
 subnet_id = each.value.subnet_ids
 security_groups = [each.value.aws_security_group]
 key_name = each.value.key_name
 
}
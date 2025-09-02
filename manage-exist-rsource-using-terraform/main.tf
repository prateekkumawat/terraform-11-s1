data "aws_vpc" "this1" {
  id = var.vpc_id
}

resource "aws_subnet" "subnet1" {
   vpc_id = data.aws_vpc.this1.id
   cidr_block = var.subnet_cidr[0]
   availability_zone = var.subnet_az[0]
   tags = {
    Name = "${var.infra_name}-${var.infra_env}-subnet1"
   }
}

resource "aws_subnet" "subnet2" {
   vpc_id = data.aws_vpc.this1.id
   cidr_block = var.subnet_cidr[1]
   availability_zone = var.subnet_az[1]
   tags = {
    Name = "${var.infra_name}-${var.infra_env}-subnet2"
   }
}

# call exist route table public
data "aws_route_table" "this1pub" {
   route_table_id = var.route_table_public_id  
}

data "aws_route_table" "this1private" {
   route_table_id = var.route_table_private_id  
}

# subnet assosiations 
resource "aws_route_table_association" "assosiationpub" {
  route_table_id = data.aws_route_table.this1pub.id  
  subnet_id = aws_subnet.subnet1.id
}

resource "aws_route_table_association" "assosiationsprivate" {
  route_table_id = data.aws_route_table.this1private.id
  subnet_id = aws_subnet.subnet2.id
}


# call the ami 
data "aws_ami" "this1ami" {
  most_recent = true
  owners      = ["amazon"]  

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# create instance 
resource "aws_instance" "this1ins" {
  ami = data.aws_ami.this1ami.id
  instance_type = "t2.micro"
  subnet_id = aws_subnet.subnet1.id
  vpc_security_group_ids = ["sg-040a316f6ed8d16f2"]
  key_name = "mount.pem"
}
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

resource "aws_instance" "this1instnace1" {
  ami = data.aws_ami.this1ami.id
  instance_type = var.instance_type
  vpc_security_group_ids = [var.securitygroup_id]
  subnet_id = var.subnet_id
  key_name = var.key_name
  tags = {
    Name = "${var.infra_name}-${var.infra_env}-instance1"
  }
}

resource "aws_instance" "this1instnace2" {
  ami = data.aws_ami.this1ami.id
  instance_type = var.instance_type
  vpc_security_group_ids = [var.securitygroup_id]
  subnet_id = var.subnet_id
  key_name = var.key_name
  tags = {
    Name = "${var.infra_name}-${var.infra_env}-instance2"
  }
}

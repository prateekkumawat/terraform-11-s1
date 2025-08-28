resource "aws_vpc" "this1" {
  cidr_block = var.vpc_network
  tags = {
    Name =  "${var.infra_name}-${var.infra_env}-vpc"
  }
}

resource "aws_subnet" "this1publicsubnet" {
  for_each = var.public_subnet_details
  cidr_block = each.value.subnet_cidr
  availability_zone = each.value.subnet_az
  vpc_id = each.value.vpc_id
  map_public_ip_on_launch = each.value.map_public_ip_on_launch

  tags = {
    Name = "${var.infra_name}-${var.infra_env}-public-${each.value.subnet_az}"
  }
}

resource "aws_subnet" "this1privatesubnet" {
  for_each = var.private_subnet_details
  cidr_block = each.value.subnet_cidr
  availability_zone = each.value.subnet_az
  vpc_id = each.value.vpc_id
  map_public_ip_on_launch = each.value.map_public_ip_on_launch

  tags = {
    Name = "${var.infra_name}-${var.infra_env}-private-${each.value.subnet_az}"
  }
}
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "6.0.1"
  
  create_vpc = true
  cidr = "10.10.0.0/16"
  name = "hsit-nocode-vpc"
  azs  = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
  public_subnets = ["10.10.1.0/24", "10.10.2.0/24", "10.10.3.0/24"]
  private_subnets = ["10.10.4.0/24", "10.10.5.0/24", "10.10.6.0/24"]
  database_subnets = ["10.10.7.0/24", "10.10.8.0/24", "10.10.9.0/24"]
  create_igw = true
  enable_nat_gateway = true
}

module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "nocode-hsit-data"
  acl    = "private"

  control_object_ownership = true
  object_ownership         = "ObjectWriter"

  versioning = {
    enabled = true
  }
}

module "vote_service_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "user-service"
  description = "Security group for user-service with custom ports open within VPC, and PostgreSQL publicly open"
  vpc_id      = "vpc-0313e0b1d03fd06d4"

  ingress_cidr_blocks      = ["10.10.0.0/16"]
  ingress_rules            = ["https-443-tcp"]
  ingress_with_cidr_blocks = [
    {
      from_port   = 8080
      to_port     = 8090
      protocol    = "tcp"
      description = "User-service ports"
      cidr_blocks = "10.10.0.0/16"
    },
    {
      rule        = "postgresql-tcp"
      cidr_blocks = "0.0.0.0/0"
    },
     {
      rule        = "ssh-tcp"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
}
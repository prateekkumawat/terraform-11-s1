# module "vpc-hsit" {
#   source = "../module/vpc"

#   infra_env =  "pp"
#   infra_name = "hsit-use1"
#   vpc_network = "10.10.0.0/16"
#   subnet_cidr = ["10.10.1.0/24", "10.10.2.0/24"]
#   subnet_az = ["ap-south-1a", "ap-south-1b"]
#   map_public_ip_on_launch = true
#}

module "vpc-hsit-stage" {
  source = "../module/vpc"

  infra_env =  "stage"
  infra_name = "hsit-use1"
  vpc_network = "10.20.0.0/16"
  subnet_cidr = ["10.20.1.0/24", "10.20.2.0/24"]
  subnet_az = ["ap-south-1a", "ap-south-1b"]
  map_public_ip_on_launch = true
}

module "securitygroup-hsit-stage" {
  source = "../module/securitygroup"
 
  vpc_id = module.vpc-hsit-stage.vpc_id
  infra_env = "stage"
  infra_name = "hsit-use1"

}

module "keys-hsit-stage"{
  source = "../module/keys"
  key_name = "hsit-stage-instnace"
}

module "instance-hsit-stage" {
  source = "../module/ec2"

  infra_env = "stage"
  infra_name = "hsit-stage"
  instance_type = "t2.micro"
  securitygroup_id = module.securitygroup-hsit-stage.securitygroup_id
  subnet_id = module.vpc-hsit-stage.subnet1_id
  key_name = module.keys-hsit-stage.keyname
  }
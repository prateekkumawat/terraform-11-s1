infra_env = "pp"
infra_name = "learning-use1"
infra_region = "ap-south-2"
vpc_network = "10.0.0.0/16"

public_subnet_details = {
  "public1" = {
    subnet_cidr = "10.0.4.0/24"
    subnet_az   = "ap-south-2a"
    vpc_id      = "vpc-0728dceb0a20fa805"
    map_public_ip_on_launch = true
  }
  "public2" = {
    subnet_cidr = "10.0.1.0/24"
    subnet_az   = "ap-south-2a"
    vpc_id      = "vpc-0728dceb0a20fa805"
    map_public_ip_on_launch = true
  }
}



private_subnet_details = {
  "private1" = {
    subnet_cidr = "10.0.3.0/24"
    subnet_az   = "ap-south-2a"
    vpc_id      = "vpc-0728dceb0a20fa805"
    map_public_ip_on_launch = false
  }
  "private2" = {
    subnet_cidr = "10.0.5.0/24"
    subnet_az   = "ap-south-2a"
    vpc_id      = "vpc-0728dceb0a20fa805"
    map_public_ip_on_launch = false
  }
}
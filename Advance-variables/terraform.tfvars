infra_region = "ap-south-2"
infra_env = "liveinfra"
infra_name = "hsitclient"
vpc_network = "10.10.0.0/16"
subnet_az = ["ap-south-2a", "ap-south-2b"]
subnet_cidr = ["10.10.1.0/24", "10.10.2.0/24"]
keyname = "terraform"
ami_id = "ami-031eac8ecb2726fe0"
instance_type_flavours = "t3.micro"

aws_instnace_details = {
  "ins1" = {
    subnet_ids = "subnet-05571be223a473719"
    ami_ids = "ami-031eac8ecb2726fe0"
    aws_security_group = "sg-0c266a17ad0549328"
    key_name = "hsitclient"
    instance_type = "t2.micro"
  }
  "ins2" = {
    subnet_ids = "subnet-05571be223a473719"
    ami_ids = "ami-031eac8ecb2726fe0"
    aws_security_group = "sg-0c266a17ad0549328"
    key_name = "hsitclient"
    instance_type = "t2.micro"
  }
  "ins3" = {
    subnet_ids = "subnet-009ec5d67f348b218"
    ami_ids = "ami-031eac8ecb2726fe0"
    aws_security_group = "sg-0c266a17ad0549328"
    key_name = "hsitclient"
    instance_type = "t2.medium"
  }
}
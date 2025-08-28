variable "vpc_network" {
  description = "please enter your vpc value"
  type = string
}
variable "infra_name" {}
variable "infra_region" {}
variable "infra_env" {}
variable "public_subnet_details"{
    type = map(object({
        subnet_cidr = string
        subnet_az   = string
        vpc_id      = string
        map_public_ip_on_launch = bool
    }))
}
variable "private_subnet_details"{
    type = map(object({
        subnet_cidr = string
        subnet_az   = string 
        vpc_id      = string 
        map_public_ip_on_launch = bool 
    }))
}
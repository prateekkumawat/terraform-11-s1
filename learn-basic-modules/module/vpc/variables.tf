variable "infra_env" {}
variable "infra_name" {}
variable "vpc_network" {}
variable "subnet_az" {
  type = list
}
variable "subnet_cidr"{
    type = list
}
variable "map_public_ip_on_launch" {
  type = bool
}
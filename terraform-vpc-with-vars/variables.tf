variable "vpc_network" {
  description = "please enter your vpc value"
  type = string
}
variable "infra_name" {}
variable "infra_region" {}
variable "infra_env" {}
variable "subnet_cidr" {
  type = list 
}
variable "subnet_az" {
  type = list
}

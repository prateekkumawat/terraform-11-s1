variable "infra_region" {}
variable "infra_env" {}
variable "infra_name" {}
variable "subnet_details" {
   type = map(string)  
}
variable "vpc_network" {}
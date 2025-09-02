variable "infra_name" {}
variable "infra_region" {}
variable "infra_env" {}
variable "vpc_id" {}
variable "subnet_az" {
  type = list 
}
variable "subnet_cidr" {
  type = list 
}
variable "route_table_private_id" {}
variable "route_table_public_id" {}
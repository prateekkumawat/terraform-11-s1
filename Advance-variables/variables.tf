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
variable "keyname" {}
variable "ami_id" {}
variable "instance_type_flavours" {}

variable "aws_instnace_details" {
  type = map(object({
   ami_ids = string
   instance_type = string
   subnet_ids = string 
   aws_security_group = string
   key_name = string 
   
  }))
}
variable "vpc_details" {
  type = map(object({
    cidr_block = string
    Name = string 
    prefix = string 
    instance_tenancy = optional(string)
    enable_dns_hostnames = optional(bool)
    enable_dns_support = optional(bool)
    tags = map(string)
  }))
}
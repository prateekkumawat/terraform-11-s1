vpc_details = {
  "highsky1" = {
      cidr_block = "10.10.0.0/16"
      Name = "pp"
      prefix = "highsky-use1"
      tags = {
         created  = "terraform"
         cost_estimated = "use1"
         component_infra = "preprod"
      }
  }
}
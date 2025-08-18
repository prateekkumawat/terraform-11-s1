# Terraform Intro::: 
- Terraform is a IAC ( Infrastructure as a Code) automation tool. terraform is utlized your cloud provider manage by code. 
- terraform manage aws azure gcp alibaba and orcale cloud and etc. 
- terraform is a product of harshicrop and its based on HCL ( harshi crop language).... purely based on key-pair method like json , yaml smilier.
- cloud like aws azure gcp or anyone if you want to create resources mostly we use management console.we used propbaly terraform in growning orgnization or multi infra managemnet. ( dev prod prepord or test )
- terraform is used to crate update and manage your infra in cloud easier. 
- aws - cloudformation service ; azure - arm template ; google - gcp template ;;; devops problem like need to learn evry concept of service and code for IAC services. terraform use any cloud manage. 
- terraform easy to learn you just need to understand workflow of cloud. 
- terraform have large scale of code-ready modules just passing few arguments and paramentes manage any infra. 
- Terraform can be work as a IAC but not use as a configuration management tool.
- terraform integrate and manage multiple saas services that offical partner with terraform.

# Terraform provider ::: 
- A provider in Terraform is a plugin that enables interaction with an API base access. 
- Terraform provdiers need to connect with resources 
- terraform provider access key // secret keys method mostly used. 

# terraform installation ::: 
terraform is just a binary that you can install in any system. 
- Installation Links ::: https://developer.hashicorp.com/terraform/install
- Download Zip of terraform from links 
- extract your zip and copy terraform folder in C drive 
- start menu > Enviorment variables open > path > edit and paste your path location of terraform > save 
- open terminal check terraform command running. 

# terraform connection ::: 
always need providers like aws , azure or etc. use there programmetic method. 
example :::: aws iam user > create secret and access key > that key will use in terrform for connect with aws. 

# terraform basic structure :::: 
provider.tf     ---- providers details ( like aws azure or any other providers which wnat to manage. ) 
variables.tf    ---- variables used for Dynamic provision 
main.tf         ---- manage your provider resources like ec2 vpc security group and other services. 
Output.tf       ---- services output ec2 private public ip details; ELB endpoint ; rds endpoint etc. 
terraform.tfvars --- variables values files 
Examples of resources for aws on terraform documentations 
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc

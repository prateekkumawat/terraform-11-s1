# variables ::: 
- it is a basic representaive charterstic that can contain any value number or string. 
values use for variabale have diffrent data types. 
- string: "prateek" "abc" "prateek123"
- Number: 1 2 3 
- Boolen: true // false
    a = 3  ----> number 
    b = "prateek" ---> string  
- list: collection of values ["prateek", "raj", "disha"]  
aws_region_az = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
list used index -    0              1             2 
terraform: var.variable_name ::::    var.aws_region_az[index_number]

variables_file::::

variable "vpc_network" {
  description = "please enter your vpc value"
  type = string
}

# if you are not define type of variables terrform default treat as a string type.

varibale can manage using file that have *.tfvars or terraform.tfvars
# Terraform Loops ::: 
- in any programming languange we have loop concept that help us to repeative code segment management. 
- every programming usees For loop  smilier terraform is also have for loop.
for i in a > 0 :      a == "Prateek" or a != "prateek" or a == ""
   print i ;      # a is grater then 0 ; a is variable data type list a = [1, 2, 3, 0, 4, 5, 6]

terraform 3 type of loops argument uses. 
count = count pass that repeat that no of times but keys vaule will not changes.
for_each = bsed on meta-arguments that manage resources. 

Book Examples ---- chapeter 3 --- point stuty terraform loop 
vaules find   ------     index      ----  actual data
terraform loop -----  index. chapter and pageno --- Accurate  data 
                                |
                                |
                            Meta Data          | data about data  --- actual data infromation  in short formets

when you create resources subnet --- avaliblity_zone = values    ----> value arguments 
for_each ---- for loop --- variables 

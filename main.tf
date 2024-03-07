resource "aws_ssm_parameter" "params" {
  count = length(var.parameters)
  name = var.parameters[count.index].name
  type = var.parameters[count.index].type
  value = var.parameters[count.index].value
}


# String
#  SecureString

variable "parameters" {
  default = [
    # expense-ansible-parameters
    {name = "expense.frontend.backend_url", value = "http://backend.roboshop.internal:8080/", type = "String"}, # frontend
    {name = "expense.backend.DB_HOST", value = "mysql.roboshop.internal", type = "String"},                     # backend
    {name = "expense.backend.DB_PASS", value = "ExpenseApp@1", type = "SecureString"},                           # backend
    {name = "expense.mysql.DB_PASS", value = "ExpenseApp@1", type = "SecureString"}                             # mysql
    
  ]
}


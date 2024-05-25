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
    ### expense-ansible-parameters
#     {name = "expense.frontend.backend_url", value = "http://backend.roboshop.internal:8080/", type = "String"}, # frontend
#     {name = "expense.frontend.backend_url", value = "http://backend-dev.roboshop.internal/", type = "String"}, # frontend
    {name = "expense.backend.DB_HOST", value = "mysql.roboshop.internal", type = "String"},                     # backend
    {name = "expense.backend.DB_PASS", value = "ExpenseApp@1", type = "SecureString"},                          # backend
    {name = "expense.mysql.DB_PASS", value = "ExpenseApp@1", type = "SecureString"},                             # mysql

    ###dev
    # rds terraform dev environment
    {name = "dev.rds.master_username", value = "admin1", type = "String"},
    {name = "dev.rds.master_password", value = "Expense12345", type = "SecureString"},
    #rds end point
    {name = "dev.rds.endpoint", value = "dev-mysql.cluster-cinvurdqvuv4.us-east-1.rds.amazonaws.com", type = "String"},
    {name = "dev.expense.frontend.backend_url", value = "http://backend-dev.roboshop.internal/", type = "String"},


    ###prod
    # rds terraform prod environment
    {name = "prod.rds.master_username", value = "admin1", type = "String"},
    {name = "prod.rds.master_password", value = "Expense12345", type = "SecureString"},
    #rds end point
    {name = "prod.rds.endpoint", value = "prod-mysql.cluster-cinvurdqvuv4.us-east-1.rds.amazonaws.com", type = "String"},
    {name = "prod.expense.frontend.backend_url", value = "http://backend-prod.roboshop.internal/", type = "String"}
  ]
}


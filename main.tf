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
#     {name = "expense.frontend.backend_url", value = "http://backend.chowdary.cloud:8080/", type = "String"}, # frontend
#     {name = "expense.frontend.backend_url", value = "http://backend-dev.chowdary.cloud/", type = "String"}, # frontend
    {name = "expense.backend.DB_HOST", value = "mysql.chowdary.cloud", type = "String"},                     # backend
    {name = "expense.backend.DB_PASS", value = "ExpenseApp@1", type = "SecureString"},                          # backend
    {name = "expense.mysql.DB_PASS", value = "ExpenseApp@1", type = "SecureString"},                             # mysql

    ###dev
    # rds terraform dev environment
    {name = "dev.rds.master_username", value = "admin1", type = "String"},
    {name = "dev.rds.master_password", value = "Expense12345", type = "SecureString"},
    #rds end point
    {name = "dev.rds.endpoint", value = "dev-mysql.cluster-cinvurdqvuv4.us-east-1.rds.amazonaws.com", type = "String"},
    {name = "dev.expense.frontend.backend_url", value = "http://backend-dev.chowdary.cloud/", type = "String"},


    ###prod
    # rds terraform prod environment
    {name = "prod.rds.master_username", value = "admin1", type = "String"},
    {name = "prod.rds.master_password", value = "Expense12345", type = "SecureString"},
    #rds end point
    {name = "prod.rds.endpoint", value = "prod-mysql.cluster-cinvurdqvuv4.us-east-1.rds.amazonaws.com", type = "String"},
    {name = "prod.expense.frontend.backend_url", value = "http://backend-prod.chowdary.cloud/", type = "String"},

    ### jenkins password
    {name = "jenkins_password", value = "admin123", type = "SecureString"}
  ]
}

# resource "aws_ssm_parameter" "params" {
#   count = length(var.parameters)
#   name = var.parameters[count.index].name
#   type = var.parameters[count.index].type
#   value = var.parameters[count.index].value
# }
#
# variable "parameters" {
#   default = [
#     {name = "prod.rds.master_password", value = "expenseprod1234", type = "SecureString"},
#     {name = "prod.rds.master_username", value = "mysqlrdsadmin", type = "String"},
#     {name = "prod.expense.frontend.backend_url", value = "http://backend-prod.chowdary.cloud/", type = "String"},
#     {name = "prod.rds.endpoint", value = "prod-mysql.cluster-cbvsbeoyxek4.us-east-1.rds.amazonaws.com", type = "String"},
#
#     ## Dev env
#     {name = "dev.rds.master_username", value = "admin1", type = "String"},
#     {name = "dev.rds.master_password", value = "Expense12345", type = "SecureString"},
#     {name = "dev.expense.frontend.backend_url", value = "http://backend-dev.chowdary.cloud/", type = "String"}
#   ]
# }

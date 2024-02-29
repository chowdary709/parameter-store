resource "aws_ssm_parameter" "params" {
  count = length(var.parameters)
  name = var.parameters[count.index].name
  type = var.parameters[count.index].type
  value = var.parameters[count.index].value
}

variable "parameters" {
  default = [
    {name = "backend.app_version", value = "1.1.1", type = "String"},
    {name = "frontend.app_version", value = "1.1.1", type = "String"}
  ]
}


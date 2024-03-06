variable "String" {
  default = String
}

variable "SecureString" {
  default = SecureString
}

variable "parameters" {
  default = [
    {name = "backend.app_version", value = "1.1.1", type = var.String}
  ]
}

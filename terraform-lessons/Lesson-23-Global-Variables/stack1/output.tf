
# Можно выводить с помощью data
output "terraform_remote_state" {
  value = data.terraform_remote_state.global_variables.outputs
}

# Вывод:
# terraform_remote_state = {
#   "company_name" = "My Company"
#   "owner" = "Oleg Filatov"
# }

# Или создать Locals
locals {
  company_name = data.terraform_remote_state.global_variables.outputs.company_name
  owner        = data.terraform_remote_state.global_variables.outputs.owner
}

output "local_company_name" {
  value = local.company_name
}

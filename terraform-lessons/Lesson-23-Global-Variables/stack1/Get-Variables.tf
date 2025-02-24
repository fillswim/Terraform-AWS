# ================================ Remote State ================================

# Состояние из Развертывания конфигурации хранилища HashiCorp Valt "global_variables"
data "terraform_remote_state" "global_variables" {
  backend = "s3"
  config = {
    bucket                      = "terraform-state"
    key                         = "global-variables/terraform.tfstate"
    region                      = "main"
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_region_validation      = true
    skip_requesting_account_id  = true
    use_path_style              = true
  }
}

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

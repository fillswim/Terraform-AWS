
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
# ================================= S3 Backend =================================
terraform {
  backend "s3" {
    bucket = "terraform-state"
    key    = "global-variables/terraform.tfstate" # ! Необходимо изменить для каждой папки !

    region = "main"

    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_region_validation      = true
    skip_requesting_account_id  = true
    use_path_style              = true

  }
}

# ====================== Сохранить глобальные переменные =======================

output "company_name" {
  value = "My Company"
}

output "owner" {
  value = "Oleg Filatov"
}
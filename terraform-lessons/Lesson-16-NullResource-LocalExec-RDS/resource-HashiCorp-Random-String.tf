
# ================================ Random String ===============================

variable "name" {
  default = "vasya"
}

resource "random_string" "rds_password" {
  length           = 12
  special          = true
  override_special = "!@#$"
  keepers = {
    keeper1 = var.name # для смены пароля
  }
}
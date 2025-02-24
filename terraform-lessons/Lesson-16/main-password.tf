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

# =============================== Parameter Store ==============================

resource "aws_ssm_parameter" "rds_password" {
  name        = "/prod/mysql"
  description = "Master password for RDS MySQL"
  type        = "SecureString"
  value       = random_string.rds_password.result
}

# ============================ Data Parameter Store ============================

data "aws_ssm_parameter" "my_rds_password" {
  name       = "/prod/mysql"
  depends_on = [aws_ssm_parameter.rds_password]
}

# =================================== Output ===================================

output "rds_password" {
  #   value = data.aws_ssm_parameter.my_rds_password.value
  #   sensitive = true
  value      = nonsensitive(data.aws_ssm_parameter.my_rds_password.value)
  depends_on = [data.aws_ssm_parameter.my_rds_password]
}

# ================================= DB Instance ================================

resource "aws_db_instance" "default" {
  identifier           = "prod-rds"
  allocated_storage    = 10
  db_name              = "prod"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = "administrator"
  password             = data.aws_ssm_parameter.my_rds_password.value
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
  apply_immediately    = true
}

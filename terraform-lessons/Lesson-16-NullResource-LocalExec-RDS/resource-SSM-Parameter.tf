
# =============================== Parameter Store ==============================

resource "aws_ssm_parameter" "rds_password" {
  name        = "/prod/mysql"
  description = "Master password for RDS MySQL"
  type        = "SecureString"
  value       = random_string.rds_password.result
}
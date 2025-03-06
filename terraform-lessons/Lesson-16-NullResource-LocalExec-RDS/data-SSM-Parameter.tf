
# ============================ Data Parameter Store ============================

data "aws_ssm_parameter" "my_rds_password" {
  name       = "/prod/mysql"
  depends_on = [aws_ssm_parameter.rds_password]
}
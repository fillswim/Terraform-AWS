
# =================================== Output ===================================

output "rds_password" {
  #   value = data.aws_ssm_parameter.my_rds_password.value
  #   sensitive = true
  value      = nonsensitive(data.aws_ssm_parameter.my_rds_password.value)
  depends_on = [data.aws_ssm_parameter.my_rds_password]
}

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
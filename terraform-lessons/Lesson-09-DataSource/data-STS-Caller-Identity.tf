
# ============================= Caller Identity =============================

data "aws_caller_identity" "current" {}

# output "data_aws_caller_identity" {
#   value = data.aws_caller_identity.current.account_id
# }
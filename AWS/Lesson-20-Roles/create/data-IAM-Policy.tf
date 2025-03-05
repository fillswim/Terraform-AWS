
# ========================= IAM Policy =========================

data "aws_iam_policy" "s3-readonly" {
  name = "AmazonS3ReadOnlyAccess"
}

# output "s3-readonly-policy" {
#   value = data.aws_iam_policy.s3-readonly
# }
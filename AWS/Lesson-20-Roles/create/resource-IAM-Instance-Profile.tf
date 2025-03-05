
# ========================= IAM Instance Profile =========================

resource "aws_iam_instance_profile" "s3-readonly-tf" {
  name = "s3-readonly-tf"
  role = aws_iam_role.s3-readonly-tf.name
}
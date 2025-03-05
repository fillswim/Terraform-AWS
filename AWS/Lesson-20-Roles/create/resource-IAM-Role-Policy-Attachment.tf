
# ========================= IAM Role Policy Attachment =========================

resource "aws_iam_role_policy_attachment" "s3-readonly-tf" {
  role       = aws_iam_role.s3-readonly-tf.name
  policy_arn = data.aws_iam_policy.s3-readonly.arn
}
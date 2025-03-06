
# ================================ Create users ================================

resource "aws_iam_user" "user1" {
  name = "pushkin"
}

# ============================ Create users in Loop ============================

resource "aws_iam_user" "users" {
  count = length(var.aws_users)
  name  = element(var.aws_users, count.index)
}
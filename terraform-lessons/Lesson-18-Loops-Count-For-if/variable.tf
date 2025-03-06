
# ================================ Variables =================================

variable "aws_users" {
  description = "list of IAM users to create"
  default = ["user1", "user2", "user3"]
}
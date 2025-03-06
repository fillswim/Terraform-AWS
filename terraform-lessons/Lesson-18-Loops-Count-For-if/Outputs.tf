
# =========================== Output all information ===========================

output "created_iam_users_all" {
  value = aws_iam_user.users
}

# ============================ Output all id in loop ===========================

output "created_iam_users_ids" {
  value = aws_iam_user.users[*].id
}

# ========================== Output ARN id in loop for =========================

output "created_iam_users_custom" {
  value = [
    for user in aws_iam_user.users :
    "Usernane: ${user.name} has ARN: ${user.arn}"
  ]
}

# ========================== Output ARN id in loop map =========================

output "created_iam_users_map" {
  value = {
    for user in aws_iam_user.users :
    user.unique_id => user.id # AIDAT5TXQE32FTU4ZO2YI = "user1"
  }
}

# ====================== Output ARN id in loop map and if ======================

output "costom_if" {
  value = [
    for user in aws_iam_user.users :
    user.name if length(user.name) == 5
  ]
}

# ====================== Output Instance ID -> Public IP ======================

output "server_all" {
  value = {
    for server in aws_instance.servers :
    server.id => server.public_ip
  }
}

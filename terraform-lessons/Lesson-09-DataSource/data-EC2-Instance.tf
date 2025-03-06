
# =============================== Search instance ===============================

# data "aws_instance" "my_instance" {

#   filter {
#     name   = "tag:Name"
#     values = ["TestServer"]
#   }

# }

# output "my_instance_id" {
#   value = data.aws_instance.my_instance.id
# }
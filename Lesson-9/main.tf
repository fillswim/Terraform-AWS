# ========================================================

# data "aws_availability_zones" "working" {}

# output "data_aws_availability_zones" {
#   value = data.aws_availability_zones.working.names
#   # value = data.aws_availability_zones.working.names[1]
# }

# # ========================================================

# data "aws_caller_identity" "current" {}

# output "data_aws_caller_identity" {
#   value = data.aws_caller_identity.current.account_id
# }

# # ========================================================

# data "aws_region" "current" {}

# output "aws_region_name" {
#   value = data.aws_region.current.name
# }

# # ========================================================

# data "aws_vpcs" "my_vpcs" {}

# output "aws_region_description" {
#   value = data.aws_region.current.description
# }

# output "data_aws_vpcs" {
#   value = data.aws_vpcs.my_vpcs.ids
# }

# ===================== Все VPC ==========================

data "aws_vpcs" "my_vpcs" {}

output "my_vpcs" {
  value = data.aws_vpcs.my_vpcs
}

# ==================== Поиск VPC =========================

# Найти VPC c тегом "Server-Web"
# data "aws_vpc" "prod_vpc" {

#   id = "eu-central-1"

# }

# output "prod_vpc_id" {
#   value = data.aws_vpc.prod_vpc.id
# }

# ========================================================

# Создание subnet по instnce_id

# resource "aws_subnet" "prod_subnet_1" {
#   vpc_id            = data.aws_instance.prod_vpc.id
#   availability_zone = data.aws_availability_zones.working.names[0]
#   cidr_block        = "10.10.1.0/24"
#   tags = {
#     Name    = "Subnet-1 in ${data.aws_availability_zones.working.names[0]}"
#     Account = "Subnet in Account ${data.aws_caller_identity.current.account_id}"
#     Region  = data.aws_region.current.description
#   }
# }

# data "aws_region" "current" {}
# output "current_region" {
#   value = data.aws_region.current.name
# }

# resource "aws_subnet" "prod_subnet_1" {
#   vpc_id     = data.aws_instance.prod_vpc.id
#   cidr_block = "10.0.1.0/24"
#   # availability_zone = "eu-central-1a"

#   tags = {
#     Name = "Main"
#   }
# }

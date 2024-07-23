# =========================== aws_availability_zones ===========================

data "aws_availability_zones" "working" {}

# output "data_aws_availability_zones" {
#   # Вывод всех зон:
#   value = data.aws_availability_zones.working.names

#   # Вывод одной зоны:
#   # value = data.aws_availability_zones.working.names[1]
# }

# ============================= aws_caller_identity ============================

data "aws_caller_identity" "current" {}

# output "data_aws_caller_identity" {
#   value = data.aws_caller_identity.current.account_id
# }

# ================================== aws_region ================================

data "aws_region" "current" {}

# output "aws_region_name" {
#   value = data.aws_region.current.name
# }

# output "aws_region_description" {
#   value = data.aws_region.current.description
# }

# ================================== aws_vpcs ==================================

data "aws_vpcs" "my_vpcs" {}

# output "data_aws_vpcs" {
#   value = data.aws_vpcs.my_vpcs.ids
# }

# =============================== Поиск instance ===============================

data "aws_instance" "my_instance" {

  filter {
    name   = "tag:Name"
    values = ["TestServer"]
  }

}

# output "my_instance_id" {
#   value = data.aws_instance.my_instance.id
# }

# ================================== Поиск VPC =================================

# Найти VPC c тегом "My-Frankfurt-vpc"
# Virtual Private Cloud – логически изолированная виртуальная сеть в облаке AWS.

data "aws_vpc" "frankfurt_vpc" {

  filter {
    name   = "tag:Name"
    values = ["My-Frankfurt-vpc"]
  }

}

# output "frankfurt_vpc_id" {
#   value = data.aws_vpc.frankfurt_vpc.id
# }

# output "frankfurt_vpc_cidr_block" {
#   value = data.aws_vpc.frankfurt_vpc.cidr_block
# }

# ======================= Добавление aws_subnet по vpc.id ======================

# Создание subnet по vpc.id
resource "aws_subnet" "prod_subnet_1" {
  vpc_id            = data.aws_vpc.frankfurt_vpc.id
  availability_zone = data.aws_availability_zones.working.names[0]
  cidr_block        = "172.31.16.0/20"
  tags = {
    Name    = "Subnet-1 in ${data.aws_availability_zones.working.names[0]}"
    Account = "Subnet in Account ${data.aws_caller_identity.current.account_id}"
    Region  = data.aws_region.current.description
  }
}

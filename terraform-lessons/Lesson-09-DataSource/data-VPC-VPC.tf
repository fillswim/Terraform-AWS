
# ================================== Search VPC =================================

# Найти VPC c тегом "My-Frankfurt-vpc"
# Virtual Private Cloud – логически изолированная виртуальная сеть в облаке AWS.

data "aws_vpc" "frankfurt_vpc" {

  filter {
    name   = "tag:Name"
    values = ["My-Frankfurt-vpc"]
  }

}

output "frankfurt_vpc_id" {
  value = data.aws_vpc.frankfurt_vpc.id
}

output "frankfurt_vpc_cidr_block" {
  value = data.aws_vpc.frankfurt_vpc.cidr_block
}
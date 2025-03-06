
# ======================= Add aws_subnet by vpc.id =======================

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
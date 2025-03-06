
# =========================== Availability Zones ===========================

data "aws_availability_zones" "working" {}

# output "data_aws_availability_zones" {
#   # Вывод всех зон:
#   value = data.aws_availability_zones.working.names

#   # Вывод одной зоны:
#   # value = data.aws_availability_zones.working.names[1]
# }
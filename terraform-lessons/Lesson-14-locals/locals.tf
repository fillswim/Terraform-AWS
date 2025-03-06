
# =============================== Local Variable ===============================

locals {
  full_project_name = "${var.environment}-${var.project_name}"
  full_owner        = "${var.owner} owner of ${var.project_name}"
}

locals {
  region   = data.aws_region.current.description
  az_list  = join(",", data.aws_availability_zones.available.names)
  location = "In ${local.region} there are AZ: ${local.az_list}"
}
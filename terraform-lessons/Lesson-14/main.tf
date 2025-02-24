# =================================== Region ===================================

data "aws_region" "current" {}

# ============================= Availability Zones =============================

data "aws_availability_zones" "available" {}

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

# ================================== Static IP =================================

resource "aws_eip" "my_static_ip" {

  tags = {
    Name       = "Static IP"
    Owner      = local.full_owner
    Project    = local.full_project_name
    region_azs = local.az_list
    location   = local.location
  }

}

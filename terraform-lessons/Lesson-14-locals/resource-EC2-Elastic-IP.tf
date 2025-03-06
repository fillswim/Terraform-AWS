
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
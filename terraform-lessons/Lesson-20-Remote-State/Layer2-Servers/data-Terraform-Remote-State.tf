
# ================================ Remote State ================================

data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "bucket-olympics-excavator-puzzling7"
    key    = "dev/network/terraform.tfstate"
    region = "eu-central-1"
  }
}


# ================================= S3 Backend =================================

terraform {
  backend "s3" {
    bucket = "bucket-olympics-excavator-puzzling7" # Один проект - один bucket
    key    = "dev/network/terraform.tfstate"
    region = "eu-central-1"
  }
}
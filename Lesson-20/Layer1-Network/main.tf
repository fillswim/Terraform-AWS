# ================================= S3 Backend =================================

terraform {
  backend "s3" {
    bucket = "bucket-olympics-excavator-puzzling7" # Один проект - один bucket
    key    = "dev/network/terraform.tfstate"
    region = "eu-central-1"
  }
}

# ===================================== VPC ====================================

resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "my VPC"
  }
}

# ============================== Internet Gateway ==============================

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
}

# =================================== Outputs ==================================

output "vpc_id" {
  value = aws_vpc.main.id
}

output "vpc_cidr" {
  value = aws_vpc.main.cidr_block
}
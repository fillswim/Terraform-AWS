# ================================= S3 Backend =================================

terraform {
  backend "s3" {
    bucket = "bucket-olympics-excavator-puzzling7" # Один проект - один bucket
    key    = "dev/servers/terraform.tfstate"
    region = "eu-central-1"
  }
}

# ================================ Remote State ================================

data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "bucket-olympics-excavator-puzzling7"
    key    = "dev/network/terraform.tfstate"
    region = "eu-central-1"
  }
}

# =============================== Security Group ===============================

# resource "aws_security_group" "webserver" {
#   name   = "WebServer Security Group"
#   vpc_id = data.terraform_remote_state.network.outputs.vpc_id

#   tags = {
#     Name  = "web-server-sg"
#     Owner = "Oleg Filatov"
#   }

#   # =============== Входящий трафик ===============

#   ingress {
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   ingress {
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = [data.terraform_remote_state.network.outputs.vpc_cidr]
#   }

#   # =============== Исходящий трафик ===============

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

# }

# =================================== Outputs ==================================

output "network_details" {
  value = data.terraform_remote_state.network
}
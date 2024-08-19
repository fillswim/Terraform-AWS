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

# =================================== Outputs ==================================

output "network_details" {
  value = data.terraform_remote_state.network
}

# =============================== Security Group ===============================

resource "aws_security_group" "webserver" {
  name   = "WebServer Security Group"
  vpc_id = data.terraform_remote_state.network.outputs.vpc_id

  tags = {
    Name  = "web-server-sg"
    Owner = "Oleg Filatov"
  }

  # =============== Входящий трафик ===============

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [data.terraform_remote_state.network.outputs.vpc_cidr]
  }

  # =============== Исходящий трафик ===============

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

# ================================== Instance ==================================

resource "aws_instance" "web_server" {
  ami                    = "ami-0e872aee57663ae2d" # Canonical, Ubuntu, 24.04 LTS, amd64 noble image build on 2024-07-01
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.webserver.id]
  subnet_id              = data.terraform_remote_state.network.outputs.public_subnet_ids[0]
  tags = {
    Name = "Web Server"
  }
}
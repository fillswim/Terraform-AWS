
# =========================== Security Group ===========================

resource "aws_security_group" "my_webserver" {
  name        = "WebServer security group"
  description = "My First Security Group"

  tags = {
    Name    = "Web Server Security group Build by Terraform"
    Project = "Terraform Lessons"
  }

  # ========================= Входящий трафик =========================

  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # ========================= Исходящий трафик =========================

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
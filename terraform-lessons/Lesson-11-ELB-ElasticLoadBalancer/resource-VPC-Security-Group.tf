
# =============================== Security Group ===============================

resource "aws_security_group" "web" {
  name   = "Dynamic Security Group"
  vpc_id = aws_default_vpc.default.id

  tags = {
    Name  = "Dynamic Security Group"
    Owner = "Oleg Filatov"
  }

  # =============== Входящий трафик ===============

  dynamic "ingress" {

    for_each = ["80", "443"]

    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  # =============== Исходящий трафик ===============

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
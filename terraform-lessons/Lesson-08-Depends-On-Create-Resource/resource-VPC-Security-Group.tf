
# =========================== Security Group ===========================

resource "aws_security_group" "my_webserver" {
  name = "My Security Group"

  # ========================= Входящий трафик =========================

  dynamic "ingress" {

    for_each = ["22", "80", "443", "9092"]

    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  # ========================= Исходящий трафик =========================

  dynamic "egress" {

    for_each = ["80", "443"]

    content {
      from_port   = egress.value
      to_port     = egress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

}
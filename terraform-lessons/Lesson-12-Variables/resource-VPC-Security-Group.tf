
# =============================== Security Group ===============================

resource "aws_security_group" "my_server" {
  name   = "My Security Group"
  vpc_id = aws_default_vpc.default.id

  #   tags = var.common_tags
  tags = merge(var.common_tags, { Name = "${var.common_tags["Environment"]} Server SecurityGroup" })

  # =============== Входящий трафик ===============

  dynamic "ingress" {

    for_each = var.allow_ports

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
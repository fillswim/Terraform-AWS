# ================================= Defaul VPC =================================

resource "aws_default_vpc" "default" {}

# =============================== Amazon Linux 2 ===============================

data "aws_ami" "latest_amazon" {

  owners      = ["137112412989"]
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-2.0.*-x86_64-gp2"]
  }

}

# ================================== Static IP =================================

resource "aws_eip" "my_static_ip" {

  instance = aws_instance.my_server.id
  #   tags = var.common_tags
  #   tags = merge(var.common_tags, { Name = "Server IP" })
  tags = merge(var.common_tags, { Name = "${var.common_tags["Environment"]} Server IP" })

}

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

# ================================== Instance ==================================

resource "aws_instance" "my_server" {
  ami                    = data.aws_ami.latest_amazon.id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.my_server.id]
  monitoring             = var.enable_detailed_monitoring

  #   tags = var.common_tags
  tags = merge(var.common_tags, { Name = "${var.common_tags["Environment"]} Server Build by Terraform" })

}

resource "aws_instance" "my_webserver" {
  ami                    = "ami-08188dffd130a1ac2" # Amazon Linux 2023 AMI
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.my_webserver.id] # Привязка Security Group
  user_data              = file("user_data.sh")

  tags = {
    Name    = "Web Server Build by Terraform"
    Project = "Terraform Lessons"
  }
}

# =========================== Главный Security Group ===========================

resource "aws_security_group" "my_webserver" {
  name        = "WebServer security group"
  description = "My First Security Group"

  tags = {
    Name    = "Web Server Security group Build by Terraform"
    Project = "Terraform Lessons"
  }
}

# ============================== Входящий трафик ==============================

resource "aws_vpc_security_group_egress_rule" "my_webserver_egress_80" {
  security_group_id = aws_security_group.my_webserver.id
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp" # Любой протокол
  cidr_ipv4         = "0.0.0.0/0"
}

resource "aws_vpc_security_group_egress_rule" "my_webserver_egress_443" {
  security_group_id = aws_security_group.my_webserver.id
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp" # Любой протокол
  cidr_ipv4         = "0.0.0.0/0"
}

# ============================== Исходящий трафик ==============================

resource "aws_vpc_security_group_ingress_rule" "my_webserver_ingress_80" {
  security_group_id = aws_security_group.my_webserver.id
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0"
}

resource "aws_vpc_security_group_ingress_rule" "my_webserver_ingress_443" {
  security_group_id = aws_security_group.my_webserver.id
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0"
}

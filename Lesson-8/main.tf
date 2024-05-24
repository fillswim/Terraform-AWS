resource "aws_instance" "my_server_web" {
  ami                    = "ami-08188dffd130a1ac2" # Amazon Linux 2023 AMI
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.my_webserver.id] # Привязка Security Group

  tags = {
    Name = "Server-Web"
  }

  depends_on = [ aws_instance.my_server_db ]
  
}

resource "aws_instance" "my_server_app" {
  ami                    = "ami-08188dffd130a1ac2" # Amazon Linux 2023 AMI
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.my_webserver.id] # Привязка Security Group

  tags = {
    Name = "Server-Application"
  }

  depends_on = [ aws_instance.my_server_db ]

}

resource "aws_instance" "my_server_db" {
  ami                    = "ami-08188dffd130a1ac2" # Amazon Linux 2023 AMI
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.my_webserver.id] # Привязка Security Group

  tags = {
    Name = "Server-Database"
  }
}

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

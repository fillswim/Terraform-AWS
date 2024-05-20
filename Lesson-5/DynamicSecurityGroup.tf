resource "aws_instance" "my_webserver" {
  ami                    = "ami-08188dffd130a1ac2" # Amazon Linux 2023 AMI
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.my_webserver.id] # Привязка Security Group
  user_data = templatefile("user_data.sh.tpl", {
    f_name = "Oleg",
    l_name = "Filatov",
    names  = ["Nick", "Pete"]
  })

  tags = {
    Name    = "Web Server Build by Terraform"
    Project = "Terraform Lessons"
  }
}

resource "aws_security_group" "my_webserver" {
  name        = "WebServer security group"
  description = "My First Security Group"

  tags = {
    Name    = "Dynamic Security group Build by Terraform"
    Project = "Terraform Lessons"
  }

  # ========================= Входящий трафик =========================

  dynamic "ingress" {

    for_each = [ "80", "443", "9092" ]

    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  # Отдельное правило
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
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

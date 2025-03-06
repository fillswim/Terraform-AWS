
# =========================== EC2 Instance ===========================

resource "aws_instance" "my_server_web" {
  ami                    = "ami-08188dffd130a1ac2" # Amazon Linux 2023 AMI
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.my_webserver.id] # Привязка Security Group

  tags = {
    Name = "Server-Web"
  }

  # depends_on = [ aws_instance.my_server_db ]
  
}

# resource "aws_instance" "my_server_app" {
#   ami                    = "ami-08188dffd130a1ac2" # Amazon Linux 2023 AMI
#   instance_type          = "t2.micro"
#   vpc_security_group_ids = [aws_security_group.my_webserver.id] # Привязка Security Group

#   tags = {
#     Name = "Server-Application"
#   }

#   depends_on = [ aws_instance.my_server_db ]

# }

# resource "aws_instance" "my_server_db" {
#   ami                    = "ami-08188dffd130a1ac2" # Amazon Linux 2023 AMI
#   instance_type          = "t2.micro"
#   vpc_security_group_ids = [aws_security_group.my_webserver.id] # Привязка Security Group

#   tags = {
#     Name = "Server-Database"
#   }
# }
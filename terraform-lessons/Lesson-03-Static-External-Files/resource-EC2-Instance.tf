
# =========================== EC2 Instance ===========================

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
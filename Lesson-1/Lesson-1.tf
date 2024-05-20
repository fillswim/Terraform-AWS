resource "aws_instance" "my_Ubuntu" {
  count         = 1
  ami           = "ami-01e444924a2233b07"       # Ubuntu Server 24.04 LTS (HVM), SSD Volume Type
  instance_type = "t2.micro"
  tags = {
    Name    = "My Amazon Server"
    Project = "Terraform Lessons"
  }
}

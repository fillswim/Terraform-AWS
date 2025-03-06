
# =============================== Create Instance ==============================

resource "aws_instance" "my_frankfurt_server" {
  provider      = aws.Default
  ami           = "ami-0e872aee57663ae2d" # Canonical, Ubuntu, 24.04 LTS, amd64 noble image build on 2024-07-01
  instance_type = "t2.micro"
  tags = {
    Name = "My Frankfurt Server"
  }
}

resource "aws_instance" "my_ireland_server" {
  provider      = aws.Ireland
  ami           = "ami-0c38b837cd80f13bb" # Canonical, Ubuntu, 24.04 LTS, amd64 noble image build on 2024-07-01
  instance_type = "t2.micro"
  tags = {
    Name = "My Ireland Server"
  }
}
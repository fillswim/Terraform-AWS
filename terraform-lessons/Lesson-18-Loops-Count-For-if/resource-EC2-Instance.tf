
# =========================== Create instance in Loop ==========================

resource "aws_instance" "servers" {
  count         = 3
  ami           = "ami-0e872aee57663ae2d" # Canonical, Ubuntu, 24.04 LTS, amd64 noble image build on 2024-07-01
  instance_type = "t2.micro"
  tags = {
    Name = "Server Number ${count.index + 1}"
  }
}
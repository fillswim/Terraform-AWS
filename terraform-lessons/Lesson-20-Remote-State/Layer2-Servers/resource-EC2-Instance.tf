
# ================================== Instance ==================================

resource "aws_instance" "web_server" {
  ami                    = "ami-0e872aee57663ae2d" # Canonical, Ubuntu, 24.04 LTS, amd64 noble image build on 2024-07-01
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.webserver.id]
  subnet_id              = data.terraform_remote_state.network.outputs.public_subnet_ids[0]
  tags = {
    Name = "Web Server"
  }
}
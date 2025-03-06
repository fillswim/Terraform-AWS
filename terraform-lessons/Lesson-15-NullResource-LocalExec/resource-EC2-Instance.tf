
# ================================== Instance ==================================

resource "aws_instance" "my_server" {
  ami           = "ami-0dd35f81b9eeeddb1"
  instance_type = "t2.micro"
  provisioner "local-exec" {
    command = "echo Hello from AWS Instance Creation!"
  }
}
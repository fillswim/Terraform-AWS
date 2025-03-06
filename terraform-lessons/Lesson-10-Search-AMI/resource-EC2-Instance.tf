
# ============================ Create Server Ubuntu ============================

resource "aws_instance" "my_Ubuntu_latest" {
  count         = 1
  ami           = data.aws_ami.latest_ubuntu.id
  instance_type = "t2.micro"
}
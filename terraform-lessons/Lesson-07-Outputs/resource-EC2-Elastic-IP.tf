
# =========================== Elastic IP ===========================

resource "aws_eip" "my_static_ip" {
  instance = aws_instance.my_webserver.id
}
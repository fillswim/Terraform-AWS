
# ================================== Static IP =================================

resource "aws_eip" "my_static_ip" {

  instance = aws_instance.my_server.id
  #   tags = var.common_tags
  #   tags = merge(var.common_tags, { Name = "Server IP" })
  tags = merge(var.common_tags, { Name = "${var.common_tags["Environment"]} Server IP" })

}
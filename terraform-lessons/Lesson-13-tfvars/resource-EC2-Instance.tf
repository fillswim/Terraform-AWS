
# ================================== Instance ==================================

resource "aws_instance" "my_server" {
  ami                    = data.aws_ami.latest_amazon.id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.my_server.id]
  monitoring             = var.enable_detailed_monitoring

  #   tags = var.common_tags
  tags = merge(var.common_tags, { Name = "${var.common_tags["Environment"]} Server Build by Terraform" })

}
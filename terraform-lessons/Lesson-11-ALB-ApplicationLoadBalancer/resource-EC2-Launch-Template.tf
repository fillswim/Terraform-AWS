
# =============================== Launch Template ==============================

resource "aws_launch_template" "web" {
  name                   = "WebServer-Highly-Available-LT"
  image_id               = data.aws_ami.latest_amazon.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.web.id]
  user_data              = filebase64("${path.module}/user_data.sh")
}
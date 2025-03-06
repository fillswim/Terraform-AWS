
# ============================ Launch Configuration ============================

resource "aws_launch_configuration" "web" {
  #   name            = "WebServer-Highly-Available-LC"
  name_prefix     = "WebServer-Highly-Available-LC-"
  image_id        = data.aws_ami.latest_amazon.id
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.web.id]
  user_data       = file("user_data.sh")

  lifecycle {
    create_before_destroy = true
  }

}
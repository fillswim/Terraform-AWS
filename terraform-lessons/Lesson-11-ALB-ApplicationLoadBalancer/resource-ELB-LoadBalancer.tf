
# ================================ Load Balancer ===============================

resource "aws_lb" "web" {
  name               = "WebServer-HighlyAvailable-ALB"
  load_balancer_type = "application"
  security_groups    = [aws_security_group.web.id]
  subnets            = [aws_default_subnet.default_az1.id, aws_default_subnet.default_az2.id]
}
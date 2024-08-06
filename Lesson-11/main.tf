# =========================== aws_availability_zones ===========================

data "aws_availability_zones" "working" {}

# =============================== Amazon Linux 2 ===============================

data "aws_ami" "latest_amazon" {
  owners      = ["137112412989"]
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-2.0.*-x86_64-gp2"]
  }
}

# ================================= Defaul VPC =================================

resource "aws_default_vpc" "default" {}

# ================================ Defaul Subnet ===============================

resource "aws_default_subnet" "default_az1" {
  availability_zone = data.aws_availability_zones.working.names[0]
}

resource "aws_default_subnet" "default_az2" {
  availability_zone = data.aws_availability_zones.working.names[1]
}

# =============================== Security Group ===============================

resource "aws_security_group" "web" {
  name   = "Web Security Group"
  vpc_id = aws_default_vpc.default.id

  tags = {
    Name = "Web Security Group"
  }

  # =============== Входящий трафик ===============

  dynamic "ingress" {

    for_each = ["80", "443"]

    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  # =============== Исходящий трафик ===============

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

# =============================== Launch Template ==============================

resource "aws_launch_template" "web" {
  name                   = "WebServer-Highly-Available-LT"
  image_id               = data.aws_ami.latest_amazon.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.web.id]
  user_data              = filebase64("${path.module}/user_data.sh")
}

# ============================== AutoScaling Group ==============================

resource "aws_autoscaling_group" "web" {
  name                = "WebServer-Highly-Available-ASG-Ver-${aws_launch_template.web.latest_version}"
  min_size            = 2
  max_size            = 2
  min_elb_capacity    = 2
  health_check_type   = "ELB" # Elastic Load Balancer
  vpc_zone_identifier = [aws_default_subnet.default_az1.id, aws_default_subnet.default_az2.id]
  target_group_arns   = [aws_lb_target_group.web.id]

  launch_template {
    id      = aws_launch_template.web.id
    version = aws_launch_template.web.latest_version
  }

  dynamic "tag" {
    for_each = {
      Name    = "WebServer in AGS-v${aws_launch_template.web.latest_version}"
      FAGKEY  = "TAGVALUE"
      Project = "DevOps"
    }
    content {
      key                 = tag.key
      value               = tag.value
      propagate_at_launch = true
    }
  }

  lifecycle {
    create_before_destroy = true
  }

}

# ================================ Load Balancer ===============================

resource "aws_lb" "web" {
  name               = "WebServer-HighlyAvailable-ALB"
  load_balancer_type = "application"
  security_groups    = [aws_security_group.web.id]
  subnets            = [aws_default_subnet.default_az1.id, aws_default_subnet.default_az2.id]
}

# ========================= Load Balancer Target Group =========================

resource "aws_lb_target_group" "web" {
  name                 = "WebServer-HighlyAvailable-TG"
  vpc_id               = aws_default_vpc.default.id
  port                 = 80
  protocol             = "HTTP"
  deregistration_delay = 10 # seconds
}

# =========================== Load Balancer Listener ===========================

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.web.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web.arn
  }

}

# =================================== Output ===================================

output "web_loadbalancer_url" {
  value = aws_lb.web.dns_name
}

# ================================== Instance ==================================

resource "aws_instance" "my_server" {
  ami = "ami-0dd35f81b9eeeddb1"
  # instance_type = var.env == "prod" ? "t2.micro" : "t3.micro"
  instance_type = var.env == "prod" ? var.ec2_size["prod"] : var.ec2_size["dev"]
  tags = {
    Name  = "${var.env}-server"
    Owner = var.env == "prod" ? var.prod_owner : var.non_prod_owner
  }
}

resource "aws_instance" "my_server_dev" {
  count         = var.env == "dev" ? 1 : 0 # Создавать только в "dev" окружении
  ami           = "ami-0dd35f81b9eeeddb1"
  instance_type = "t3.micro"
  tags = {
    Name = "My Dev Server 1"
  }
}

resource "aws_instance" "my_server_dev_2" {
  ami = "ami-0dd35f81b9eeeddb1"
  # instance_type = lookup(var.ec2_size, "prod")
  instance_type = lookup(var.ec2_size, var.env) # var.env = "dev"
  tags = {
    Name = "My Dev Server 2"
  }
}

# ================================= Defaul VPC =================================

resource "aws_default_vpc" "default" {}

# =============================== Security Group ===============================

resource "aws_security_group" "my_webserver" {
  name   = "Dynamic Security Group"
  vpc_id = aws_default_vpc.default.id

  dynamic "ingress" {
    for_each = lookup(var.allow_port_list, var.env)
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "Dynamic SecurityGroup"
    Owner = "Denis Astahov"
  }
}

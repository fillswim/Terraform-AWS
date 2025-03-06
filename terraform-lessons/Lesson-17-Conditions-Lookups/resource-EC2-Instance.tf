
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
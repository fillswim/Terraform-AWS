
# Find Latest AMI id of:
#    - Ubuntu 24.04
#    - Amazon Linux 2
#    - Windows Server 2016 Base

# ================================ Ubuntu 24.04 ================================

data "aws_ami" "latest_ubuntu" {
  owners      = ["099720109477"]
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }
}

output "latest_ubuntu_ami_id" {
  value = data.aws_ami.latest_ubuntu.id
}

output "latest_ubuntu_ami_name" {
  value = data.aws_ami.latest_ubuntu.name
}

# =============================== Amazon Linux 2 ===============================

data "aws_ami" "latest_amazon" {
  owners      = ["137112412989"]
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-2.0.*-x86_64-gp2"]
  }
}

output "latest_amazon_ami_id" {
  value = data.aws_ami.latest_amazon.id
}

output "latest_amazon_ami_name" {
  value = data.aws_ami.latest_amazon.name
}

# ============================ Create Server Ubuntu ============================

resource "aws_instance" "my_Ubuntu_latest" {
  count         = 1
  ami           = data.aws_ami.latest_ubuntu.id
  instance_type = "t2.micro"
}


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
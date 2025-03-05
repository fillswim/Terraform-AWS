
# ========================= Key Pair =========================

data "aws_key_pair" "test-keypair" {
  key_name           = "test-keypair"
  include_public_key = true

  filter {
    name   = "tag:Name"
    values = ["test-keypair"]
  }
}
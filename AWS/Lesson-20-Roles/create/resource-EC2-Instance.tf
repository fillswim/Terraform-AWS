
# ========================== EC2 Instance ===========================

resource "aws_instance" "test-server" {
  ami                    = "ami-016038ae9cc8d9f51"
  instance_type          = "t3.micro"
  key_name               = data.aws_key_pair.test-keypair.key_name
  vpc_security_group_ids = [aws_security_group.test-server-sg.id]
  iam_instance_profile   = aws_iam_instance_profile.s3-readonly-tf.name

  tags = {
    Name = "test-server"
  }
}


# =============================== Local Executor ===============================

resource "null_resource" "command1" {
  provisioner "local-exec" {
    command = "echo Terraform START: $(date) >> log.txt"
  }
}

resource "null_resource" "command2" {
  provisioner "local-exec" {
    command = "ping -c 5 www.google.com"
  }
}

# resource "null_resource" "command3" {
#   provisioner "local-exec" {
#     command = "python -c 'print('HelloWorld')'"
#   }
# }

resource "null_resource" "command4" {
  provisioner "local-exec" {
    command = "echo $NAME1 $NAME2 $NAME3 >> names.txt"
    environment = {
      NAME1 = "Vasya"
      NAME2 = "Petya"
      NAME3 = "Kolya"
    }
  }
}

# ================================== Instance ==================================

resource "aws_instance" "my_server" {
  ami           = "ami-0dd35f81b9eeeddb1"
  instance_type = "t2.micro"
  provisioner "local-exec" {
    command = "echo Hello from AWS Instance Creation!"
  }
}
# ==============================================================================

resource "null_resource" "command5" {
  provisioner "local-exec" {
    command = "echo Terraform END: $(date) >> log.txt"
  }

  depends_on = [null_resource.command1, null_resource.command2, null_resource.command4, aws_instance.my_server]
}

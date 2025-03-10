# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform
resource "aws_instance" "linux_server_imported" {
  ami                                  = "ami-016038ae9cc8d9f51"
  associate_public_ip_address          = true
  availability_zone                    = "eu-north-1b"
  disable_api_stop                     = false
  disable_api_termination              = false
  ebs_optimized                        = true
  enable_primary_ipv6                  = null
  get_password_data                    = false
  hibernation                          = false
  host_id                              = null
  host_resource_group_arn              = null
  iam_instance_profile                 = null
  instance_initiated_shutdown_behavior = "stop"
  instance_type                        = "t3.micro"
  key_name                             = "test-keypair"
  monitoring                           = false
  placement_group                      = null
  placement_partition_number           = 0
  private_ip                           = "172.31.47.245"
  secondary_private_ips                = []
  security_groups                      = ["my-linux-firewall-ssh-https"]
  source_dest_check                    = true
  subnet_id                            = "subnet-06b6d0eb8f79f7dd1"
  tags = {
    Name = "test-amazon-linux"
  }
  tags_all = {
    Name = "test-amazon-linux"
  }
  tenancy                     = "default"
  user_data                   = null
  user_data_base64            = null
  user_data_replace_on_change = null
  volume_tags                 = null
  vpc_security_group_ids      = ["sg-0b9d42527bc7aca8e"]
  capacity_reservation_specification {
    capacity_reservation_preference = "open"
  }
  cpu_options {
    amd_sev_snp      = null
    core_count       = 1
    threads_per_core = 2
  }
  credit_specification {
    cpu_credits = "unlimited"
  }
  enclave_options {
    enabled = false
  }
  maintenance_options {
    auto_recovery = "default"
  }
  metadata_options {
    http_endpoint               = "enabled"
    http_protocol_ipv6          = "disabled"
    http_put_response_hop_limit = 2
    http_tokens                 = "required"
    instance_metadata_tags      = "disabled"
  }
  private_dns_name_options {
    enable_resource_name_dns_a_record    = true
    enable_resource_name_dns_aaaa_record = false
    hostname_type                        = "ip-name"
  }
  root_block_device {
    delete_on_termination = true
    encrypted             = false
    iops                  = 3000
    kms_key_id            = null
    tags                  = {}
    tags_all              = {}
    throughput            = 125
    volume_size           = 8
    volume_type           = "gp3"
  }
}

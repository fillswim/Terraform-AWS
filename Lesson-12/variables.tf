variable "instance_type" {
  description = "Enter Instance Type"
  type        = string
  default     = "t2.micro"
}

variable "allow_ports" {
  description = "List of Ports to open for server"
  type        = list(any)
  default     = ["80", "443", "22", "8080"]
}

variable "enable_detailed_monitoring" {
  type    = bool
  default = true
}

variable "common_tags" {
  description = "Common tags to apply to all resources"
  type        = map(any)
  default = {
    Owner       = "Oleg Filatov"
    Project     = "Phoenix"
    Environment = "development"
  }
}

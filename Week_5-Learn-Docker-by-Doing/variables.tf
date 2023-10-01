# Variable
variable "db_name" {
  description = "Name database"
  default     = "testdb"
}

variable "db_user" {
  description = "User database"
  default     = "admin"
}

variable "db_password" {
  description = "Password database"
  default     = "Passw0rd"
}

variable "untagged_images" {
  default = 3
}

variable "region" {
  default = "us-east-2"
}

variable "public_key" {
  description = "Source public key"
  default     = "~/.ssh/id_rsa.pub"
}

variable "private_key" {
  description = "Source private key"
  default     = "~/.ssh/id_rsa"
}

variable "postgres_env" {
  default = [
    {
      "name" : "DB_NAME",
      "value" : var.db_name
    },
    {
      "name" : "DB_USER",
      "value" : var.db_user
    },
    {
      "name" : "DB_PASSWORD",
      "value" : var.db_password
    },
    {
      "name" : "DB_IP",
      "value" : aws_instance.BD.private_ip
    },
    {
      "name" : "DJANGO_ALLOWED_HOSTS",
      "value" : aws_lb.web.dns_name
    }
  ]
}

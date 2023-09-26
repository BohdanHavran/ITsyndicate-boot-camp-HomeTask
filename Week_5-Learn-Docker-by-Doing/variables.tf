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

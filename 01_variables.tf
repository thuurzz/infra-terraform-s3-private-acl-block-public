variable "region" {
  description = "Region to deploy the resources"
  type        = string
}

variable "bucket_name" {
  description = "Name of the bucket"
  type        = string
}
variable "ip_address" {
  description = "Your Ip, for example: 191.23.90.24"
}

# variable "private_vpc_cidr_1" {
#   description = "CIDR for the VPC - 1"
# }

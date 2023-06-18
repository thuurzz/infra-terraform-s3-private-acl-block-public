resource "aws_vpc_endpoint" "vpc-end-ponint-s3-1" {
  vpc_id              = var.private_vpc_cidr_1.id
  service_name        = "com.amazonaws.${var.region}.s3"
  vpc_endpoint_type   = "Gateway"
}
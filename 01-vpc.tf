resource "aws_vpc" "demo-vpc" {
  cidr_block           = "10.69.0.0/16"
  instance_tenancy     = "default"
  enable_dns_hostnames = true # optional, defaults to true
  enable_dns_support   = true # optional, defaults to true

  tags = {
    Name = "demo-vpc"
  }
}
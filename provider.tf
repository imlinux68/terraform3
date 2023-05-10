provider "aws" {
  region = "us-west-2"
}

resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    "Name" = "My_VPC"
    "Environment" = "Dev"
    "Location" = "USA"
  }
}



output "vpc_cidr" {
    value = "${aws_vpc.my_vpc.id}"
}










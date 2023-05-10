provider "aws" {
  region = "us-west-2"
}

terraform {
    backend "s3" {
      bucket = "myterraform.10.05.2023" #should be exist
      key = "terraform.tfstate"
      region = "us-west-2"
      dynamodb_table = "myterraform.10.05.2023" #should be already exist
    }
}

resource "aws_vpc" "my_vpc" {
    count = 0
  cidr_block = "${var.vpc_cidr}"
  instance_tenancy = "default"

  tags = {
    "Name" = "My_VPC"
    "Environment" = "${terraform.workspace}"
    "Location" = "USA-2a"
  }
}


output "vpc_cidr" {
    value = "${aws_vpc.my_vpc.id}"
}










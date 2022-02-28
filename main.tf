provider "aws" {
    region = "eu-west-3"

}

variable vpc_cidr_block {}
variable subnet_cidr_block {}
variable avail_zone {}
variable env_prefix{}

resource "aws-vpc" "myapp-vpc" {
    cider_block = var.vpc_cidr_block
    tags = {
        Name: "${var.env_prefix}-vpc"
    }
}

resource "aws_subnet" "myapp-subnet-1" {
    vpc_id = aws.vpc.my-app-vpc.vpc_id
    cidr_block = var.subnet_cidr_block
    availability_zone = var.avail_zone
    tags = {
        Name: "${var.env_prefix}-subnet"
    }
}
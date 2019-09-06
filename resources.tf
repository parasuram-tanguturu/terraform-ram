resource "google_compute_network" "my_development_network" {
  name = "devnetwork"
  auto_create_subnetworks = false
}
resource "aws_vpc" "environment-example-two" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
  tags= {
    Name = "terraform-practice-aws-vpc"
  }
}

resource "aws_subnet" "subnet1" {
  cidr_block = "${cidrsubnet(aws_vpc.environment-example-two.cidr_block, 3, 1)}"
  vpc_id = "${aws_vpc.environment-example-two.id}"
  availability_zone = "us-east-1a"
  tags = {
    Name= "terraform-practice-aws-vpc-subnet1"
  }
}

resource "aws_subnet" "subnet2" {
  cidr_block = "${cidrsubnet(aws_vpc.environment-example-two.cidr_block, 2, 2)}"
  vpc_id = "${aws_vpc.environment-example-two.id}"
  availability_zone = "us-east-1b"
  tags = {
    Name ="terraform-practice-aws-vpc-subnet2"
  }
}

resource "aws_security_group" "subnetsecurity" {
  vpc_id = "${aws_vpc.environment-example-two.id}"
  ingress {
    cidr_blocks = [
     "${aws_vpc.environment-example-two.cidr_block}"
    ]
    from_port = 80
    protocol = "tcp"
    to_port = 80
  }
  tags ={
    Name="terraform-practice-aws-vpc-subnet-securityGroup"
  }
}

resource "azurerm_resource_group" "azy_network" {
  location = "South india"
  name = "devresgrp"
  tags ={
    Name="terraform-practice-rg"
  }
}
resource "azurerm_virtual_network" "blue_virtual_network" {
  address_space = ["10.0.0.0/16"]
  location = "South india"
  name = "bluevirtnetwork"
  resource_group_name = "${azurerm_resource_group.azy_network.name}"
  dns_servers = ["10.0.0.4","10.0.0.5"]
  subnet {
    address_prefix = "10.0.1.0/24"
    name = "subnet1"
  }
  subnet {
    address_prefix = "10.0.2.0/24"
    name = "subnet2"
  }
  tags ={
    Name="terraform-practice-rg"
  }
}
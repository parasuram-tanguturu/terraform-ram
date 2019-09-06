resource "google_compute_network" "my_development_network" {
  name                    = "devnetwork"
  auto_create_subnetworks = false
}
resource "aws_vpc" "environment-example-two" {
  cidr_block           = "${var.aws_ip_cidr_range}"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "terraform-practice-aws-vpc"
  }
}

resource "azurerm_resource_group" "azy_network" {
  location = "South india"
  name     = "devresgrp"
  tags = {
    Name = "terraform-practice-rg"
  }
}
resource "azurerm_virtual_network" "blue_virtual_network" {
  address_space       = ["10.0.0.0/16"]
  location            = "South india"
  name                = "bluevirtnetwork"
  resource_group_name = "${azurerm_resource_group.azy_network.name}"
  dns_servers         = ["10.0.0.4", "10.0.0.5"]
  subnet {
    address_prefix = "10.0.1.0/24"
    name           = "subnet1"
  }
  subnet {
    address_prefix = "10.0.2.0/24"
    name           = "subnet2"
  }
  tags = {
    Name = "terraform-practice-rg"
  }
}
variable "gcp_network_name" {
  default = "thenewnet"
  type = "string"
  description = "Just the network name for the Google Compute Platform."
}

variable "gcp_ip_cidr_range" {
  default = "10.0.0.0/16"
  type = "string"
  description = "IP CIDR Range for Google VPC."
}

variable "aws_ip_cidr_range" {
  default = "10.0.1.0/24"
  type = "string"
  description = "IP CIDR Range for AWS VPC."
}
variable "subnet_names" {
  type = "map"
  default = {
    subnet1 = "subnetone"
    subnet2 = "subnettwo"
    subnet3 = "subnetthree"
  }
}
#======================decsribes diffrent variable type==============================#
variable "newvaraible" {
  type = "string"
  default = "this is value"
}

variable "maptype" {
  type = "map"
  default = {
    subnet1="subnet1"
    subnet2="subnet2"
    subnet3="bettersubnet3"
  }
}

variable "listtype" {
  type = "list"
  default = ["itemm1","item2"]

}
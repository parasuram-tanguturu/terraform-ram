provider "google" {
  credentials = "${file("../google_cloud_account.json")}"
  project     = "oceanic-depth-252013"
  region      = "us-west1"
}
provider "aws" {
  region = "us-east-1"
}
provider "azurerm" {
  subscription_id = "${var.subscription_id}"
  client_id       = "${var.client_id}"
  client_secret   = "${var.client_secret}"
  tenant_id       = "${var.tenant_id}"
}

variable "subscription_id" {
  description = "it is id in az accountlist"
}
variable "client_id" {
  description = " it is appId in a role"
}
variable "client_secret" {
  description = " it is password in a role"
}
variable "tenant_id" {
  description = "it is tenant in role"
}

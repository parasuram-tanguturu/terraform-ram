resource "google_compute_instance" "firstserver" {
  machine_type = "f1-micro"
  name = "terraform-firstserver"
  zone = "asia-south1-a"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  network_interface {
    subnetwork = "${google_compute_subnetwork.dev-subnet.name}"
    access_config {}
  }
  metadata={
    foo= "bar"
  }
  service_account {
    scopes = ["userinfo-email","compute-ro","storage-ro"]
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-*"]
  }
  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"]
}
resource "aws_instance" "secondserver" {
  ami = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.subnet1.id}"
  tags ={
    Name="terraform-practice-vm"
  }
}
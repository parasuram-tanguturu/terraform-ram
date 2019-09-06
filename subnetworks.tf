

resource "google_compute_subnetwork" "dev-subnet" {
  ip_cidr_range = "10.0.1.0/24"
  name = "devsubnet"
  network = "${google_compute_network.my_development_network.self_link}"
  region = "asia-south1"
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



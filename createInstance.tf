data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  count         = 2
  ami           = "${var.AMI_ID}"
  instance_type = "t2.micro"

  tags = {
    Name = "${var.INSTANCE_NAME}-${count.index}"
  }
}
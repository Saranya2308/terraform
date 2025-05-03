provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  count         = 10
  ami           = "ami-0c2b8ca1dad447f8a" # Amazon Linux 2 in us-east-1
  instance_type = "t2.micro"

  tags = {
    Name = "Jenkins-Instance-${count.index + 1}"
  }
}

output "instance_ips" {
  value = [for instance in aws_instance.example : instance.public_ip]
}

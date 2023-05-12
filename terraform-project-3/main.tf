data "aws_ami" "amazon_linux_2" {
  most_recent = var.most_recent_ami
}

data "aws_availability_zones" "available" {}

output "availability_zones" {
  value = data.aws_availability_zones.available.names
}

resource "aws_instance" "raes_instance" {
    ami           = data.aws_ami.amazon_linux_2.id
    instance_type = var.instance_type
    subnet_id     = aws_subnet.raes_pub_subnet1.id
    availability_zone = data.aws_availability_zones.available.names[0]
    
 tags = {
    Name = "raes_instance"
  }
}

resource "aws_vpc" "raes_vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  tags = {
    Name = "raes_vpc"
  }
}

resource "aws_subnet" "raes_pub_subnet1" {
    vpc_id     = aws_vpc.raes_vpc.id
    cidr_block = var.public_subnet_cidr[0]
    availability_zone = data.aws_availability_zones.available.names[0]
  tags = {
    Name = "raes_pub_subnet1"
  }
}

resource "aws_subnet" "raes_pub_subnet2" {
  vpc_id     = aws_vpc.raes_vpc.id
  cidr_block = var.public_subnet_cidr[1]
availability_zone = data.aws_availability_zones.available.names[1]
  tags = {
    Name = "raes_pub_subnet2"
  }
}

resource "aws_subnet" "raes_priv_subnet1" {
  vpc_id     = aws_vpc.raes_vpc.id
  cidr_block = var.private_subnet_cidr[0]
availability_zone = data.aws_availability_zones.available.names[0]
  tags = {
    Name = "raes_priv_subnet1"
  }
}

resource "aws_subnet" "raes_priv_subnet2" {
  vpc_id     = aws_vpc.raes_vpc.id
  cidr_block = var.private_subnet_cidr[1]
availability_zone = data.aws_availability_zones.available.names[1]
  tags = {
    Name = "raes_priv_subnet2"
  }
}


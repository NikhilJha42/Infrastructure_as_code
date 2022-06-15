# Create a script to initialise terraform to download dependencies required for AWS.

# First step to create block of code to communicate with AWS

provider "aws" {

  region = "eu-west-1"

  
}

# creating a vpc

resource "aws_vpc" "eng110_nikhil_vpc_terraform" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "eng110_nikhil_vpc_terraform"
  }
}

# creating a subnet to launch ec2 into VPC

resource "aws_subnet" "subnet_nikhil_1" {
  vpc_id            = aws_vpc.eng110_nikhil_vpc_terraform.id
  cidr_block        = "10.0.5.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "eu-west-1a"

  tags = {
    Name = "subnet_nikhil_1"
  }
}


# launch an ec2/server on aws


# let terraform know which service/resource
resource "aws_instance" "app_instance" {


# Choose an AMI to create ec2
  #ami = "ami-0943382e114f188e8"
        # ubuntu 18.04LTS ami
  ami = var.node_ami_id
# What type of instance to launch
  instance_type = "t2.micro"

# do we want to have it globally available - public ip
  associate_public_ip_address = true

# Adding subnet id for VPC
  subnet_id = aws_subnet.subnet_nikhil_1.id

# Adding security group
  vpc_security_group_ids = ["sg-0cb1f5e3b169e5e47"]

# name your instance
  tags = {
      Name = "eng110_nikhil_terraform_app"
  }

# adding name of key to use for ssh
  key_name = var.aws_key_name
  # step 2 - attach the file.pem
}
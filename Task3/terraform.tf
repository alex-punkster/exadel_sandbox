#---------------------------------------------------------
provider "aws" {
 region = "eu-central-1"
}
#get ami for Ununtu
#-------------------------------------------------------------------------------
data "aws_ami" "Ubuntu" {
  most_recent = true
  owners = ["099720109477"]
  filter {
    name = "name"
    values = ["ubuntu*20.04-amd64-server-20211129"]
  }
  filter {
    name  = "architecture"
    values = ["x86_64"]
  }
}
#get ami for Amazon_Linux
#-------------------------------------------------------------------------------
data "aws_ami" "Amazon_Linux" {
  most_recent = true
  owners = ["137112412989"]
filter {
  name = "name"
  values = ["amzn2-ami-kernel-*-2.0.20220207.1-*"]
}
  filter {
    name  = "architecture"
    values = ["x86_64"]
  }
}
#get cidr block of subnet
#-------------------------------------------------------------------------------
data "aws_subnet" "default" {
  filter {
    name = "tag:Name"
    values = ["Default_subnet"]
  }
}
#get ssh key name
#-------------------------------------------------------------------------------
data "aws_key_pair" "ssh_key" {
  key_name = "MyKeyPair"
  filter {
    name   = "tag:Name"
    values = ["MyKey"]
  }
}
#get Ubuntu server private Ip
#-------------------------------------------------------------------------------
data "aws_instance" "Ubuntu" {
  filter {
    name = "tag:Name"
    values = ["Task3 Ubuntu Server"]
  }
}
#create Ubuntu server
#-------------------------------------------------------------------------------
resource "aws_instance" "Ubuntu" {
  ami                    = data.aws_ami.Ubuntu.image_id #put ami id
  instance_type          = "t2.micro"
  key_name               = data.aws_key_pair.ssh_key.key_name
  vpc_security_group_ids = [aws_security_group.Ubuntu_security.id] #attach security group
  user_data              = file("script.sh") #run script in VM
  tags = {
    Name = "Task3 Ubuntu Server"
  }
}
#create Amazon_Linux server
#-------------------------------------------------------------------------------
resource "aws_instance" "Amazon_Linux" {
  ami                    = data.aws_ami.Amazon_Linux.image_id #put ami id
  instance_type          = "t2.micro"
  key_name               = data.aws_key_pair.ssh_key.key_name
  vpc_security_group_ids = [aws_security_group.Amazon_Linux.id] #attach security group
  tags = {
    Name = "Task3 Amazon_Linux Server"
  }
}
#create security group for Ubuntu server
#-------------------------------------------------------------------------------
resource "aws_security_group" "Ubuntu_security" {
    name = "Security for Ubuntu"

    dynamic "ingress" {
      for_each = ["22", "80", "443"]
      content {
        from_port = ingress.value
        to_port = ingress.value
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
    }
    ingress {
      from_port   = -1
      to_port     = -1
      protocol    = "icmp"
      cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }

}
#create security group for Amazon_Linux server
#-------------------------------------------------------------------------------
resource "aws_security_group" "Amazon_Linux" {
    name = "Security for Amazon_Linux"

    dynamic "ingress" {
      for_each = ["22", "80", "443"]
      content {
        from_port = ingress.value
        to_port = ingress.value
        protocol = "tcp"
        cidr_blocks = [data.aws_subnet.default.cidr_block]
      }
    }

    ingress {
      from_port   = -1
      to_port     = -1
      protocol    = "icmp"
      cidr_blocks = [data.aws_subnet.default.cidr_block]
    }

    dynamic "egress" {
      for_each = ["22", "80", "443"]
      content {
        from_port = egress.value
        to_port = egress.value
        protocol = "tcp"
        cidr_blocks = [data.aws_subnet.default.cidr_block]
      }
    }
    egress {
      from_port   = -1
      to_port     = -1
      protocol    = "icmp"
      cidr_blocks = [data.aws_subnet.default.cidr_block]
    }
}

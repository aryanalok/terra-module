resource "aws_key_pair" "my-key" {
    key_name = "${var.env}-terra-key-docker"
    public_key = file("terra-key-docker.pub")

  
}

resource "aws_default_vpc" "terra-vpc" {
    tags = {
      Name = "terra-vpc"
    }
  
}

resource "aws_security_group" "my-terra-sg" {

    vpc_id = aws_default_vpc.terra-vpc.id
    description = "default security group"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description =  "ssh port"
    }
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description =  "ssh port"
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        description = "engress "
    }

    tags = {
      Name = "${var.env}terra-sg"
    }
  
}

resource "aws_instance" "my-instance" {

    count = var.instance_count

    key_name = aws_key_pair.my-key.key_name
    security_groups = [aws_security_group.my-terra-sg.name]
    instance_type = var.instance_type
    ami = var.ec2_ami_id

    root_block_device {
      volume_size = var.env  == "prod" ? 9 : 8
      volume_type = "gp3"
    }

    tags = {
      Name = "${var.env}-terra-ec2"
      Environment = var.env
    }
  
}
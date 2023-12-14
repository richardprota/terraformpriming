provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "ec2-instance" {
    ami = var.ami_id
    instance_type = var.instance_type
    subnet_id="subnet-09d203d56f92fd760"
    vpc_security_group_ids = [aws_security_group.mysg.id]
}

resource "aws_security_group" "mysg" {
    name = "allow-ssh2"
    description = "Allow ssh traffic"
    vpc_id = var.vpc_id

    ingress {
        description = "Allow inbound ssh traffic"
        from_port = var.port
        to_port = var.port
        protocol = "tcp"
        cidr_blocks = [var.cidr_block]
    }

    tags = {
        name = "allow_ssh"
    }
}
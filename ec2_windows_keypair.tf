terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 3.0"
        }
    }
}

provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "EC2Instance" {
    ami = "ami-017cdd6dc706848b2"
    instance_type = "t2.micro"
    key_name = "ec2keyFreshPair"
    availability_zone = "us-east-1c"
    tenancy = "default"
    subnet_id = "subnet-0cbce169eb74e9901"
    ebs_optimized = false
    vpc_security_group_ids = [
        "sg-0088dfed7ef3bc431"
    ]
    source_dest_check = true
    root_block_device {
        volume_size = 30
        volume_type = "gp2"
        delete_on_termination = true
    }
    tags = 
}

resource "aws_key_pair" "EC2KeyPair" {
    public_key = "REPLACEME"
    key_name = "ec2keyFreshPair"
}

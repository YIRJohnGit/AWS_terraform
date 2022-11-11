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
    ami = "ami-09d3b3274b6c5d4aa"
    instance_type = "t2.micro"
    key_name = "EC2opensearchkeypair"
    availability_zone = "us-east-1c"
    tenancy = "default"
    subnet_id = "subnet-081e33d9812cc8bef"
    ebs_optimized = false
    vpc_security_group_ids = [
        "sg-069d516872e2b8d04"
    ]
    source_dest_check = true
    root_block_device {
        volume_size = 8
        volume_type = "gp2"
        delete_on_termination = true
    }
    iam_instance_profile = "${aws_iam_role.IAMRole.name}"
    tags = 
}

resource "aws_key_pair" "EC2KeyPair" {
    public_key = "REPLACEME"
    key_name = "EC2opensearchkeypair"
}

resource "aws_ebs_volume" "EC2Volume" {
    availability_zone = "us-east-1c"
    encrypted = false
    size = 8
    type = "gp2"
    snapshot_id = "snap-0c0b30d420db08ab8"
    tags = 
}

resource "aws_volume_attachment" "EC2VolumeAttachment" {
    volume_id = "vol-0ad63a823eb10b751"
    instance_id = "i-05b5b2f9f65fc56b1"
    device_name = "/dev/xvda"
}

resource "aws_network_interface" "EC2NetworkInterface" {
    description = ""
    private_ips = [
        "172.31.90.243"
    ]
    subnet_id = "subnet-081e33d9812cc8bef"
    source_dest_check = true
    security_groups = [
        "sg-069d516872e2b8d04"
    ]
}

resource "aws_network_interface_attachment" "EC2NetworkInterfaceAttachment" {
    network_interface_id = "eni-02828dd03470695ec"
    device_index = 0
    instance_id = "i-05b5b2f9f65fc56b1"
}

resource "aws_iam_role" "IAMRole" {
    path = "/"
    name = "ec2_admin_role"
    assume_role_policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"ec2.amazonaws.com\"},\"Action\":\"sts:AssumeRole\"}]}"
    max_session_duration = 3600
    tags = 
}

resource "aws_iam_role_policy" "IAMPolicy" {
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Action\":\"*\",\"Resource\":\"*\"}]}"
    role = "CS_Admin"
}

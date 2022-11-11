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

resource "aws_s3_bucket" "S3Bucket" {
    bucket = "yirsmbucketredshiftv01"
}

resource "aws_iam_role" "IAMRole" {
    path = "/"
    name = "yirredshiftIAMrole"
    assume_role_policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"redshift.amazonaws.com\"},\"Action\":\"sts:AssumeRole\"}]}"
    max_session_duration = 3600
    tags = 
}

resource "aws_redshift_cluster" "RedshiftCluster" {
    cluster_identifier = "redshift-cluster-1"
    node_type = "dc2.large"
    master_username = "awsuser"
    master_password = "REPLACEME"
    database_name = "dev"
    port = 5439
    automated_snapshot_retention_period = 1
    vpc_security_group_ids = [
        "sg-040e1a1dea1eb48a5"
    ]
    cluster_subnet_group_name = "default"
    availability_zone = "us-east-1e"
    preferred_maintenance_window = "wed:06:30-wed:07:00"
    cluster_version = "1.0"
    allow_version_upgrade = true
    number_of_nodes = 1
    cluster_type = "single-node"
    publicly_accessible = true
    encrypted = false
    tags = 
    iam_roles = [
        "${aws_iam_role.IAMRole.arn}"
    ]
}

resource "aws_redshift_subnet_group" "RedshiftClusterSubnetGroup" {
    description = "default"
    subnet_ids = [
        "subnet-034454e0f48ad71f2",
        "subnet-088c61a5b88be85bf",
        "subnet-066df3a0eebcb275d",
        "subnet-0e9f371ca095f2844",
        "subnet-09511011b68ffb178",
        "subnet-081e33d9812cc8bef"
    ]
    tags = 
}

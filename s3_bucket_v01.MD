# Creating S3 Bucket using Terraform #
```
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
```

__Sample View__

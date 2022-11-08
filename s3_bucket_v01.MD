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

![image](https://user-images.githubusercontent.com/111234771/200512783-64fb86e5-6248-43dd-886b-65c90e3229ee.png)

_Diagram_
![image](https://user-images.githubusercontent.com/111234771/200513468-e34c8468-4d34-4bc5-a087-5fc67444c68c.png)


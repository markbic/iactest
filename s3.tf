provider "aws" { 

}

data "aws_s3_bucket" "log_bucket" {
 bucket = "log-bucket"
}

resource "aws_s3_bucket" "bucket" {
 bucket = "my_insecure_bucket"
 acl = "public-read-write"
}

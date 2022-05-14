#change 1

provider "aws" { 

}

data "aws_s3_bucket" "log_bucket" {
 bucket = "log-bucket"
}

resource "aws_s3_bucket" "bucket" {
 bucket = "my_insecure_bucket"
 acl = "public-read"
}
data "aws_vpc" "vpc" {
 tags = {
 Name = "my_vpc"
 }
}
resource "aws_security_group" "a" {
 name = "a"
 vpc_id = "${data.aws_vpc.vpc.id}"
}
resource "aws_security_group_rule" "public-80" {
 description = "Public"
 type  = "ingress"
 from_port = 80
 to_port = 80
 protocol = "tcp"
 security_group_id = "${aws_security_group.a.id}"
 cidr_blocks = ["0.0.0.0/0"]
}

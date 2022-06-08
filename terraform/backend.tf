terraform {
backend "s3" {
bucket = "awss-jenkinss"
key = "default/terraform.tfstate"
region = "ap-south-1"
}
}

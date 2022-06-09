terraform {
backend "s3" {
profile = "default"
bucket = "awss-jenkinss"
key = "default/terraform.tfstate"
region = "ap-south-1"
}
}

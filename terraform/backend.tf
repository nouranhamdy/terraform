terraform {
backend "s3" {
profile = "default"
bucket = "awss-jenkinss-terraform"
key = "default/terraform.tfstate"
region = "ap-south-1"
}
}

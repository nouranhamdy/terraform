terraform {
backend "s3" {
bucket = "awss-jenkinss"
key = "default/terraform.tfstate"
region = "eu-central-1"
}
}

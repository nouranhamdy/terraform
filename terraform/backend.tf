terraform {
backend "s3" {
bucket = "jenkinss-awss"
key = "default/terraform.tfstate"
region = "eu-central-1"
}
}

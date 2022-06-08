terraform {
backend "s3" {
bucket = "awss-jnkinss"
key = "default/terraform.tfstate"
region = "eu-central-1"
}
}

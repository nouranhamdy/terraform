terraform {
backend "s3" {
bucket = "jimmyy-nouran"
key = "default/terraform.tfstate"
region = "eu-central-1"
}
}

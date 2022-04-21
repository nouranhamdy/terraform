terraform {
backend "s3" {
bucket = "terraform-backend-bucket-n"
key = "default/terraform.tfstate"
region = "us-east-1"
}
}

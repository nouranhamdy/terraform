terraform {
backend "s3" {
bucket = "terraform-backend-bucket-g"
key = "default/terraform.tfstate"
region = "us-east-1"
}
}

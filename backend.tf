terraform {
backend "s3" {
bucket = "aws-jenkins-terraform-bucket"
key = "default/terraform.tfstate"
region = "eu-central-1"
}
}

terraform {
backend "s3" {
bucket = "jenkins-nouran-bucket"
key = "default/terraform.tfstate"
region = "us-east-1"
}
}

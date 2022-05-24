provider "aws" {
    assume_role {
      role_arn = "arn:aws:iam::554738758304:role/ec2-admin-access"
    }
    region = var.region

}

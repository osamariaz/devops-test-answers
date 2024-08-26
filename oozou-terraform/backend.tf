terraform {
  backend "s3" {
    bucket         = "oozou-terraform-state-bucket"
    key            = "environments/dev/terraform.tfstate"
    region         = "us-east-1"
    # dynamodb_table = "my-terraform-state-lock"
    encrypt        = true
  }
}

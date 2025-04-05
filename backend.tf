terraform {
  backend "s3" {
    bucket         = "ishanka-devops-practice-bucket"
    key            = "terraform/state.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock"
    encrypt        = true
  }
}

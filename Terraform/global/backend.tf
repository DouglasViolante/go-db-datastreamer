terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "my-terraform-lock"

    skip_credentials_validation = true
    skip_metadata_api_check     = true
    force_path_style            = true
    use_path_style = true
    }
}
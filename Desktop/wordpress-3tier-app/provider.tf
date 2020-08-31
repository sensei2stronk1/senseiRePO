#Define API Endpoints for Stratoscale Symphony

provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key

  insecure                    = "true"
  skip_metadata_api_check     = true
  skip_credentials_validation = true
  skip_requesting_account_id  = true

  # No importance for this value currently
  region = "us-west-1"
}


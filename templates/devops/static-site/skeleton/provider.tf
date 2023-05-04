provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      Environment = local.config.distribution_name
      ManagedBy   = "VeecodePlatform"
    }
  }
}

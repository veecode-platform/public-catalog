terraform {
  backend "s3" {
    bucket = "${{ values.terraformStateBucketName }}"
    key    = "${{ values.name }}/terraform.tfstate"
    region = "${{ values.terraformStateBucketRegion }}"
  }
}
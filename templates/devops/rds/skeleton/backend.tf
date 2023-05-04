terraform {
  backend "s3" {
    bucket = "${{ values.terraformStateBucketName }}"
    key    = "${{ values.instance_name }}/terraform.tfstate"
    region = "${{ values.terraformStateBucketRegion }}"
  }
}
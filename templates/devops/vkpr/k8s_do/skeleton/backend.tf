terraform {
  backend "s3" {
    endpoint = "https://${{ values.cluster_name }}.digitaloceanspaces.com"
    region = "${{ values.terraformStateSpaceRegion }}"
    key = "${{ values.cluster_name }}/terraform.tfstate"
    bucket = "${{ values.terraformStateSpaceName }}"
    access_key="DO00RMBFWTK82WNF4AHA"
    secret_key="uQgghONo3IcYzQlU07bQf8zooAMYGu+27HMDYRl/JDQ"
    skip_credentials_validation = true
    skip_metadata_api_check = true
  }
}

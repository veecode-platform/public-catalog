module "site" {
  source = "./site_s3"

  domain = local.config.domain
}


module "cloudfront" {
  source              = "./cloudfront"
  domain              = local.config.domain
  zoneid              = local.config.zoneid
  acm_certificate_arn = local.config.acm_certificate_arn
  distribution_name   = local.config.distribution_name
}

#### CloudFront ####
resource "aws_cloudfront_distribution" "tf" {
  enabled             = true
  comment             = "CloudFront distribution for ${var.domain}"
  default_root_object = "index.html"
  aliases             = ["${var.domain}"]

  origin {
    domain_name = "${var.domain}.s3-website.us-east-1.amazonaws.com"
    origin_id   = var.domain



    custom_origin_config {
      http_port              = "80"
      https_port             = "443"
      origin_protocol_policy = "http-only"
      origin_ssl_protocols   = ["TLSv1", "TLSv1.1", "TLSv1.2"]
    }
  }

  default_cache_behavior {
    viewer_protocol_policy = "redirect-to-https"
    cache_policy_id        = aws_cloudfront_cache_policy.one_year_cache_policy.id
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]
    target_origin_id       = var.domain
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = false
    acm_certificate_arn            = var.acm_certificate_arn
    ssl_support_method             = "sni-only"
    minimum_protocol_version       = "TLSv1.2_2021"
  }
}
#### ROUTE53 #####  

resource "aws_route53_record" "root_domain" {
  zone_id = var.zoneid
  name    = var.domain
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.tf.domain_name
    zone_id                = aws_cloudfront_distribution.tf.hosted_zone_id
    evaluate_target_health = false
  }
}

resource "aws_cloudfront_cache_policy" "one_year_cache_policy" {
  name        = "${var.distribution_name}-one-year-cache-policy"
  comment     = "Policy cache for one year"
  default_ttl = 31536000
  max_ttl     = 31536000
  min_ttl     = 31536000
  parameters_in_cache_key_and_forwarded_to_origin {
    enable_accept_encoding_gzip   = true
    enable_accept_encoding_brotli = true
    cookies_config {
      cookie_behavior = "none"
    }
    headers_config {
      header_behavior = "none"
    }
    query_strings_config {
      query_string_behavior = "none"
    }
  }
}

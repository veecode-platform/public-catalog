#Retrieve  vpc
data "aws_vpc" "vpc_rds" {
   filter {
    name   = "tag:Application"
    values = ["${var.name_suffix}"]
  }
}

/*#Retrieve public subnet
data "aws_subnets" "subnet-public" {
  filter {
    name   = "tag:${local.name_suffix}-public"
    values = ["shared"]
  }
}*/

#Retrieve private subnet
# data "aws_subnets" "subnet-private" {
#   filter {
#     name   = "tag:${var.name_suffix}-hml-dev-private"
#     values = ["shared"]
#   }
# }

data "aws_iam_policy_document" "rds_enhanced_monitoring" {
  statement {
    actions = [
      "sts:AssumeRole",
    ]

    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["monitoring.rds.amazonaws.com"]
    }
  }
}

#Retrieve aws avaibility zones
data "aws_availability_zones" "available" {}

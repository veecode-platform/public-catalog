# GitOps | Amazon Web Services - Site S3

**The GitOps project is a template for provisioning the S3 Site on AWS.**

## How to use ?
To use the template, the user must clone <a href="https://github.com/vertigobr/aws_site_s3">this repository.</a>

### Project structure

**This template provides a automation solution for provisioning the Site S3 configration**
the pipeline for provisioning the S3 bucket, cloudfront and record_domain to Route 53, but there is a default provisioning configuration located in config/defaults.yml that can be changed according to the user's needs.

**Example**
~~~yaml
---
route53_zone_domain: <domain.sanple>
cdn_domain: "<bucket.sanple>.<domain.sanple>"
id_zone: "<route_id_zone.sanple>"
bucket: "<bucket.sanple>"
~~~

**pipeline**

The pipeline is divided into 2 workflows, namely:


**Deploy (manual execution):** Provisions infrastructure via Terraform.

**Destroy (manual execution):** Destroys the infrastructure.

---

## Pipeline Secrets
For the project to run as expected, it is necessary to configure some secrets in the pipeline, some are optional.

:key: AWS_ACCESS_KEY `mandatory` <br>
:key: AWS_SECRET_KEY `mandatory` <br>
:key: AWS_REGION `mandatory` <br>
:key: INFRACOST_API_KEY `optional` <br>

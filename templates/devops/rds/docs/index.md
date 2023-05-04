# GitOps | Amazon Web Services - RDS Template

**The GitOps project is a template for provisioning the RDS on AWS.**

## How to use ?
To use the template, the user must clone <a href="https://github.com/vertigobr/aws_rds">this repository.</a>

### Project structure
<img src="./imgs/image1.png"/>

After performing the clone of the repository, it is necessary to configure three environment variables in the repository, namely: `AWS_ACCESS_KEY`, `AWS_SECRET_KEY` and `AWS_REGION`. These variables are the Access Key **ID**, **Secret Access Key**, and **AWS Region**. To learn how to create the keys, visit <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html#Using_CreateAccessKey">the official documentation</a>.


With the environment variables defined in the repository, it is now possible to run the pipeline for provisioning the RDS cluster, but there is a default provisioning configuration located in config/defaults.yml that can be changed according to the user's needs.

**Example**

~~~yaml

cluster_name: #example_name
cluster_version: "1.20"
cidr_block: 10.50.0.0/16
private_subnets:
  - 10.50.1.0/24
  - 10.50.2.0/24
  - 10.50.3.0/24
public_subnets:
  - 10.50.4.0/24
  - 10.50.5.0/24
  - 10.50.6.0/24
aws_availability_zones: [""]
node_groups:
  rds-sample:
    desired_capacity: "1"
    max_capacity: "3"
    min_capacity: "1"
    ami_type: AL2_x86_64
    instance_types:
      - t3.small
    capacity_type: #choice
cluster_enabled_log_types:
  - api
  - audit
  - authenticator
  - controllerManager
  - scheduler
users_list:
  - name: root-user
    role: root
tags:
  Project: #Project
  Source: aws-rds
~~~

**pipeline**

The pipeline is divided into 2 workflows, namely:


**Deploy:** Provisions infrastructure via Terraform.

**Destroy (manual execution):** Destroys the infrastructure.

---

## Pipeline Secrets
For the project to run as expected, it is necessary to configure some secrets in the pipeline, some are optional.

:key: AWS_ACCESS_KEY `mandatory` <br>
:key: AWS_SECRET_KEY `mandatory` <br>
:key: AWS_REGION `mandatory` <br>
:key: INFRACOST_API_KEY `optional` <br>
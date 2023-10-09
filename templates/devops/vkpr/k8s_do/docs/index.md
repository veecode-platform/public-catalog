# GitOps | K8S Digital Ocean

**The GitOps project is a template for provisioning the EKS cluster on AWS.**

## How to use ?
To use the template, the user must clone <a href="https://github.com/vertigobr/k8s-digitalocean">this repository.</a>


After performing the clone of the repository, it is necessary to configure three environment variables in the repository, namely: `DO_TOKEN `. To learn how to create the keys, visit <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html#Using_CreateAccessKey">the official documentation</a>.


With the environment variables defined in the repository, it is now possible to run the pipeline for provisioning the EKS cluster, but there is a default provisioning configuration located in config/defaults.yml that can be changed according to the user's needs.

**Example**

~~~yaml

---
cluster_name: teste
cluster_region: "nyc3"
cluster_version: "1.27"

###############Default_pool################
default_pool_size: "s-2vcpu-4gb"
default_auto_scale: false
node_count: 1

###############Node_pool################
node_pool_size: "s-2vcpu-4gb"
node_auto_scale: true
min_nodes: 1
max_nodes: 2
tags: ["VKPR", "k8s-digitalocean"]
~~~

**pipeline**

The pipeline is divided into 2 workflows, namely:


**Deploy:** Provisions infrastructure via Terraform.

**Destroy (manual execution):** Destroys the infrastructure.

---

## Pipeline Secrets
For the project to run as expected, it is necessary to configure some secrets in the pipeline, some are optional.

:key: AWS_ACCESS_KEY `mandatory` <br>


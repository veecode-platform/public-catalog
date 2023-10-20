# GitOps | K8S Digital Ocean

**The GitOps project is a template for provisioning the EKS cluster on AWS.**

## How to use ?
To use the template, the user must clone <a href="https://github.com/vertigobr/k8s-digitalocean">this repository.</a>

### Project structure

**This template provides a automation solution for provisioning the K8S cluster Digital on Ocean, Using Terraform Cloud provider in your automation**
A default provisioning configuration located in config/defaults.yml that can be changed according to the user's needs.

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

:key: TF_API_TOKEN `mandatory` <br>


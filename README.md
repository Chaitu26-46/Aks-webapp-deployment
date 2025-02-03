# Azure AKS Web Application Deployment

This project deploys a simple static web application on Azure Kubernetes Service (AKS) with monitoring using Prometheus.

## Prerequisites
1. Azure CLI installed and configured.
2. Terraform installed.
3. Docker installed.
4. kubectl installed.

## Steps to Deploy

### 1. Provision Infrastructure with Terraform
```bash
cd terraform
terraform init
terraform apply

### 2. Configure Kubectl
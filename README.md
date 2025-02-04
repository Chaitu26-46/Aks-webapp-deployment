# Azure AKS Web Application Deployment

This project deploys a simple static web application on Azure Kubernetes Service (AKS) with monitoring using Prometheus.

## Prerequisites
1. Azure CLI installed and configured.  
2. Terraform installed.  
3. Docker installed.  
4. kubectl installed. 

### Solution Architecture
The solution consists of the following components:

1. Azure Kubernetes Service (AKS): Hosts the Kubernetes cluster.

2. Web Application: A simple static web application containerized using Docker.

3. Prometheus: A monitoring tool to collect and visualize metrics.

4. Terraform: Used to provision the AKS cluster and related resources. 

## Steps to Deploy

### 1. Provision Infrastructure with Terraform
```bash
cd terraform
terraform init
terraform apply
```

### 2. Configure kubectl
```bash
az aks get-credentials --resource-group aks-webapp-rg --name aks-webapp-cluster
```
### 3. Build and Push Docker Image
```bash
cd docker
docker build -t <your-dockerhub-username>/webapp:latest .
docker push <your-dockerhub-username>/webapp:latest
```
### 4. Deploy Application to AKS
```bash
cd ../kubernetes
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
```

### 5. Deploy Prometheus for Monitoring
```bash
kubectl apply -f prometheus-config/prometheus-deployment.yaml
kubectl apply -f prometheus-config/prometheus-service.yaml
```

### 6. Access the Application
Get the external IP of the web application:
```bash
kubectl get svc webapp-service
```
### 7. Access Prometheus Dashboard
Get the external IP of Prometheus:
```bash
kubectl get svc prometheus-service
```
### Cleanup
To destroy the infrastructure:
```bash
cd terraform
terraform destroy

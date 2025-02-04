# Azure AKS Web Application Deployment

This project deploys a simple static web application on Azure Kubernetes Service (AKS) with monitoring using Prometheus.

## Prerequisites
1. Azure CLI installed and configured.  
2. Terraform installed.  
3. Docker installed.  
4. kubectl installed. 

## Solution Architecture
The solution consists of the following components:

1. Azure Kubernetes Service (AKS): Hosts the Kubernetes cluster.

2. Web Application: A simple static web application containerized using Docker.

3. Prometheus: A monitoring tool to collect and visualize metrics.

4. Terraform: Used to provision the AKS cluster and related resources. 

## Steps to Deploy

### 1. Provision Infrastructure with Terraform
1. Navigate to the *Terraform* directory
```bash
cd terraform
```
2. Initialize Terraform
```bash
terraform init
```
3. Review the Terraform plan
```bash
terraform plan
```
4. Apply the Terraform configuration to provision AKs cluster
```bash
terraform apply
```
This will create AKS cluster 

### 2. Configure kubectl
1. Configure *Kubectl* to connect to the AKS Cluster
```bash
az aks get-credentials --resource-group aks-webapp-rg --name aks-webapp-cluster
```
2. Verify the connection
```bash
kubectl get nodes

```
### 3. Build and Push Docker Image
1. Navigate to the *Docker* directory
```bash
cd ../docker
```
2. Build the docker image:
```bash
docker build -t <your-dockerhub-username>/webapp:latest .
```
Replace the *<your-dockerhub-username>* with your Docker Hub user name
3. Push the Docker image to docker hub
```bash
docker push <your-dockerhub-username>/webapp:latest
```
### 4. Deploy Application to AKS
1. Navigate to *Kubernetes* directory
```bash
cd ../kubernetes
```
2. Deploy the web application
```bash
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
```
3. Verify the deployment
```bash
kubectl get pods
kubectl get svc
```
### 5. Deploy Prometheus for Monitoring
1. Deploy Prometheus
```bash
kubectl apply -f prometheus-config/prometheus-deployment.yaml
kubectl apply -f prometheus-config/prometheus-service.yaml
```
2. Verify the deployment 
```bash
kubectl get pods -l app=prometheus
kubectl get svc prometheus-service

### 6. Access the Application
Get the external IP of the web application:
```bash
kubectl get svc webapp-service
```
open the external IP in a web browser to view static web page 

### 7. Access Prometheus Dashboard

1. Get the external IP of Prometheus:
```bash
kubectl get svc prometheus-service
```
2. Open external IP in a web browser to access the Prometheus dashboard

### Cleanup
To destroy the infrastructure:
1. Navigate to the *terraform* directory
```bash
cd ../terraform
```
2. Destroy the infrastructure
```bash
terraform destroy

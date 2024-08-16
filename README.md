# Deploying and Managing Microservices on AWS EKS with Kubernetes: A Comprehensive Guide

### 1. Project Overview

The goal of this project is to deploy and manage a microservices-based application using Kubernetes, leveraging AWS as the cloud provider. This project demonstrates how to provision an Elastic Kubernetes Service (EKS) cluster, deploy application components as pods within a dedicated namespace (`sock-shop`), expose the frontend to the internet using Kubernetes Ingress, and set up a robust monitoring solution with Grafana, Prometheus, and Alertmanager. Additionally, the project aims to secure the application using a Let's Encrypt SSL certificate, ensuring that all communications are encrypted. The overarching objective is to showcase a scalable, production-ready infrastructure capable of hosting microservices in a cloud environment.

### 2. Prerequisites

To get started with this project, you'll need to have the following tools installed on your local machine:

- **Terraform**: Used to provision and manage the EKS cluster and related AWS infrastructure.
- **AWS CLI**: Required for interacting with AWS services from your command line.
- **kubectl**: The Kubernetes command-line tool used for deploying and managing applications on your EKS cluster.
- **Helm**: A package manager for Kubernetes, used to install and manage Kubernetes applications such as Grafana and Prometheus.

#### Setup Instructions:

1. **Install Terraform**:  
   Follow the official [Terraform installation guide](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli) to install Terraform on your system.

2. **Install AWS CLI**:  
   Install the AWS Command Line Interface by following the [AWS CLI installation guide](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html). After installation, configure your AWS credentials using the command `aws configure`.

3. **Install kubectl**:  
   To manage your Kubernetes cluster, install `kubectl` by following the [kubectl installation guide](https://kubernetes.io/docs/tasks/tools/install-kubectl/). Ensure it is configured to communicate with your EKS cluster.

4. **Install Helm**:  
   Helm simplifies managing Kubernetes applications. Install Helm by following the [Helm installation guide](https://helm.sh/docs/intro/install/).

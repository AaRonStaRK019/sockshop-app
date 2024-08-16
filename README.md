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

### 3. Infrastructure Setup

To provision the EKS cluster on AWS using Terraform, follow these steps:

- **Environment Setup**:  
  Begin by setting your AWS credentials (Access Key ID and Secret Access Key) as environment variables in your terminal. This allows Terraform to authenticate and interact with your AWS account.

  - Add your AWS Access Key ID

  - `export AWS_ACCESS_KEY_ID=your_access_key_id`

  - Add your AWS Secret Access Key

  - `export AWS_SECRET_ACCESS_KEY=your_secret_access_key`

- **Writing Terraform Files**:  
  Create the necessary Terraform files to define and manage my infrastructure:

  - `main.tf`: Contains all the essential resources to set up the EKS cluster, including VPC, EKS itself, node groups, and any other required components.

  - `backend.tf`: Used to configure the backend for Terraform state management. In this case, the state file will be stored in an S3 bucket to enable collaboration and track changes.

- **Provisioning Resources**:  
  Once the Terraform files are ready, run the following commands:

  ```bash
  terraform init```

  Initializes the Terraform configuration, downloading necessary providers and setting up the backend.

  ```bash
  terraform plan```
  
  Creates an execution plan, allowing me to review the changes that will be made to the infrastructure.

  ```bash
  terraform apply --auto-approve```
  
  Applies the changes and provisions the EKS cluster and associated resources automatically without requiring further confirmation.

### 4. Kubernetes Configurations

After provisioning the EKS cluster, the next step is to set up the Kubernetes environment for deploying the microservices:

- **Creating and Configuring the `sock-shop` Namespace**:  
  First, create the `sock-shop` namespace where all the microservices will be deployed. Use the following command:

  ```bash
  kubectl create namespace sock-shop```

  Next, update your kubeconfig to connect to the EKS cluster (also named sock-shop) and set the current context to the newly created namespace:

  ```bash
  aws eks update-kubeconfig --region <your-region> --name <cluster-name>
  kubectl config set-context --current --namespace=<your-namespace>```

- **Deployment Files**:
  In a project like this, where the deployment configuration file can be very lengthy, it's best to split it into separate files for each service being provisioned. This approach makes it easier to debug issues and identify any faulty pods.
  
  Each service should have its own YAML file, containing the necessary configurations such as deployments, services, and other Kubernetes resources.

  This structure helps maintain clarity and manageability as the number of services and configurations grows.

  Refer to the `./deploy/` directory for the YAML configuration files.

- **Deploy Kubernetes resources**:
    After the cluster has been provisioned, deploy the services cnfiguration files:

    ```bash
    kubectl apply -f ./deploy/.```

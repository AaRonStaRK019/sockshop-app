terraform {

    backend "s3" {
        bucket = "nuel-capstone-backend"
        key = "eks-cluster/terraform.tfstate"
        region = "us-east-1"
        encrypt = true
    }
}
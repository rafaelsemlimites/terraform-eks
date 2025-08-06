terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.7.0"
    }
  }
  backend "s3" {
    bucket = "comunidadedevops-s33"  # Nome do bucket S3 onde ficará o state
    key    = "dev/terraform.tfstate" # Caminho/arquivo do state no bucket
    region = "us-east-1"             # Região onde o bucket está localizado
  }
}

provider "aws" {
  region = "us-east-1"
}
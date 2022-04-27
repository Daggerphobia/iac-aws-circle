terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }

  backend "s3" {
    bucket = "teststateiac"
    key    = "Layer/scaffolding.state"
    region = "eu-central-1"
  }



}

provider "aws" {
  region = var.aws_region
}


//Create a ECR for upload images
module "ecr" {
  source           = "./application/ecr"
  app_name         = var.app_name
  app_environment  = var.app_environment
}


//Create a cluster
module "cluster" {
  source      = "./application/cluster"
  app_name         = var.app_name
  app_environment  = var.app_environment
  repository_url   = module.ecr.repository_url
  repository_name  = module.ecr.repository_name
  aws_region       = var.aws_region
  vpc_tag_name     = var.vpc_tag_name
}

//Create autoscaling
module "autoscaling" {
  source                 = "./application/autoscaling"
  app_name               = var.app_name
  app_environment        = var.app_environment
  ecs_cluster_name       = module.cluster.ecs_cluster_name
  aws_ecs_service_name   = module.cluster.aws_ecs_service_name 
}
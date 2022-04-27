output "repository_url" {
  value = module.ecr.repository_url
}

output "repository_name" {
  value = module.ecr.repository_name
}

output "ecs_cluster_name" {
  value = module.cluster.ecs_cluster_name
}

output "aws_ecs_service_name" {
  value = module.cluster.aws_ecs_service_name
}
# File: workshop/backend/outputs.tf

output "mservice1_ecr_repository_url" {
  value = aws_ecr_repository.repository.repository_url
}

output "mservice1_ecs_cluster_name" {
  value = aws_ecs_cluster.backend1_cluster.name
}

output "mservice1_ecs_service_name" {
  value = aws_ecs_service.backend1_service.name
}

output "mservice2_lambda_function_name" {
  value = aws_lambda_function.backend2_function.function_name
}
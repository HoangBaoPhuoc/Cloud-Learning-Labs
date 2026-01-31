# File: workshop/frontend/outputs.tf

# 1. URL của ECR để push Docker Image (Dùng cho Bước 2)
output "ecr_repository_url" {
  description = "The URL of the ECR repository"
  value       = aws_ecr_repository.repository.repository_url
}

# 2. Domain của Verified Access (Dùng để truy cập web sau này)
output "verified_access_endpoint_domain" {
  description = "The domain name of the Verified Access Endpoint"
  value       = aws_verifiedaccess_endpoint.ava_endpoint.endpoint_domain
}

# 3. Role ARN của Frontend (Dùng để cấp quyền cho Backend ở Task sau)
output "frontend_task_role_arn" {
  description = "The ARN of the ECS Task Role"
  value       = aws_iam_role.ecs_task_role.arn
}

# 4. Tên Cluster và Service (Dùng cho lệnh update-service ở Bước 3)
output "ecs_cluster_name" {
  value = aws_ecs_cluster.frontend_cluster.name
}

output "ecs_service_name" {
  value = aws_ecs_service.frontend_service.name
}
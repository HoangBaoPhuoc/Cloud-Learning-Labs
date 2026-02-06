# ---------- backend/variables.tf ----------

variable "aws_region" {
  type        = string
  description = "AWS Region."
  default     = "ap-southeast-1"
}

variable "aws_profile" {
  type        = string
  description = "AWS CLI Profile for Backend Account (SSO)."
  default     = "backend-account"
}

variable "network_aws_profile" {
  type        = string
  description = "AWS CLI Profile for Network Account (SSO)."
  default     = "network-account"
}

variable "project_name" {
  type        = string
  description = "Project name for resource tagging."
  default     = "zerotrust-lab"
}

variable "environment" {
  type        = string
  description = "Environment (learning, dev, prod)."
  default     = "learning"
}

variable "certificate_arn" {
  type        = string
  description = "ACM certificate ARN."
}

variable "networking_account" {
  type        = string
  description = "Networking Account ID."
}

variable "backend_service1_domain_name" {
  type        = string
  description = "Backend App1 - Domain Name."
}

variable "backend_service2_domain_name" {
  type        = string
  description = "Backend App2 - Domain Name."
}

variable "frontend_application_role_arn" {
  type        = string
  description = "Frontend Application Role ARN."
}

# Tier 0 optimized ECS configuration
variable "ecs_task_cpu" {
  type        = string
  description = "ECS Task CPU units (256 = 0.25 vCPU for tier 0)."
  default     = "256"
}

variable "ecs_task_memory" {
  type        = string
  description = "ECS Task Memory in MB (512 MB for tier 0)."
  default     = "512"
}

variable "ecs_desired_count" {
  type        = number
  description = "Number of ECS tasks to run (1 for tier 0 lab)."
  default     = 1
}

variable "ecs_max_capacity" {
  type        = number
  description = "Maximum number of ECS tasks for autoscaling."
  default     = 2
}

variable "ecs_min_capacity" {
  type        = number
  description = "Minimum number of ECS tasks for autoscaling."
  default     = 1
}

# Tier 0 optimized Lambda configuration
variable "lambda_memory_size" {
  type        = number
  description = "Lambda memory size in MB (128 MB minimum for tier 0)."
  default     = 128
}

variable "lambda_timeout" {
  type        = number
  description = "Lambda timeout in seconds."
  default     = 30
}
# ---------- workshop/frontend/variables.tf ----------

# ============================================
# AWS & Provider Configuration
# ============================================
variable "aws_region" {
  type        = string
  description = "AWS Region."
  default     = "ap-southeast-1"
}

variable "aws_profile" {
  type        = string
  description = "AWS CLI Profile for Frontend Account (SSO)."
  default     = "frontend-account"
}

variable "network_aws_profile" {
  type        = string
  description = "AWS CLI Profile for Network Account (SSO)."
  default     = "network-account"
}

# ============================================
# Project Settings
# ============================================
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

# ============================================
# Account & Network Configuration
# ============================================
variable "networking_account" {
  type        = string
  description = "Networking Account ID (Shared from Network Account)."
}

# ============================================
# Domain & Certificate Configuration
# ============================================
variable "certificate_arn" {
  type        = string
  description = "ACM certificate ARN (Must be in Frontend Account)."
}

variable "frontend_domain_name" {
  type        = string
  description = "Frontend Application domain name (e.g., app.zerotrust.local)."
}

variable "backend_service1_domain_name" {
  type        = string
  description = "Domain name for backend service 1 (Internal)."
  default     = ""
}

variable "backend_service2_domain_name" {
  type        = string
  description = "Domain name for backend service 2 (Internal)."
  default     = ""
}

# ============================================
# Identity & Security
# ============================================
variable "idc_group_id" {
  type        = string
  description = "Identity Center Group ID (for AWS Verified Access policy)."
}

variable "frontend_application_role_arn" {
  type        = string
  description = "IAM Role ARN for the frontend application (Output from Backend Task)."
  default     = ""
}

# ============================================
# ECS Configuration (Tier 0 - Optimized)
# ============================================
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

variable "ecs_min_capacity" {
  type        = number
  description = "Minimum number of ECS tasks for autoscaling."
  default     = 1
}

variable "ecs_max_capacity" {
  type        = number
  description = "Maximum number of ECS tasks for autoscaling."
  default     = 2
}
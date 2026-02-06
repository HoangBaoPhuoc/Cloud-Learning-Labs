# ---------- network/variables.tf ----------

variable "aws_region" {
  type        = string
  description = "AWS Region."
}

variable "hosted_zone_name" {
  type        = string
  description = "Private Hosted Zone name."
}

variable "public_hosted_zone_id" {
  type        = string
  description = "Public Hosted Zone ID."
}

variable "frontend_account" {
  type        = string
  description = "Frontend Account ID."
}

variable "backend_account" {
  type        = string
  description = "Backend Account ID."
}

variable "frontend_domain_name" {
  type        = string
  description = "Frontend App - Domain Name."
}

variable "backend_service1_domain_name" {
  type        = string
  description = "Backend App1 - Domain Name."
}

variable "backend_service2_domain_name" {
  type        = string
  description = "Backend App2 - Domain Name."
}

variable "project_name" {
  type        = string
  description = "Project Name."
  default     = "zerotrust-lab"
}

variable "environment" {
  type        = string
  description = "Environment Name."
  default     = "dev"
}

variable "aws_profile" {
  type        = string
  description = "AWS CLI Profile."
}

variable "organization_id" {
  type        = string
  description = "AWS Organization ID."
}
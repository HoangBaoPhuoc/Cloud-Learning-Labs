# File: workshop/network/outputs.tf

output "vpc_lattice_service_network_arn" {
  description = "ARN of the VPC Lattice Service Network"
  value       = module.vpclattice_service_network.service_network.arn
}

output "vpc_lattice_service_network_id" {
  description = "ID of the VPC Lattice Service Network"
  value       = module.vpclattice_service_network.service_network.id
}

output "route53_profile_id" {
  description = "ID of the Route 53 Profile"
  value       = awscc_route53profiles_profile.r53_profile.id
}

output "private_hosted_zone_id" {
  description = "ID of the Private Hosted Zone"
  value       = aws_route53_zone.private_hosted_zone.zone_id
}
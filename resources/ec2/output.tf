output "vpc_id" {
  description = "ID of VPC to associate with EC2 instance"
  value       = module.vpc.vpc_id
}

output "ec2_private_ip" {
  description = "Internal static IP of EC2 Private (No direct Internet access)"
  value       = module.ec2_private.private_ip 
}

output "ec2_public_internal_ip" {
  description = "Internal IP of EC2 Public"
  value       = module.ec2_public.private_ip
}

output "ec2_public_external_ip" {
  description = "Public IP (Elastic IP) tĩnh của EC2 Public"
  value       = aws_eip.ec2_public_eip.public_ip 
}

output "nat_gateway_public_ip" {
  description = "IP address of NAT Gateway"
  value       = module.vpc.nat_gateway_ip
}
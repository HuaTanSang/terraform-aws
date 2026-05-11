output "private_ip" {
  description = "Internal IP address of EC2 instance"
  value       = aws_instance.my_local_ec2.private_ip
}

output "public_ip" {
  description = "Public IP address of EC2 instance"
  value       = aws_instance.my_local_ec2.public_ip
}

output "instance_id" {
  description = "ID of EC2 instance"
  value       = aws_instance.my_local_ec2.id
}
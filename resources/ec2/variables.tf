variable region {
  description = "The AWS region to deploy the EC2 instance"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "The type of EC2 instance to create"
  type        = string
} 

variable "ami_id" {
  description = "The AMI ID to use for the EC2 instance"
  type        = string
  default     = "ami-000000000001" 
}

variable "access_key" {
  description = "AWS Access Key for LocalStack"
  type        = string
}

variable "secret_key" {
  description = "AWS Secret Key for LocalStack"
  type        = string
}

variable "endpoint_url" {
  description = "The endpoint URL for LocalStack"
  type        = string
  default     = "http://localhost:4566"
}

variable "subnet_id" {
  description = "ID of the Subnet where the EC2 instance will be deployed"
  type        = string
}

variable "private_ip" {
  description = "Private IP for EC2"
  type        = string
  default     = null
}

variable "public_ip" {
  description = "Public IP for EC2 (if needed)"
  type        = string
  default     = null
}

variable "cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidr_block" {
  description = "CIDR block for the public subnet"
  type        = string
}

variable "private_subnet_cidr_block" {
  description = "CIDR block for the private subnet"
  type        = string
}

variable "az_1a" {
  description = "Availability Zone for the subnets"
  type        = string
} 




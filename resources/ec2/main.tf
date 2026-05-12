# Cấu hình Provider cho LocalStack
provider "aws" {
  region                      = var.region
  access_key                  = var.access_key
  secret_key                  = var.secret_key
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
  endpoints {
    ec2 = var.endpoint_url
  }
}

# 1. Khởi tạo VPC
module "vpc" {
  source                    = "../../modules/vpc"
  region                    = var.region
  access_key                = var.access_key
  secret_key                = var.secret_key
  endpoint_url              = var.endpoint_url
  
  # Khai báo dải mạng
  cidr_block                = var.cidr_block
  public_subnet_cidr_block  = var.public_subnet_cidr_block
  private_subnet_cidr_block = var.private_subnet_cidr_block
  az_1a                     = var.az_1a
}


# 2. Khởi tạo EC2 Instances

# Nằm trong Private Subnet 
module "ec2_private" {
  source        = "../../modules/ec2"
  region        = var.region
  access_key    = var.access_key
  secret_key    = var.secret_key
  endpoint_url  = var.endpoint_url
  ami_id        = var.ami_id
  instance_type = var.instance_type
  
  subnet_id     = module.vpc.private_subnet_id
  private_ip    = "10.0.2.50" # Thuộc dải 10.0.2.0/24
}

# Nằm trong Public Subnet 
module "ec2_public" {
  source        = "../../modules/ec2"
  region        = var.region
  access_key    = var.access_key
  secret_key    = var.secret_key
  endpoint_url  = var.endpoint_url
  ami_id        = var.ami_id
  instance_type = var.instance_type
  
  associate_public_ip = true
  # Chỉ định ID của Public Subnet
  subnet_id     = module.vpc.public_subnet_id
  
  # Chỉ định IP nội bộ thuộc dải Public Subnet (10.0.1.0/24)
  private_ip    = "10.0.1.50" 
}

resource "aws_eip" "ec2_public_eip" {
  domain = "vpc"
  
  # Gắn EIP này vào con EC2 Public thông qua instance_id
  instance = module.ec2_public.instance_id 
  
  tags = {
    Name = "EC2-Public-EIP"
  }
}
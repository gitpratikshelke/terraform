variable "ec2_instance" {
  description = "Type of EC2 instance"
  type        = string
  default     = "t2.micro"
  
}
variable "ec2-root_block_device" {
  description = "Size of root block device in GB"
  type        = number
  default     = 8
  
}

variable "ec2-ami-id" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-0bc691261a82b32bc"
  
}

variable env{
  description = "Environment"
  type        = string
  default     = "prod"
  
}
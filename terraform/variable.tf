
variable "aws_region" {
  description = "The AWS region to deploy resources in."
  type        = string
  default     = "ap-south-1"
}

variable "project_name" {
  description = "A unique name for your project, used for resource naming."
  type        = string
  default     = "my-terraform-ec2"
}

variable "instance_type" {
  description = "The EC2 instance type."
  type        = string
  default     = "t2.micro"
}
variable "key_pair_name" {
  description = "The name of an existing EC2 Key Pair to use for SSH access."
  type        = string
  default     = "sever"
}


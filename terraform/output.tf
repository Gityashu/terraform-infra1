
# Copyright (c) 2025 Gityashu
# SPDX-License-Identifier: MIT
# See LICENSE file in the project root for license information.
output "instance_id" {
  description = "The ID of the EC2 instance."
  value       = aws_instance.web_server.id
}

output "public_ip" {
  description = "The public IP address of the EC2 instance."
  value       = aws_instance.web_server.public_ip
}

output "public_dns" {
  description = "The public DNS name of the EC2 instance."
  value       = aws_instance.web_server.public_dns
}

output "security_group_id" {
  description = "The ID of the security group attached to the EC2 instance."
  value       = aws_security_group.ec2_sg.id
}


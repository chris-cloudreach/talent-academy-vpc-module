resource "aws_security_group" "packer-security-group" {
  count = var.ec2created == true ? 1:0
  name        = "Packer Security Group"
  description = "Allow ssh access"
  vpc_id      = aws_vpc.main_vpc.id

  ingress {
    description     = "ssh access within vpc"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }

  ingress {
    description     = "ssh access from my mac"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    cidr_blocks = ["86.15.241.215/32"]
  }

  ingress {
    description = "allow icmp within whole vpc"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = [var.vpc_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Packer Security group"
  }
}
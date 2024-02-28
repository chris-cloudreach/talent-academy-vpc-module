resource "aws_instance" "Packer_Bastion_ec2" {
  count = var.ec2created == true ? 1:0
  ami                         = "ami-052c9ea013e6e3567" #would need to use data to fetch latest AMI
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  key_name                    = "ta-lab-key"
  subnet_id                   = aws_subnet.public_a.id
  iam_instance_profile = aws_iam_instance_profile.main.name
  vpc_security_group_ids      = [aws_security_group.packer-security-group[0].id]
  user_data = file("packerInstall.sh")

  tags = {
    Name = "Packer-Bastion"
  }
}

resource "aws_instance" "packer_private_ec2" {
  count = var.ec2created == true ? 1:0
  ami                         = "ami-052c9ea013e6e3567" #would need to use data to fetch latest AMI
  instance_type               = "t2.micro"
  associate_public_ip_address = false
  key_name                    = "ta-lab-key"
  subnet_id                   = aws_subnet.private_a.id
  iam_instance_profile = aws_iam_instance_profile.main.name
  # I added [0] because of below
    # Because aws_security_group.packer-security-group has "count" set, its attributes
    # must be accessed on specific instances.
    # For example, to correlate with indices of a referring resource, use:
    # aws_security_group.packer-security-group[count.index]

  vpc_security_group_ids      = [aws_security_group.packer-security-group[0].id]
  user_data = file("packerInstall.sh")

  tags = {
    Name = "Packer-Private"
  }
}


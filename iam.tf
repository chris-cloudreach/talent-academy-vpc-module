resource "aws_iam_role" "main" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  # AmazonEC2FullAccess: FOR UPDATING NAME TAGS ON ASG EC2
  # SSMManagedInstanceCore : For enabling ASG lifecycle hook call SSM document in SNS-lambda consumer for graceful shutdown
  managed_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess",
    "arn:aws:iam::aws:policy/AmazonS3FullAccess",
    "arn:aws:iam::aws:policy/CloudWatchLogsFullAccess",
    "arn:aws:iam::aws:policy/AWSCodeBuildDeveloperAccess",
    "arn:aws:iam::aws:policy/AWSCodeCommitFullAccess",
    "arn:aws:iam::aws:policy/AmazonEC2FullAccess",
    "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore",
    "arn:aws:iam::aws:policy/AmazonSNSFullAccess"]
  max_session_duration = "3600"
  name                 = "packer-role"
  path                 = "/"

  tags = {
    Name   = "forwhat"
    cbrole = "packer"
  }

}

resource "aws_iam_instance_profile" "main" {
  name= "packer-instance-profile"

  role = aws_iam_role.main.name
}

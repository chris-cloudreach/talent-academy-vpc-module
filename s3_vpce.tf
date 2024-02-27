data "aws_s3_bucket" "yums3bucket" {
  bucket = "packagesbuck765"
}
resource "aws_vpc_endpoint" "s3" {
  vpc_id       = aws_vpc.main_vpc.id
  vpc_endpoint_type   = "Gateway"
  service_name = "com.amazonaws.${var.region}.s3"
  route_table_ids     = [aws_route_table.private_to_public_subnet_rt.id]
}

resource "aws_s3_bucket_policy" "allow_access_to_packer_vpce_only" {
  bucket = data.aws_s3_bucket.yums3bucket.id
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
        "Sid": "Access-to-packer-VPCE-only",
        "Principal": "*",
        "Action": [
                "s3:ListBucket",
                "s3:GetObject"
            ],
        "Effect": "Allow",
        "Resource": ["${data.aws_s3_bucket.yums3bucket.arn}",
                    "${data.aws_s3_bucket.yums3bucket.arn}/*"],
        "Condition": {
            "StringEquals": {
            "aws:SourceVpce": "${aws_vpc_endpoint.s3.id}"
            }
        }
    }
    ]
  })
}
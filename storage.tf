# 1. Create an S3 Bucket for backups or static assets
resource "aws_s3_bucket" "app_storage" {
  bucket_prefix = "saa-app-storage-"
  force_destroy = true
}

# 2. Create an IAM Role for the EC2 Instance
resource "aws_iam_role" "ec2_s3_role" {
  name = "saa-ec2-s3-access-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

# 3. Create an IAM Policy allowing read/write access to the S3 bucket
resource "aws_iam_role_policy" "s3_access_policy" {
  name = "saa-s3-access-policy"
  role = aws_iam_role.ec2_s3_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:ListBucket"
        ]
        Resource = [
          aws_s3_bucket.app_storage.arn,
          "${aws_s3_bucket.app_storage.arn}/*"
        ]
      }
    ]
  })
}

# 4. Create an Instance Profile to attach the Role to EC2
resource "aws_iam_instance_profile" "ec2_profile" {
  name = "saa-ec2-instance-profile"
  role = aws_iam_role.ec2_s3_role.name
}
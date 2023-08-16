resource "aws_s3_bucket" "bucket_name" {
  bucket = "bucket_name"

  tags = {
    Name        = "equals to test domain name"
    Environment = "Test"
  }
}
resource "aws_s3_bucket_website_configuration" "bucket_name" {
  bucket = aws_s3_bucket.bucket_name.id

index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "aws_s3_bucket_ownership_controls" "bucket_name" {
  bucket = aws_s3_bucket.bucket_name.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "bucket_name" {
  bucket = aws_s3_bucket.bucket_name.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "bucket_name" {
  depends_on = [
    aws_s3_bucket_ownership_controls.bucket_name,
    aws_s3_bucket_public_access_block.bucket_name,
  ]

  bucket = aws_s3_bucket.bucket_name.id
  acl    = "public-read"
}

resource "aws_s3_bucket_policy" "static_site_policy" {
  bucket = aws_s3_bucket.bucket_name.id

  # added policy to allow public access
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action    = ["s3:GetObject"],
        Effect    = "Allow",
        Resource  = join("", ["arn:aws:s3:::", aws_s3_bucket.bucket_name.id, "/*"]),
        Principal = "*",
      },
    ],
  })
}

output "bucket_name" {
  description = "name of bucket must be the same as domain name"
  value       = aws_s3_bucket.bucket_name.id
}

output "bucket_domain_name" {
  description = "domain name for test_env equals bucket name for test_env"
  value       = aws_s3_bucket.bucket_name.bucket_regional_domain_name
}

output "name_of_bucket" {
  value = aws_s3_bucket.image-assets-4-app.id
}

output "bucket_arn" {
  value = aws_s3_bucket.image-assets-4-app.arn
}

output "bucket_domain_name" {
  value = aws_s3_bucket.image-assets-4-app.bucket_domain_name
}

output "aws_s3_bucket_public_access_block" {
  value = aws_s3_bucket_public_access_block.s3-access-public-block
}

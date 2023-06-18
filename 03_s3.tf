resource "aws_s3_bucket" "image-assets-4-app" {
  bucket = var.bucket_name

  lifecycle {
    prevent_destroy = true
  }

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_s3_bucket_public_access_block" "s3-access-public-block" {
  bucket = aws_s3_bucket.image-assets-4-app.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_acl" "s3-acl" {
  depends_on = [aws_s3_bucket_ownership_controls.s3-controls]

  bucket = aws_s3_bucket.image-assets-4-app.id
  acl    = "private"
}

resource "aws_s3_bucket_ownership_controls" "s3-controls" {
  bucket = aws_s3_bucket.image-assets-4-app.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_policy" "s3-policy" {
  depends_on = [aws_s3_bucket.image-assets-4-app]
  bucket     = aws_s3_bucket.image-assets-4-app.id
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "AllowCurrentUserIP",
        "Effect" : "Allow",
        "Principal" : "*",
        "Action" : [
          "s3:GetObject",
          "s3:PutObject",
          "s3:DeleteObject"
        ],
        "Resource" : [
          "arn:aws:s3:::${aws_s3_bucket.image-assets-4-app.bucket}/*"
        ],
        "Condition" : {
          "IpAddress" : {
            "aws:SourceIp" : "${var.ip_address}/32"
          }
        },
        "Condition" : {
          "StringNotEquals" : {
            "aws:sourceVpce" : [
              "${aws_vpc_endpoint.vpc-end-ponint-s3-1.id}"
            ]
          }
        }
      }
    ]
  })
}

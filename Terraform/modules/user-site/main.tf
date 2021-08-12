
resource "aws_s3_bucket" "userui" {
  bucket        = "cashmoney-userui-terraform"
  acl           = "public-read"
  force_destroy = true

  website {
    index_document = "index.html"
  }
}

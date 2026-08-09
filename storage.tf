resource "yandex_storage_bucket" "static_site" {
  bucket = var.bucket_name
  acl    = var.public_read_acl
  
  website {
    index_document = var.site_index
    error_document = var.site_error
  }
  
  cors_rule {
    allowed_methods = ["GET", "HEAD"]
    allowed_origins = ["*"]
    allowed_headers = ["*"]
    max_age_seconds = 3600
  }
}

resource "yandex_storage_object" "index" {
  bucket       = yandex_storage_bucket.static_site.bucket
  key          = var.site_index
  source       = var.site_index
  content_type = var.site_content_type
  acl          = var.public_read_acl
}

resource "yandex_storage_object" "error" {
  bucket       = yandex_storage_bucket.static_site.bucket
  key          = var.site_error
  source       = var.site_error
  content_type = var.site_content_type
  acl          = var.public_read_acl
}

resource "yandex_storage_object" "site_image" {
  bucket        = yandex_storage_bucket.static_site.bucket
  key           = var.image_key
  source        = var.image_file
  content_type  = var.image_content_type
  acl           = var.public_read_acl
}

output "kms_key_id" {
  value       = yandex_kms_symmetric_key.main.id
}

output "encrypted_bucket_name" {
  value       = yandex_storage_bucket.encrypted.bucket
}

output "static_site_url" {
  value       = "http://${yandex_storage_bucket.static_site.bucket}.website.yandexcloud.net"
}

output "static_site_https_url" {
  value       = "https://${yandex_storage_bucket.static_site.bucket}.website.yandexcloud.net"
}

output "image_url" {
  value       = "https://${yandex_storage_bucket.static_site.bucket}.website.yandexcloud.net/${var.image_key}"
}

output "encrypted_image_url" {
  value       = "https://storage.yandexcloud.net/${yandex_storage_bucket.encrypted.bucket}/${var.image_key}"
}

output "image_object_info" {
  value = {
    bucket        = yandex_storage_bucket.static_site.bucket
    key           = var.image_key
    content_type  = var.image_content_type
    acl           = var.public_read_acl
  }
}

output "bucket_website_endpoint" {
  value       = yandex_storage_bucket.static_site.website_endpoint
}

output "bucket_domain_name" {
  value       = yandex_storage_bucket.static_site.bucket_domain_name
}

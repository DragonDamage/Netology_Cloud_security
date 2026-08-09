resource "yandex_kms_symmetric_key" "main" {
  name              = var.kms_key_name
  description       = var.kms_key_description
  default_algorithm = var.kms_default_algorithm
  rotation_period   = var.kms_rotation_period
}

resource "yandex_storage_bucket" "encrypted" {
  bucket     = var.bucket_name_with_kms
  acl        = var.private_acl
  
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = yandex_kms_symmetric_key.main.id
        sse_algorithm     = var.bucket_sse_algorithm
      }
    }
  }
}

resource "yandex_storage_object" "encrypted_image" {
  bucket        = yandex_storage_bucket.encrypted.bucket
  key           = var.image_key
  source        = var.image_file
  content_type  = var.image_content_type
  acl           = var.public_read_acl
  
  depends_on = [yandex_storage_bucket.encrypted]
}

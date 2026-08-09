# Global
variable "cloud_id" {
    description = "Cloud Identificator"
}
variable "folder_id" {
    description = "Cloud Folder Identificator"
}
variable "region" {
    description = "Cloud Region"
}

# Bucket
variable "bucket_name" {
    default = "akaramyshev-2026-07-05"
}

variable "bucket_name_with_kms" {
  description = "Name of the bucket for encrypted content"
  type        = string
  default     = "my-encrypted-bucket"
}

variable "bucket_storage_class" {
    default = "STANDARD"
}

variable "bucket_statickey_auth" {
    default = false
}

variable "bucket_max_size" {
    default = 1073741824
}

variable "private_acl" {
  default     = "private"
}

variable "bucket_sse_algorithm" {
    default  = "aws:kms"
}

# KMS
variable "kms_default_algorithm" {
    default = "AES_256_HSM"
}

variable "kms_key_name" {
    default = "clopro"
}

variable "kms_rotation_period" {
    default = "24h"
}

variable "kms_key_description" {
  default     = "KMS key for encrypting bucket content"
}

# Site
variable "domain_name" {
  default     = "my-static-site-bucket.website.yandexcloud.net"
}

variable "site_index" {
  default     = "index.html"
}

variable "site_content_type" {
  default = "text/html"
}

variable "site_error" {
  default     = "error.html"
}

# Image
variable "image_file" {
  default     = "image.png"
}

variable "image_key" {
  default     = "images/logo.png"
}

variable "image_content_type" {
  default     = "image/png"
}

variable "public_read_acl" {
  default     = "public-read"
}

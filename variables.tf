variable "acme_registration_private_key_rsa_bits" {
  type        = number
  description = "ACME Registration RSA private key size in bits"
  default     = 2048
}

variable "acme_registration_email_id" {
  description = "The contact email address for the account, this will be provided to Let's Encrypt."
  type        = string
}

variable "ssl_cert_private_key_rsa_bits" {
  type        = number
  description = "SSL certificate private key size in bits"
  default     = 2048
}

variable "subject_alternative_names" {
  type        = list(string)
  default     = []
  description = "List of Additional DNS names for which a certificate is being requested, (i.e. certificate subjects)."
}

variable "ssl_cert_subject_common_name" {
  type        = string
  description = "The primary domain name for which you are requesting the SSL certificate. Distinguished name: CN"
}

variable "ssl_cert_subject_country" {
  type        = string
  default     = null
  description = "Distinguished name: C"
}

variable "ssl_cert_subject_locality" {
  type        = string
  default     = null
  description = "Distinguished name: L"
}

variable "ssl_cert_subject_organization" {
  type        = string
  default     = null
  description = "Distinguished name: O"
}

variable "ssl_cert_subject_organizational_unit" {
  type        = string
  default     = null
  description = "Distinguished name: OU"
}

variable "ssl_cert_subject_province" {
  type        = string
  default     = null
  description = "Distinguished name: ST"
}

variable "min_days_remaining" {
  type        = number
  default     = 30
  description = "The minimum amount of days remaining on the expiration of a certificate before a renewal is attempted. The default is 30. A value of less than 0 means that the certificate will never be renewed."
}

variable "import_to_aws_acm" {
  type        = bool
  default     = true
  description = "Whether to import the SSL certificate to AWS ACM"
}
resource "tls_private_key" "acme_registration" {
  algorithm = "RSA"
  rsa_bits  = var.acme_registration_private_key_rsa_bits
}

resource "acme_registration" "this" {
  account_key_pem = tls_private_key.acme_registration.private_key_pem
  email_address   = var.acme_registration_email_id
}

resource "tls_private_key" "ssl_cert" {
  algorithm = "RSA"
  rsa_bits  = var.ssl_cert_private_key_rsa_bits
}

resource "tls_cert_request" "ssl_cert" {
  private_key_pem = tls_private_key.ssl_cert.private_key_pem
  dns_names       = concat([var.ssl_cert_subject_common_name], var.subject_alternative_names)

  subject {
    common_name         = var.ssl_cert_subject_common_name
    country             = var.ssl_cert_subject_country
    locality            = var.ssl_cert_subject_locality
    organization        = var.ssl_cert_subject_organization
    organizational_unit = var.ssl_cert_subject_organizational_unit
    province            = var.ssl_cert_subject_province
  }
}

resource "acme_certificate" "this" {
  account_key_pem         = acme_registration.this.account_key_pem
  certificate_request_pem = tls_cert_request.ssl_cert.cert_request_pem
  min_days_remaining      = var.min_days_remaining
  dns_challenge {
    provider = "route53"
  }
}

resource "aws_acm_certificate" "this" {
  count             = var.import_to_aws_acm ? 1 : 0
  private_key       = tls_private_key.ssl_cert.private_key_pem
  certificate_body  = acme_certificate.this.certificate_pem
  certificate_chain = acme_certificate.this.issuer_pem
}
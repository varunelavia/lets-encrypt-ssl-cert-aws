output "ssl_cert_private_key" {
  description = "Private key content of the SSL certificate"
  sensitive   = true
  value       = tls_private_key.ssl_cert.private_key_pem
}

output "ssl_certificate_pem" {
  description = "The SSL certificate in PEM format."
  sensitive   = false
  value       = acme_certificate.this.certificate_pem
}

output "ssl_issuer_pem" {
  description = "The intermediate certificates of the issuer. Multiple certificates are concatenated in this field when there is more than one intermediate certificate in the chain."
  sensitive   = false
  value       = acme_certificate.this.issuer_pem
}

output "ssl_certificate_csr" {
  description = "The Certificate Signing Request contents for the SSL certificate"
  sensitive   = false
  value       = "tls_cert_request.ssl_cert.cert_request_pem"
}

output "acme_registration_private_key" {
  description = "The private key of the account that is requesting the certificate from Let's Encrypt"
  sensitive   = true
  value       = tls_private_key.acme_registration.private_key_pem
}

output "acme_registration_email_id" {
  description = "The contact email address for the account that is requesting the certificate from Let's Encrypt"
  sensitive   = false
  value       = var.acme_registration_email_id
}

output "aws_acm_certificate_arn" {
  description = "The ARN of AWS ACM Certificate"
  sensitive   = false
  value       = var.import_to_aws_acm ? aws_acm_certificate.this.arn : null
}
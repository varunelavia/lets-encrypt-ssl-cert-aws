## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_acme"></a> [acme](#provider\_acme) | n/a |
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_tls"></a> [tls](#provider\_tls) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [acme_certificate.this](https://registry.terraform.io/providers/vancluever/acme/latest/docs/resources/certificate) | resource |
| [acme_registration.this](https://registry.terraform.io/providers/vancluever/acme/latest/docs/resources/registration) | resource |
| [aws_acm_certificate.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate) | resource |
| [tls_cert_request.ssl_cert](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/cert_request) | resource |
| [tls_private_key.acme_registration](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |
| [tls_private_key.ssl_cert](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acme_registration_email_id"></a> [acme\_registration\_email\_id](#input\_acme\_registration\_email\_id) | The contact email address for the account that is requesting the certificate from Let's Encrypt. | `string` | n/a | yes |
| <a name="input_acme_registration_private_key_rsa_bits"></a> [acme\_registration\_private\_key\_rsa\_bits](#input\_acme\_registration\_private\_key\_rsa\_bits) | ACME Registration RSA private key size in bits | `number` | `2048` | no |
| <a name="input_import_to_aws_acm"></a> [import\_to\_aws\_acm](#input\_import\_to\_aws\_acm) | Whether to import the SSL certificate to AWS ACM | `bool` | `true` | no |
| <a name="input_min_days_remaining"></a> [min\_days\_remaining](#input\_min\_days\_remaining) | The minimum amount of days remaining on the expiration of a certificate before a renewal is attempted. The default is 30. A value of less than 0 means that the certificate will never be renewed. | `number` | `30` | no |
| <a name="input_ssl_cert_private_key_rsa_bits"></a> [ssl\_cert\_private\_key\_rsa\_bits](#input\_ssl\_cert\_private\_key\_rsa\_bits) | SSL certificate private key size in bits | `number` | `2048` | no |
| <a name="input_ssl_cert_subject_common_name"></a> [ssl\_cert\_subject\_common\_name](#input\_ssl\_cert\_subject\_common\_name) | The primary domain name for which you are requesting the SSL certificate. Distinguished name: CN | `string` | n/a | yes |
| <a name="input_ssl_cert_subject_country"></a> [ssl\_cert\_subject\_country](#input\_ssl\_cert\_subject\_country) | Distinguished name: C | `string` | `null` | no |
| <a name="input_ssl_cert_subject_locality"></a> [ssl\_cert\_subject\_locality](#input\_ssl\_cert\_subject\_locality) | Distinguished name: L | `string` | `null` | no |
| <a name="input_ssl_cert_subject_organization"></a> [ssl\_cert\_subject\_organization](#input\_ssl\_cert\_subject\_organization) | Distinguished name: O | `string` | `null` | no |
| <a name="input_ssl_cert_subject_organizational_unit"></a> [ssl\_cert\_subject\_organizational\_unit](#input\_ssl\_cert\_subject\_organizational\_unit) | Distinguished name: OU | `string` | `null` | no |
| <a name="input_ssl_cert_subject_province"></a> [ssl\_cert\_subject\_province](#input\_ssl\_cert\_subject\_province) | Distinguished name: ST | `string` | `null` | no |
| <a name="input_subject_alternative_names"></a> [subject\_alternative\_names](#input\_subject\_alternative\_names) | List of Additional DNS names for which a certificate is being requested, (i.e. certificate subjects). | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_acme_registration_email_id"></a> [acme\_registration\_email\_id](#output\_acme\_registration\_email\_id) | The contact email address for the account that is requesting the certificate from Let's Encrypt |
| <a name="output_acme_registration_private_key"></a> [acme\_registration\_private\_key](#output\_acme\_registration\_private\_key) | The private key of the account that is requesting the certificate from Let's Encrypt |
| <a name="output_ssl_cert_private_key"></a> [ssl\_cert\_private\_key](#output\_ssl\_cert\_private\_key) | Private key content of the SSL certificate |
| <a name="output_ssl_certificate_csr"></a> [ssl\_certificate\_csr](#output\_ssl\_certificate\_csr) | The Certificate Signing Request contents for the SSL certificate |
| <a name="output_ssl_certificate_pem"></a> [ssl\_certificate\_pem](#output\_ssl\_certificate\_pem) | The SSL certificate in PEM format. |
| <a name="output_ssl_issuer_pem"></a> [ssl\_issuer\_pem](#output\_ssl\_issuer\_pem) | The intermediate certificates of the issuer. Multiple certificates are concatenated in this field when there is more than one intermediate certificate in the chain. |

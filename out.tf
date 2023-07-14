output "ca_certificate" {
  value = module.ca.certificate
}

output "server_certificate" {
  value = tls_locally_signed_cert.certificate.cert_pem
}

output "server_key" {
  value = tls_private_key.key.private_key_pem
}

output "root_certificate" {
  value = module.root_certificate.certificate
}

output "root_key" {
  value = module.root_certificate.key
}

output "root_password" {
  value = random_password.root_password.result
}
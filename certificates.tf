module "ca" {
  source = "./ca"
}

resource "tls_private_key" "key" {
  algorithm   = "RSA"
  rsa_bits    = 4096
}

resource "tls_cert_request" "request" {
  private_key_pem = tls_private_key.key.private_key_pem
  ip_addresses    = [
    "127.0.0.1"
  ]
  subject {
    common_name  = "localhost"
    organization = "localhost"
  }
}

resource "tls_locally_signed_cert" "certificate" {
  cert_request_pem   = tls_cert_request.request.cert_request_pem
  ca_private_key_pem = module.ca.key
  ca_cert_pem        = module.ca.certificate

  validity_period_hours = 10000
  early_renewal_hours = 24

  allowed_uses = [
    "client_auth",
    "server_auth",
  ]

  is_ca_certificate = false
}

module "root_certificate" {
    source = "git::https://github.com/Ferlab-Ste-Justine/etcd-client-certificate.git"
    ca = module.ca
    username = "root"
}
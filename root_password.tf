//Used when tls is disabled

resource "random_password" "root_password" {
  length           = 16
  special          = false
}
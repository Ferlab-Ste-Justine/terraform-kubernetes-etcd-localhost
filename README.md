# About

Module to deploy a quick single-node etcd server on a localhost kubernetes via a nodeport (mTLS secured by default, but that can be turned off).

We found ourselves copying the same boilerplate code to provide a quick local test environment with 3 projets so far and decided to publish a terraform module for it rather than duplicate any further.

# Requirements

The module assumes that you have a kubernetes setup on your local machines with nodeports accessible directly from localhost.

# Variables

**kubernetes_resources_prefix**: Prefix name to add to kubernetes ressources to avoid clashes. Defaults to **test-**.

**etcd_nodeport**: Nodeport to map etcd on on the localhost. Defaults to **32379**

**skip_tls**: Flag indicating if tls should be enabled or not. If tls is enabled, certificate authentication will be setup for the root user, else password authentication will be setup for the root user instead. Defaults to false.

# Output

**ca_certificate**: Certificate of the etcd's CA (relevant if tls is enabled)

**server_certificate**: Server certificate of etcd (relevant if tls is enabled)

**server_key**: Server private key of etcd (relevant if tls is enabled)

**root_certificate**: Client certificate of the root user (relevant if tls is enabled)

**key_certificate**: Private key of the root user (relevant if tls is enabled)

**root_password**: Password of the root user (relevant if tls is disabled)
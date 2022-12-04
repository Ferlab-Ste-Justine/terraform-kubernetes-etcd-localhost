# About

Module to deploy a quick single-node mTLS secured etcd server on a localhost kubernetes via a nodeport.

We found ourselves copying the same boilerplate code to provide a quick local test environment with 3 projets so far and decided to publish a terraform module for it rather than duplicate any further.

# Requirements

The module assumes that you have a kubernetes setup on your local machines with nodeports accessible directly from localhost.

# Variables

**kubernetes_resources_prefix**: Prefix name to add to kubernetes ressources to avoid clashes. Defaults to **test-**.

**etcd_nodeport**: Nodeport to map etcd on on the localhost. Defaults to **32379**

# Output

**ca_certificate**: Certificate of the etcd's CA

**server_certificate**: Server certificate of etcd

**server_key**: Server private key of etcd

**root_certificate**: Client certificate of the root user

**key_certificate**: Private key of the root user
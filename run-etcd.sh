#!/bin/sh
/opt/scripts/bootstrap-auth.sh &

etcd --name etcd0 \
     --advertise-client-urls ${protocol}://127.0.0.1:2379 \
     --listen-client-urls ${protocol}://0.0.0.0:2379 \
     --initial-advertise-peer-urls ${protocol}://127.0.0.1:2380 \
     --listen-peer-urls ${protocol}://0.0.0.0:2380 \
     --initial-cluster-token etcd-cluster-1 \
     --initial-cluster etcd0=${protocol}://127.0.0.1:2380 \
%{ if !skip_tls ~}
     --client-cert-auth \
     --trusted-ca-file /opt/certs/ca.pem \
     --cert-file /opt/certs/server.pem \
     --key-file /opt/certs/server.key \
     --peer-client-cert-auth \
     --peer-trusted-ca-file /opt/certs/ca.pem \
     --peer-cert-file /opt/certs/server.pem \
     --peer-key-file /opt/certs/server.key \
%{ endif ~}
     -initial-cluster-state new
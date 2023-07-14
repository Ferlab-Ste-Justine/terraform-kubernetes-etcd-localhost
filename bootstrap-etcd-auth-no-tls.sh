#!/bin/sh
ROOT_USER=""
while [ "$ROOT_USER" != "root" ]; do
    sleep 1
    etcdctl user add --endpoints=http://127.0.0.1:2379 root:${root_password}
    ROOT_USER=$(etcdctl user list | grep root)
done
ROOT_ROLES=""
while [ -z "$ROOT_ROLES" ]; do
    sleep 1
    etcdctl user grant-role --endpoints=http://127.0.0.1:2379 root root
    ROOT_ROLES=$(etcdctl user get --endpoints=http://127.0.0.1:2379 root | grep "Roles: root")
done
etcdctl auth enable --endpoints=http://127.0.0.1:2379
while [ $? -ne 0 ]; do
    sleep 1
    etcdctl auth enable --endpoints=http://127.0.0.1:2379
done
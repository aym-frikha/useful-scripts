#!/bin/bash

openstack server create --image bionic --flavor m1.small --key-name afrikha --network net1 --user-data user-data.txt test_vm

sleep 10

openstack server add floating ip test_vm 172.16.6.232
#!/bin/bash

openstack server create --image bionic --flavor m1.small --key-name afrikha --network net1 --user-data user-data.txt test_vm1; openstack server create --image bionic --flavor m1.small --key-name afrikha --network net1 --user-data user-data.txt test_vm2; openstack server create --image bionic --flavor m1.small --key-name afrikha --network net1 --user-data user-data.txt test_vm3


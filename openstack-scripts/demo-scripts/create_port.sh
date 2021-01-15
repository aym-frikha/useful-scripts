#!/bin/bash

openstack port create --network net1 --fixed-ip subnet=subnet1,ip-address=192.168.1.50 port1

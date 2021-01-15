juju deploy cs:glance-simplestreams-sync --to lxd:0
juju config glance-simplestreams-sync source="ppa:simplestreams-dev/trunk"
juju add-relation glance-simplestreams-sync keystone
juju add-relation glance-simplestreams-sync rabbitmq-server
#!/bin/bash

curl -si -X POST -H "Content-Type: application/json" -d '{ "auth": { "identity": { "methods": [ "password" ], "password": { "user": { "domain": { "name": "admin_domain" }, "name": "admin", "password": "AhHahvai4voh3Oug" } } }, "scope": { "project": { "domain": { "name": "admin_domain" }, "name": "admin" } } } }' http://blrkeystone:5000/v3/auth/tokens?nocatalog

# list servers api

curl -g -X GET http://blrnova:8774/v2.1/servers/detail -H "User-Agent: python-novaclient" -H "Accept: application/json" -H "X-Auth-Token:1aa4db7494444a4282040c989e5aeed9"
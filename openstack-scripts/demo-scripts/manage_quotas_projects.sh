#/bin/bash

openstack project list

#create project
openstack project create --description 'my new project' new-project \
  --domain admin_domain

#create user and assign to a project
openstack user create --domain admin_domain --project new-project --password-prompt --enable --email new_user@canonical.com new_user

openstack project list


openstack user list

#SHow project quotat

openstack quota show new-project

openstack quota set   new-project --instances 2

openstack quota show new-project
#!/bin/bash
yum install -y epel-release
yum install -y ansible
ansible-playbook  /vagrant/playbook.yml  --connection=local --inventory 127.0.0.1,
cp /vagrant/webapp.service /etc/systemd/system/
systemctl enable --now webapp
cp /vagrant/nginx.conf /etc/nginx/
systemctl enable --now nginx



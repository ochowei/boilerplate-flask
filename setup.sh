#!/bin/bash
BASEDIR=$(dirname "$0")

mkdir -p /usr/share/uwsgi
chmod 777 /usr/share/uwsgi
cp $BASEDIR/* /usr/share/uwsgi/
yum install -y epel-release
yum install -y ansible

ansible-playbook  $BASEDIR/playbook.yml  --connection=local --inventory 127.0.0.1,

cp $BASEDIR/*.service /etc/systemd/system/
systemctl enable --now uwsgi
cp $BASEDIR/nginx.conf /etc/nginx/
systemctl enable --now nginx



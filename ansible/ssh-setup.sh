#!/bin/bash
# setup-ssh.sh

echo "Preparing SSH keys for Ansible..."

mkdir -p ~/.ssh/vagrant_keys
chmod 700 ~/.ssh/vagrant_keys

cp /vagrant/.vagrant/machines/nginx/virtualbox/private_key ~/.ssh/vagrant_keys/nginx
cp /vagrant/.vagrant/machines/backend/virtualbox/private_key ~/.ssh/vagrant_keys/backend
cp /vagrant/.vagrant/machines/db/virtualbox/private_key ~/.ssh/vagrant_keys/db

chmod 600 ~/.ssh/vagrant_keys/*
cp ~/.ssh/vagrant_keys/backend ~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa

sudo cp /vagrant/ansible/ssh_config /etc/ssh/ssh_config 2>/dev/null || true

echo "SSH keys ready"
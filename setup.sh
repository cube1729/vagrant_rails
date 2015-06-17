#!/bin/bash

#Centos 7 - Initial config

#update and upgrade
yum update -y && yum upgrade -y

#install required packages
yum install -y openssh-server ntp git gcc kernel-devel make wget bzip2 net-tools zlib zlib-devel gcc-c++ patch readline readline-devel libyaml-devel libffi-devel openssl-devel autoconf automake libtool bison curl sqlite-devel epel-release

yum install -y nodejs

#enable ntp and ssh
systemctl enable sshd.service
systemctl enable ntpd.service

#disable firewall
systemctl disable firewalld.service

#set seliux to permissive
sed -i "s/^SELINUX=.*/SELINUX=permissive/" /etc/selinux/config

#set vagrant user permissions
sed -i "s/^\(Defaults.*requiretty\)/#\1/" /etc/sudoers
echo "vagrant ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

#create vagrant insecure key
mkdir /home/vagrant.ssh
curl https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub >> /home/vagrant/.ssh/authorized_keys

#set folder/file permissions
chmod 700 -r /home/vagrant.ssh
chmod 600 /home/vagrant/.ssh/autorized_keys
chown -R vagrant:vagrant /home/vagrant/.ssh

#move files to vagrant home
mkdir ~/setup
mv ~/setup/bashrc_add /home/vagrant/setup/bashrc_add
mv ~/setup/rbenv.sh /home/vagrant/setup/rbenv.sh
mv ~/setup/vagrant.sh /home/vagrant/setup/vagrant_clean.sh
chown -r vagrant:vagrant /home/vagrant/setup

#restart
shutdown -r now
#!/bin/bash

#Centos 7 - Vagrant clean up

sudo rm -rf /tmp/*
sudo yum clean all

rm -rf ~/setup
history -c
 
shutdown -h now
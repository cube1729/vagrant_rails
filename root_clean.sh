#!/bin/bash

#Centos 7 - Root clean up

umount /media/cdrom
rm -rf /media/cdrom

rm -rf /tmp/*
yum clean all

rm -rf ~/setup
history -c
 
exit
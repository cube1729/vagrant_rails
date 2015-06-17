#!/bin/bash

#Centos 7 - Virtual Box Install guest additions

mkdir /media/cdrom 
mount /dev/cdrom /media/cdrom
cd /media/cdrom
./VBoxLinuxAdditions.run
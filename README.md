# vagrant_rails
These scripts setup a Centos 7 Vagrant box with Rails dev environment.

##First stage is manual to create the virtual box vm.
##Create Centos VM
- Download the CentOS minimum instal ISO from http://isoredirect.centos.org/centos/7/isos/x86_64/
- Launch VirtualBox and create a new Centos VM. Give it a descriptive name such as "vagrant-centos7", select Linux as the type and RedHat as the version.
- You can keep the Memory amount to default.
- Accept the default to create a virtual hard drive, use the VirtualBox VDI, keep dynamic allocation and change the default size to 16Gb (More if required).
- Disable Audio and USB
- Ensure network adaptor is configured as NAT.
- Under storage, select the CD drive and add the CentOS ISO.
- Now start the new VM.

##Install Centos Operating System
- At the Centos splash screen select Install CentOS 7.
- At the GUI install select the correct language.
- Select the installation destination and then start installation.
- Configure networking to DHCP on.
- Set the root password to vagrant.
- Create vagrant user with password of vagrant make administrator.
- Reboot when install is complete.

##Configure CentOS
Login as root
install git

    yum install -y git

clone this repo to a setup directory and make scrips executable

    git clone https://github.com/cube1729/vagrant_rails.git ~/setup
    cd setup && chmod +w *.sh

Run the setup script

    ./setup.sh
    
Login as root again
In virtualbox window select Devices and the Insert guest additions cd
change to setup directory and run guest_add script

    cd setup
    ./guest_add.sh
    
Run root cleanup script

    ./root_clean.sh

Exit and log in as vagrant

Run the rbenv script

    cd setup
    ./rbenv.sh
    
Run the vagrant cleanup




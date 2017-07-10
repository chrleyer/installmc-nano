#!/bin/sh
#
# This list of commands will install MC and NANO on systems
# based on Scientific Linux 7.x, CentOS 7 or RedHat 7
# 
# This is targeting the installation as a generic user
# if you don't have root access to the host
#

mkdir ~/bin
echo 'if [ -d "$HOME/bin" ] ; then PATH="$HOME/bin:$PATH"; fi' >> ~/.profile
mkdir -p ~/.local/share
mkdir ~/src
cd ~/src
wget http://ftp.scientificlinux.org/linux/scientific/7.3/x86_64/os/Packages/mc-4.8.7-11.el7.x86_64.rpm
rpm2cpio mc-4.8.7-11.el7.x86_64.rpm | cpio -idmv
wget http://ftp.scientificlinux.org/linux/scientific/7.3/x86_64/os/Packages/gpm-libs-1.20.7-5.el7.x86_64.rpm
rpm2cpio gpm-libs-1.20.7-5.el7.x86_64.rpm | cpio -idmv
wget http://ftp.scientificlinux.org/linux/scientific/7.3/x86_64/os/Packages/nano-2.3.1-10.el7.x86_64.rpm
rpm2cpio nano-2.3.1-10.el7.x86_64.rpm | cpio -idmv
wget http://ftp.scientificlinux.org/linux/scientific/7.3/x86_64/os/Packages/ncurses-5.9-13.20130511.el7.x86_64.rpm
rpm2cpio ncurses-5.9-13.20130511.el7.x86_64.rpm | cpio -idmv
cp -ar ${HOME}/src/usr/share/mc ~/.local/share/
cp -ar ${HOME}/src/etc/nanorc ${HOME}/.nanorc
echo 'export LD_LIBRARY_PATH=${HOME}/src/usr/lib64/' >> ~/.profile
echo 'export EDITOR=nano' >> ~/.profile
. ~/.profile

ln -s ${HOME}/src/usr/bin/mc ~/bin/mc
ln -s ${HOME}/src/usr/bin/nano ~/bin/nano
cp -ar ${HOME}/src/usr/bin/mcedit ~/bin/
cp -ar ${HOME}/src/usr/bin/mcview ~/bin/

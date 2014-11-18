#!/bin/sh
# Copied from
# http://vmassuchetto.github.io/2013/08/14/reducing-a-vagrant-box-size/

echo
echo
echo "----------# Unmount /vagrant"
umount /vagrant

echo
echo
echo "----------# Remove APT files"
find /var/lib/apt -type f | xargs rm -f

echo
echo
echo "----------# Remove documentation files"
find /var/lib/doc/* -type f | xargs rm -f
rm -rf /usr/share/doc

echo
echo
echo "----------# Remove Virtualbox specific files"
rm -rf /usr/src/vboxguest* /usr/src/virtualbox-ose-guest*

echo
echo
echo "----------# Remove Linux headers"
rm -rf /usr/src/linux-headers*

echo
echo
echo "----------# Remove Unused locales"
rm -rf /usr/share/locale/*

echo
echo
echo "----------# Clean cache"
find /var/cache -type f -exec rm -rf {} \;

echo
echo
echo "----------# Remove bash history"
unset HISTFILE
rm -f /root/.bash_history
rm -f /home/vagrant/.bash_history

echo
echo
echo "---------# Cleanup log files"
find /var/log -type f | while read f; do echo -ne '' > $f; done;

echo
echo
echo "------------------------------"
echo "Box provisioned. Ready to use"
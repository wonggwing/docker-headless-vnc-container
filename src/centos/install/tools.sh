#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install some common tools for further installation"
yum -y install epel-release 
yum -y update
yum -y install sudo wget which net-tools bzip2 \
    psmisc git java-1.8.0-openjdk nss_wrapper gettext

echo "Install Xfce4 UI components and disable xfce-polkit"
yum --enablerepo=epel -y -x gnome-keyring --skip-broken groups install "Xfce" 
yum -y groups install "Fonts"
yum erase -y *power* *screensaver*
rm /etc/xdg/autostart/xfce-polkit*
/bin/dbus-uuidgen > /etc/machine-id

yum clean all

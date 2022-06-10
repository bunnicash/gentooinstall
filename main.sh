#!/bin/bash
## Copyright (C) 2022 bunnicash "@bunnicash" and licensed under GPL-2.0
source /root/gentooinstall/config.gentooinstall

## Finishing Chroot
source /etc/profile
mount /dev/${drive}1 /boot
emerge-webrsync

## Building Profile
eselect profile $gprof  # eselect profile list
emerge --verbose --update --deep --newuse @world

## Machine Timezone, Locale 
clear && echo $zone > /etc/timezone
emerge --config sys-libs/timezone-data
echo "$deflocale $deflocale2" >> /etc/locale.gen
locale-gen
eselect locale set 4  # eselect locale list (4??)
env-update && source /etc/profile

## Firmware
echo "sys-kernel/linux-firmware @BINARY-REDISTRIBUTABLE" | tee -a /etc/portage/package.license
emerge sys-kernel/linux-firmware
# TODO ucode, intel in particular 
clear 

## Kernel (Binary, unconfigured)
if [ $gkernel == "0" ]; then
    emerge sys-kernel/gentoo-kernel-bin
elif [ $gkernel == "1" ]; then
    echo "coming soon, falling back to default..."
    emerge sys-kernel/gentoo-kernel-bin
fi 
clear 

## Edit Fstab Template (no UUIDs currently)
echo -e "$(lsblk)\n"
echo -ne "
/dev/${drive}1      	/boot      	ext4      	noauto,noatime  1 2
/dev/${drive}3      	/       	ext4      	noatime         0 1
/dev/${drive}2      	none      	swap      	sw      	    0 0 
" >> /etc/fstab 

## Hostname
echo $hostname > /etc/conf.d/hostname

## Network (ls /sys/class/net)
emerge net-misc/dhcpcd netifrc
rc-update add dhcpcd default
rc-service dhcpcd start 
echo -e "config_$netdev=\"dhcp\" " > /etc/conf.d/net
cd /etc/init.d/
ln -s net.lo net.$netdev
rc-update add net.$netdev default 

## Accounts
# Root (/etc/pam.d/system-auth, https://wiki.gentoo.org/wiki/Security_Handbook/PAM)
(echo $rootpass; echo $rootpass) | passwd
echo " "

## Bootloader: GRUB
echo -ne "
GRUB_PLATFORMS=\"efi-64\"
" >> /etc/portage/make.conf 
emerge sys-boot/grub
grub-install --target=x86_64-efi --efi-directory=/boot 
grub-mkconfig -o /boot/grub/grub.cfg 

## Applications
emerge neofetch 
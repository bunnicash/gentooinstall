#!/bin/bash
## Copyright (C) 2022 bunnicash "@bunnicash" and licensed under GPL-2.0
source /root/gentooinstall/config.gentooinstall

## Partitioning
umount -A --recursive /mnt
partprobe /dev/$drive
sgdisk -Z /dev/$drive
echo " "
sgdisk -a 2048 -o /dev/$drive
echo " "
sgdisk --new 1::+512M --typecode 1:EF00 /dev/$drive
sgdisk --new 2::+$part_swap --typecode 2:8200 /dev/$drive
sgdisk --new 3::0 --typecode 3:8300 /dev/$drive
echo " "
partprobe /dev/$drive
mkfs.fat -F32 /dev/${drive}1
mkswap /dev/${drive}2
swapon /dev/${drive}2
mkfs.ext4 /dev/${drive}3
echo " " && lsblk && sleep 2
mkdir /mnt/gentoo && mount /dev/${drive}3 /mnt/gentoo

## Import Gentoo Stages
ntpd -q -g
date
cd /mnt/gentoo
links $getstage
clear 
tar xpvf stage3-*.tar.xz --xattrs-include='*.*' --numeric-owner

## Configure make.conf (/mnt/gentoo/etc/portage)
cd etc/portage
# common_flags, makeopts
sed -i 's/^COMMON_FLAGS="-02 -pipe"/COMMON_FLAGS="-march=native -02 -pipe"/' make.conf
jthreads=$(nproc --all)
if [ $jthreads -le $jsplit ]; then
    echo -ne "
    MAKEOPTS=\"-j$jthreads\"
    " >> make.conf
elif [ $jthreads -gt $jsplit ]; then
    njobs="0"
    while [ $jthreads -ge $jsplit ]; do
        jthreads=$(($jthreads - $jsplit))
        njobs=$(($njobs + 1))
    done
    echo -ne "
    MAKEOPTS=\"-j$jsplit\"
    EMERGE_DEFAULT_OPTS=\"--jobs $njobs\"
    " >> make.conf
fi
# "use"-flags
echo -ne "
USE=\"$use_flg\"
" >> make.conf

# gentoo_mirrors (https://wiki.gentoo.org/wiki/GENTOO_MIRRORS, https://www.gentoo.org/downloads/mirrors/
mirrorselect -i -o >> /mnt/gentoo/etc/portage/make.conf
clear
mkdir --parents /mnt/gentoo/etc/portage/repos.conf
cp /mnt/gentoo/usr/share/portage/config/repos.conf /mnt/gentoo/etc/portage/repos.conf/gentoo.conf
cp --dereference /etc/resolv.conf /mnt/gentoo/etc/
mount --types proc /proc /mnt/gentoo/proc/
mount --rbind /sys /mnt/gentoo/sys
mount --make-rslave /mnt/gentoo/sys
mount --rbind /dev /mnt/gentoo/dev
mount --make-rslave /mnt/gentoo/dev
mount --bind /run /mnt/gentoo/run
mount --make-slave /mnt/gentoo/run

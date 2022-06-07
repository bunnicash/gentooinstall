#!/bin/bash
## Copyright (C) 2022 bunnicash "@bunnicash" and licensed under GPL-2.0
source /root/gentooinstall/config.gentooinstall

##Keymap(1)
loadkeys $defaultkeys

##Partitioning
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
mount /dev/${drive}3 /mnt && mkdir /mnt/gentoo

##Timezone
hwclock --systohc
timedatectl set-ntp true
timedatectl set-timezone $zone
date

## Import Gentoo Stages
cd /mnt/gentoo
pacman -Sy wget links nano --noconfirm
wget $stagelink
# TODO Use "links" instead? TUI browser - https://wiki.gentoo.org/wiki/Handbook:AMD64/Installation/Stage
tar xpvf stage3-*.tar.xz --xattrs-include='*.*' --numeric-owner
clear && ls

## Configure make.conf (/mnt/gentoo/etc/portage)
cd etc/portage
nano make.conf
# TODO Use sed to replace


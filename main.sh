#!/bin/bash
## Copyright (C) 2022 bunnicash "@bunnicash" and licensed under GPL-2.0
source /root/gentooinstall/config.gentooinstall

## Finishing Chroot
source /etc/profile
mount /dev/${drive}1 /boot
emerge-webrsync

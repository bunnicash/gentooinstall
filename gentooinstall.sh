#!/bin/bash
## Copyright (C) 2022 bunnicash "@bunnicash" and licensed under GPL-2.0
version="v0.1-001 alpha"

##Colors
c-mg () {
    echo -ne "\e[95m" # Magenta
}
c-df () {
    echo -ne "\e[39m" # Default
}

##Gentooinstall
cd /root/gentooinstall
chmod +x *.sh
c-mg && echo -ne "

     /#####\.                |
      \#######\.             |
       \####O####\.          |
        \###########\        |
         )###########)       |        Welcome to gentooinstall $version!
        /###########/        |
       /#########/'          |
      /#######/'             |
     /#####/'                |

" && c-df
# Configuration
read -p "Edit gentooinstall configuration [1], import a custom config [2] or use defaults [3]? " gentooconfig
if [ $gentooconfig == "1" ]; then
    nano /root/gentooinstall/config.gentooconfig
elif [ $gentooconfig == "2" ]; then
    read -p "Specify the absolute path to your config file [e.g /mnt/device/folder]: " importconfig
    cp -f $importconfig/config.archinstall /root/gentooinstall
elif [ $gentooconfig == "3" ]; then
    echo "Using default configuration..."
fi
# Modules
bash discard.sh
bash startup.sh

c-mg && echo -ne "

     /#####\.                |
      \#######\.             |
       \####O####\.          |
        \###########\        |
         )###########)       |        The installation is complete, rebooting in 2 seconds...
        /###########/        |
       /#########/'          |
      /#######/'             |
     /#####/'                |

" && c-df
sleep 2 && reboot now












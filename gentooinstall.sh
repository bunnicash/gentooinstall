#!/bin/bash
## Copyright (C) 2022 bunnicash "@bunnicash" and licensed under GPL-2.0
version="v0.1-004 alpha"

##Colors
c-mg () {
    echo -ne "\e[35m" # Magenta
}
c-df () {
    echo -ne "\e[39m" # Default
}

##Gentooinstall
cd /root/gentooinstall && chmod +x *.sh
c-mg && echo -ne "

     /#####\.                |
      \#######\.             |
       \###(O)###\.          |
        \###########\        |
         )###########)       |        Welcome to gentooinstall $version!
        /###########/        |
       /#########/'          |
      /#######/'             |
     /#####/'                |

" && c-df

# Configuration
read -p "Edit gentooinstall configuration [1] or use defaults [2]? " gentooconfig
if [ $gentooconfig == "1" ]; then
    echo -e "Starting editor (CTRL+O to save, CTRL+X to quit) \n" && sleep 2
    nano /root/gentooinstall/config.gentooconfig
elif [ $gentooconfig == "2" ]; then
    echo -e "Using default configuration... \n"
fi

# Modules
bash discard.sh
bash startup.sh
cd /root && mv gentooinstall /mnt/gentoo/root
chroot /mnt/gentoo /root/gentooinstall/main.sh

c-mg && echo -ne "

     /#####\.                |
      \#######\.             |
       \###(O)###\.          |
        \###########\        |
         )###########)       |        The installation is complete, rebooting in 2 seconds...
        /###########/        |
       /#########/'          |
      /#######/'             |
     /#####/'                |

" && c-df
sleep 2












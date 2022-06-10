# gentooinstall
Automated Gentoo Linux Installation <br>

<p>
    <a href="https://github.com/bunnicash/gentooinstall">
        <img src="https://img.shields.io/github/stars/bunnicash/gentooinstall?style=flat-square">
    </a>
    <a href="https://github.com/bunnicash/gentooinstall/blob/main/LICENSE">
        <img src="https://img.shields.io/github/license/bunnicash/gentooinstall?style=flat-square">
    </a>
    <a href="https://github.com/bunnicash/gentooinstall/issues">
        <img src="https://img.shields.io/github/issues/bunnicash/gentooinstall?style=flat-square">
    </a>
    <a href="https://github.com/bunnicash/gentooinstall">
        <img src="https://img.shields.io/tokei/lines/github/bunnicash/gentooinstall?style=flat-square">
    </a>
    <a href="https://github.com/bunnicash/gentooinstall">
        <img src="https://img.shields.io/github/last-commit/bunnicash/gentooinstall?style=flat-square">
    </a>
</p>
<br>

### Using gentooinstall
- Gentoo can be installed via its own minimal installer, but it can also be installed on any other live media or running system.
- For a full guide, see the [Gentoo Handbook, amd64](https://wiki.gentoo.org/wiki/Handbook:AMD64/Full/Installation)
- We encourage you to boot into the Gentoo live CD and to download the latest release from GitHub: `cd /root && wget https://github.com/bunnicash/gentooinstall/releases/download/latest/gentooinstall.tar.gz`
- After downloading the program, simply untar it: `tar -xvf gentooinstall.tar.gz` and finally, start the installer: `cd gentooinstall && chmod +x * && ./gentooinstall.sh`
<br><br>

### Useful Information
- Use an EFI system, enable EFI mode when using VM's
- For the partitioning wizard, have a disk with >=100GB
- Be faster: When typing things into the terminal, press tab to auto-complete 
- ... 
<br><br>

### Features
- [x] Unattended installation mode with custom-made/imported configurations
- [x] ...
<br><br>

### Testing / Contributing:
- Is there an unstable branch for testing? Yes, you can use the testing branch: `git clone -b testing https://github.com/bunnicash/gentooinstall`.
- This is also the key branch for all major gentooinstall development, as changes are first introduced here and merged to main once deemed functional/stable. <br><br>

### Configurations:
- Gentooinstall uses the `config.gentooinstall` file that users may edit/import - this makes heavily automated deployments possible
- To understand how the configuration file works and what you can do with it, here's the list of options you can change:<br>
<pre><b>Settings</b>
• drive: the target drive to format and install on, see "lsblk" and "blkid" for more
• machineused: set to "hw" for real hardware, "vm" for virtual environments - determines formatting/discarding process
• part_swap: swap partition size for the linux installation, size x in GB = xG
• zone: the timezone used by the system, keep in mind many DE's need a separate GUI set-up for this too
• stagelink: link to a stage3 tar, might be replaced with links browser in the future
• jthreads: number of threads for makeopts, for every package
• jsplit: split cpu into units of n-cores, determines with njobs, jthreads how many packages are processed at the same time and with how many threads each
• use_flg: globaly set use flags (-X to not use/enable, X to use/enable)
• gprof: the oortage profile that's used, see https://wiki.gentoo.org/wiki/Profile_(Portage) 
• deflocale, deflocale2: the default locale, currently split into 2 variables 
• gkernel: gentoo kernel, "0" for default linux kernel in binary form, "1" for custom variations
• hostname: the name of the system/host
• rootpass: root / superuser password 
• netdev: the network device, e.g: eth0 
</pre>
<br>

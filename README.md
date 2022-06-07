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
- The project provides an automated installer that you'll have to download to a drive that can be accessed when using the Gentoo live CD.
- To do so for example on a running Linux machine, create a folder to clone the github repository to: `git clone https://github.com/bunnicash/gentooinstall`
- After you've booted, simply copy/move the program directory from your drive directly to the Gentoo live root, e.g: `cp -f /mnt/EXAMPLE/gentooinstall /root`
- Once done, you can for example boot the Gentoo live CD, mount the drive you cloned the project to and start the installer `cd /root/gentooinstall && chmod +x * && ./gentooinstall.sh`
<br><br>

### Useful Information
- ...
<br><br>

### Features
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
• ...
</pre>
<br>

<h1 align="center"> ━━━━━━  ❖  ━━━━━━ </h1>

![](https://github.com/AndersonShelby/xfce4-conf/blob/master/logos/logo-purple.svg)

<div align="center">

[![stars](https://img.shields.io/github/stars/AndersonShelby/xfce4-conf?color=C9CBFF&labelColor=1A1B26&style=for-the-badge)](https://github.com/AndersonShelby/xfce4-conf/stargazers)
[![last commit](https://img.shields.io/github/last-commit/AndersonShelby/xfce4-conf?color=9ece6a&labelColor=1A1B26&style=for-the-badge)](https://github.com/AndersonShelby/xfce4-conf/commits/master)
[![license](https://img.shields.io/github/license/AndersonShelby/xfce4-conf?color=FCA2AA&labelColor=1A1B26&style=for-the-badge)](https://github.com/AndersonShelby/xfce4-conf/blob/master/LICENSE)

</div>

---

# xfce4-conf 🚀 - My configuration for xfce4! 💻
> Note: For now, this configuration only works in Termux, but I will soon bring portability to other distributions.

> Credits: This configuration is initially based on the work of Yisus7u7 and derived specifically from their repository termux-desktop-xfce. Over time, I have customized and adapted it to suit my own needs, but credit goes to Yisus7u7 for the original setup and inspiration.

---

## Lightweight and Beautiful XFCE4 Desktop 🎨✨

🎨 A custom, lightweight, and visually appealing XFCE4 desktop environment for users who seek both efficiency and style.

<details>
  <summary>Desktop preview (video) 💻</summary>

  https://github.com/user-attachments/assets/3e58330d-ea4d-4aac-bb7a-bb067418967a

</details>

<details>
  <summary>Desktop preview (screenshot) 💻 </summary>

  ![](https://github.com/AndersonShelby/xfce4-conf/blob/master/media/Screenshot-02.png)

</details>

---

## Installation ⚙️
<details>
  <summary>Termux (Native Desktop)📱</summary>
  
  
  ### 1. Download and run the installation script with:
  
  ```bash
  
  wget https://raw.githubusercontent.com/AndersonShelby/xfce4-conf/refs/heads/master/scripts/termux/install.sh && chmod +x install.sh && ./install.sh
  
  ```

> WARNING: Your current configurations will be moved to ~/Backup.

> Note: If you have important settings, they will be saved there for future restoration.

 
  ### 2. Download the x11 startup script with:

  ```bash

  wget https://raw.githubusercontent.com/AndersonShelby/xfce4-conf/refs/heads/master/scripts/termux/X11-launchers/startx_native && chmod +x startx_native
  
  ```

> Note: This script will be responsible for opening the x11 desktop.

> Note: Leave it in an accessible place.

  ### 3. Now run the script with:

  ```bash

  ./startx_native

  ```

> Note: You need to have Termux-x11 installed.

> Note: This should launch x11 with your desktop environment!

</details>

<details>
  <summary>Arch Linux (Proot Desktop) 📱</summary>

  ### 1. First install some necessary dependencies with:

  ```bash

  pkg update && pkg upgrade -y
  pkg install x11-repo -y
  pkg install termux-x11-nightly -y
  pkg install pulseaudio -y
  pkg install proot-distro -y

  ```

  > Note: Updates and upgrades Termux packages, installs the X11 repository, the nightly version of Termux-X11, PulseAudio for sound management, and Proot-Distro for managing Linux distributions in Termux.

  ### 2. Install Arch Linux with:

  ```bash

  proot-distro install archlinux

  ```

  > Note: Installs the Arch Linux distribution in Termux using Proot-Distro.

  ### 3. Log into Arch with:

  ```bash

  proot-distro login archlinux

  ```

  > Note: Logs into the installed Arch Linux distribution in Termux using Proot-Distro.

  ### 4. Update the repositories and install sudo with:

  ```bash

  pacman -Sy
  pacman -Syu

  pacman -S sudo

  ```

  > Note: pacman -Sy: Updates the package database to sync with the latest available versions.

  > Note: pacman -Syu: Fully updates the system by syncing the database and upgrading all installed packages.

  > Note: pacman -S sudo: Installs the sudo package, allowing users to execute commands with administrative privileges.




  ### 5. Add a new user and set a password with:

  ```bash

  useradd -m -G wheel shelby
  passwd shelby

  ```

  > Note: Creates a new user shelby with a home directory, adds them to the wheel group for administrative privileges, and sets their password.

  ### 6. Give sudo permissions to the user with:

  ```bash

  nano /etc/sudoers

  ```

  > Note: This will open the /etc/sudoers file with nano, paste the line below.


  ```bash

  # Paste the following line:
  shelby ALL=(ALL) ALL

  ```

  > Note: Adds a line to the sudoers file, granting the user shelby permission to run all commands as any user with administrative privileges using sudo.

  > Note: You put it under the root user line.

  ### 7. Log in to the shelby user with:

  ```bash

  login shelby

  ```

  > Note: Switches to the user shelby, logging into their account.

  ### 8. Now download wget and the installation script with:

  ```bash

  sudo pacman -S wget

  ```

  > Note: Installs the wget utility, which is used to download files from the web.

  ```bash

  wget https://raw.githubusercontent.com/AndersonShelby/xfce4-conf/refs/heads/master/scripts/archlinux/install.sh && chmod +x install.sh && ./install.sh

  ```

  > Note: Download the install.sh script from the repository, make it repeatable with chmod +x , and then run it to perform the installation process.

  ### 9. Close Arch, and download the x11 startup script in termux with:

  ```bash

  wget https://raw.githubusercontent.com/AndersonShelby/xfce4-conf/refs/heads/master/scripts/archlinux/X11-launcher/startxfce4_arch.sh && chmod +x startxfce4_arch.sh

  ```

  > Note: Download the startxfce4_arch.sh script from the repository, make it executable with chmod +x , allowing it to be used to start the XFCE4 desktop environment on Arch Linux.

  ### 10. Start x11 with:

  ```bash

  ./startxfce4_arch.sh

  ```

  > After that your environment should be ready!

</details>

---

## Credits 🙌

This project was made possible thanks to the inspiration and contributions of the following developers:

- [Yisus7u7](https://github.com/Yisus7u7): For the initial configuration and inspiration behind the project.
- [LinuxDroidMaster](https://github.com/LinuxDroidMaster): For providing scripts to support the X11 startup process.
- [HynDuf](https://github.com/HynDuf): For some visual elements.

Thank you both for your invaluable contributions!



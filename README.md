<h1 align="center"> ━━━━━━  ❖  ━━━━━━ </h1>

![](https://github.com/AndersonShelby/xfce4-conf/blob/master/logos/logo-purple.svg)

<div align="center">

[![stars](https://img.shields.io/github/stars/AndersonShelby/xfce4-conf?color=FCA2AA&labelColor=1A1B26&style=for-the-badge)](https://github.com/AndersonShelby/xfce4-conf/stargazers)
[![last commit](https://img.shields.io/github/last-commit/AndersonShelby/xfce4-conf?color=9ece6a&labelColor=1A1B26&style=for-the-badge)](https://github.com/AndersonShelby/xfce4-conf/commits/master)
[![license](https://img.shields.io/github/license/AndersonShelby/xfce4-conf?color=FCA2AA&labelColor=1A1B26&style=for-the-badge)](https://github.com/AndersonShelby/xfce4-conf/blob/master/LICENSE)

<img src="https://img.shields.io/github/release/AndersonShelby/xfce4-conf?color=FCA2AA&labelColor=1A1B26&style=for-the-badge">

</div>

---

# xfce4-conf 🚀 - My configuration for xfce4! 💻
> [!NOTE]
> Note: I will soon bring support for other Linux distributions.

> [!CAUTION]
> This project is still under development and may contain bugs.

---

## Lightweight and Beautiful XFCE4 Desktop 🎨✨

🎨 A custom, lightweight, and visually appealing XFCE4 desktop environment for users who seek both efficiency and style.

<details>
  <summary>Desktop preview (screenshot) 💻 </summary>

  ![](https://github.com/AndersonShelby/xfce4-conf/blob/master/previews/Screenshot-06.png)

</details>

---

## Installation ⚙️
<details>
  <summary>Termux (Native Desktop)📱</summary>
  
  
  ### 1. Download and run the installation script with:
  
  ```bash
  
  wget https://raw.githubusercontent.com/AndersonShelby/xfce4-conf/refs/heads/master/scripts/setup.sh && chmod +x setup.sh && ./setup.sh
  
  ```

> WARNING: Your current configurations will be moved to ~/Backup.

> Note: If you have important settings, they will be saved there for future restoration.

 
  ### 2. Download the x11 startup script with:

  ```bash

  wget https://raw.githubusercontent.com/AndersonShelby/xfce4-conf/refs/heads/master/scripts/X11-launcher/startdesktop && chmod +x startdesktop
  
  ```

> Note: This script will be responsible for opening the x11 desktop.

> Note: Leave it in an accessible place.

  ### 3. Now run the script with:

  ```bash

  ./startdesktop

  ```

> Note: You need to have Termux-x11 installed.

> Note: This should launch x11 with your desktop environment!

</details>

---

## Credits 🙌

This project was made possible thanks to the inspiration and contributions of the following developers:

- [Yisus7u7](https://github.com/Yisus7u7): For the initial configuration and inspiration behind the project.
- [LinuxDroidMaster](https://github.com/LinuxDroidMaster): For providing scripts to support the X11 startup process.
- [HynDuf](https://github.com/HynDuf): For some visual elements.

Thank you both for your invaluable contributions!



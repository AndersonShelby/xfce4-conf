#!/bin/bash
#============================================================
# Script: XFCE4-Conf
# Author: ShelbyX⚡
# Purpose: Customize and configure XFCE4 in Termux.
# GitHub: https://github.com/AndersonShelby
# Date: 11/17/2024
#
# Description:
# Automates the configuration of the XFCE4 graphical environment
# offering an optimized and stylish visual experience.
#==============================================================

# Definindo as cores
black="\033[0;30m"
red="\033[0;31m"
green="\033[0;32m"
yellow="\033[0;33m"
blue="\033[0;34m"
cyan="\033[0;36m"
white="\033[0;37m"
reset="\033[0m"

# Status
info="${cyan}[+]${reset}"
success="${green}[✓]${reset}"
error="${red}[!]${reset}"

# Limpar terminal
clear

install_packages() {
    printf "${info} Installing required packages...\n"
    sleep 2

    # Atualiza pacotes e instala wget
    apt update && apt upgrade -y
    apt install -y wget

    # Remove e adiciona nova fonte de repositório
    rm $PREFIX/etc/apt/sources.list.d/termux-desktop-xfce.list 2>/dev/null
    wget -P $PREFIX/etc/apt/sources.list.d https://raw.githubusercontent.com/Yisus7u7/termux-desktop-xfce/gh-pages/termux-desktop-xfce.list

    # Habilita o repositório x11-repo
    apt install -y x11-repo
    apt update

    # Instala pacotes necessários
    apt install -y xfce4 xfce4-goodies termux-desktop-xfce breeze-cursor-theme kvantum \
        ttf-microsoft-cascadia audacious leafpad pavucontrol-qt hexchat geany synaptic \
        firefox termux-x11-nightly pulseaudio
}

setup_directories() {
    printf "${info} Setting up directories...\n"
    mkdir -p $HOME/.backup
    mv $HOME/.config $HOME/.backup 2>/dev/null
    mv $HOME/.vnc $HOME/.backup 2>/dev/null
    mkdir -p $HOME/Desktop $HOME/Downloads $HOME/Templates $HOME/Public $HOME/Documents $HOME/Pictures $HOME/Videos
    termux-setup-storage
    ln -s $HOME/storage/music $HOME/Music
}

installing_xfce4_conf() {
    printf "${info} Installing xfce4-conf...\n"
    sleep 2

    # Baixar e extrair arquivos necessários
    cd $HOME
    wget https://github.com/AndersonShelby/xfce4-conf/releases/download/v1.0.3-Alpha-Genesis/XFCE4-Conf.v1.0.3-Alpha-Genesis.tar.gz
    tar -xzf XFCE4-Conf.v1.0.3-Alpha-Genesis.tar.gz > /dev/null 2>&1

    # Identificar pasta raiz
    extracted_dir=$(tar -tzf XFCE4-Conf.v1.0.2-Alpha-Genesis.tar.gz | head -1 | cut -f1 -d"/")
    cd "$extracted_dir"

    # Mover arquivos
#    mv files/.config $HOME/
#    mv files/.themes $HOME/
#    mv files/.icons $HOME/
#    mv files/.local $HOME/
}

download_x11_launcher() {
    printf "${info} Downloading x11 startup script...\n"
    sleep 2
    cd $HOME
    wget -O startdesktop https://raw.githubusercontent.com/AndersonShelby/xfce4-conf/refs/heads/master/scripts/X11-launcher/startdesktop
    chmod +x startdesktop
}

main() {
    clear
    install_packages
    clear
    setup_directories
    clear
    installing_xfce4_conf
    clear
#    download_x11_launcher
    clear
    printf "${success} Setup completed! Use ${blue}./startdesktop${reset} to start the desktop.\n"
}

main

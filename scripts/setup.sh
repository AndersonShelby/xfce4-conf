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

update_repository() {
    printf "${info}${green}Updating repository list for termux-desktop-xfce...${reset}\n"
    sleep 2
    
    # Caminho do repositório
    repo_path="$PREFIX/etc/apt/sources.list.d/termux-desktop-xfce.list"
    repo_url="https://raw.githubusercontent.com/Yisus7u7/termux-desktop-xfce/gh-pages/termux-desktop-xfce.list"

    # Remove a fonte de repositório antiga, se existir
    if [ -f "$repo_path" ]; then
        printf "${info}${green}Removing old repository file...${reset}\n"
        rm "$repo_path" 2>/dev/null || { printf "${error}${red}Failed to remove old repository file.${reset}"; exit 1; }
    else
        printf "${error}${red}No old repository file found.${reset}\n"
    fi

    # Baixa a nova fonte de repositório
    echo "Downloading new repository file..."
    wget -P "$PREFIX/etc/apt/sources.list.d" "$repo_url" || { echo "Failed to download new repository file."; exit 1; }

    printf "${success}${green}Repository list updated successfully!${reset}\n"
}

install_packages() {
    printf "${info}${green}Installing required packages...${reset}\n"
    sleep 2

    # Atualiza pacotes e instala wget
    pkg update && apt upgrade -y
    pkg install -y wget

    # Habilita o repositório x11-repo
    pkg install -y x11-repo

    pkg install -y tur-repo || { echo "Failed to install tur-repo."; exit 1; }
    # Instala pacotes necessários

# Lista de pacotes necessários
packages=(
    xfce4
    xfce4-goodies
    termux-desktop-xfce
    breeze-cursor-theme
    kvantum
    ttf-microsoft-cascadia
    audacious
    leafpad
    pavucontrol-qt
    hexchat
    geany
    synaptic
    firefox
    termux-x11-nightly
    pulseaudio
)

# Loop para instalar cada pacote
for package in "${packages[@]}"; do
    printf "${info}${green}Installing ${yellow}$package${green}...${reset}\n"
    if pkg install -y "$package"; then
        printf "${success}${yellow}$package ${green}installed successfully!${reset}\n"
    else
        printf "${error}${red}Failed to install ${yellow}$package. ${red}Exiting...${reset}\n"
        exit 1
    fi
done

printf "${success}${green}All packages installed successfully!${reset}\n"

}

setup_directories() {
    printf "${info}${green}Setting up directories...${reset}\n"
    mkdir -p $HOME/.backup
    mv $HOME/.config $HOME/.backup/ 2>/dev/null
    mv $HOME/.local $HOME/.backup/ 2>/dev/null
    mv $HOME/.themes $HOME/.backup/ 2>/dev/null
    mv $HOME/.icons $HOME/.backup/ 2>/dev/null
    mv $HOME/.zshrc $HOME/.backup/ 2>/dev/null
    mv $HOME/.oh-my-zsh $HOME/.backup/ 2>/dev/null
    mkdir -p $HOME/Desktop $HOME/Downloads $HOME/Templates $HOME/Public $HOME/Documents $HOME/Pictures $HOME/Videos
    termux-setup-storage
    ln -s $HOME/storage/music $HOME/Music
}

installing_xfce4_conf() {
    printf "${info}${green}Installing xfce4-conf...${reset}\n"
    sleep 2

    # Baixar e extrair arquivos necessários
    cd $HOME
    
    if wget https://github.com/AndersonShelby/xfce4-conf/releases/download/v1.0.3-Alpha-Genesis/XFCE4-Conf.v1.0.3-Alpha-Genesis.tar.gz; then
    printf "${success}${green}Download completed successfully!${reset}\n"
else
    printf "${error}${red}Failed to download ${yellow}XFCE4-Conf. ${red}Exiting...${reset}\n"
    exit 1
fi

if tar -xzf XFCE4-Conf.v1.0.3-Alpha-Genesis.tar.gz > /dev/null 2>&1; then
    echo "${success}${green}Extraction completed successfully!${reset}\n"
else
    printf "${error}${red}Failed to extract files. Exiting...${reset}\n"
    exit 1
fi

}

download_x11_launcher() {
    printf "${info}${green}Downloading x11 startup script...${reset}\n"
    sleep 2
    cd $HOME
    wget -O startdesktop https://raw.githubusercontent.com/AndersonShelby/xfce4-conf/refs/heads/master/scripts/X11-launcher/startdesktop
    chmod +x startdesktop
}

main() {
    clear
    update_repository
    clear
    install_packages
    clear
    setup_directories
    clear
    installing_xfce4_conf
    clear
#   download_x11_launcher
    clear
    printf "${success} ${green}Setup completed!${reset}\n"
}

main

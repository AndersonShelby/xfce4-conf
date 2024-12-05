#!/bin/bash
#============================================================
# Script: XFCE4-Conf
# Author: ShelbyX⚡
# Purpose: Customize and configure XFCE4 in Termux.
# GitHub: https://github.com/AndersonShelby
# Date: 11/17/2024
#
# Description:
# This script automates the configuration of the XFCE4 graphical environment,
# offering an optimized and stylish visual experience.
# Created to facilitate installation and customization in Termux.
#
# Copyright:
# This project is open-source, created with dedication to make
# the experience in Termux more fluid and enjoyable.
#==============================================================

# Definindo as cores
black="\033[0;30m"
red="\033[0;31m"
bred="\033[1;31m"
green="\033[0;32m"
bgreen="\033[1;32m"
yellow="\033[0;33m"
byellow="\033[1;33m"
blue="\033[0;34m"
bblue="\033[1;34m"
purple="\033[0;35m"
bpurple="\033[1;35m"
cyan="\033[0;36m"
bcyan="\033[1;36m"
white="\033[0;37m"
nc="\033[00m"    # Cor padrão do terminal
reset="\033[0m"  # Reset de cores

# Definindo "snippets" de status
ask="${green}[${white}?${green}] ${yellow}"
success="${yellow}[${white}√${yellow}] ${green}"
error="${blue}[${white}!${blue}] ${red}"
info="${yellow}[${white}+${yellow}] ${cyan}"
info2="${green}[${white}•${green}] ${purple}"

clear # Limpar terminal

# Definição de funções
prepare_environment() {
    printf "${info}${green}Preparing environment...${reset}\n"
    cd $HOME
    [ -d "$HOME/backup" ] || mkdir -p "$HOME/backup"
    mv $HOME/.config $HOME/.icons $HOME/.local $HOME.themes $HOME/backup
}

install_packages() {
    printf "${info}${green}Installing required packages...${reset}\n"
    sleep 2
    
    # Atualiza pacotes e instala wget
    apt update && apt upgrade -y
    apt install -y wget

    # Remove lista antiga e adiciona a nova fonte de repositórios
    rm $PREFIX/etc/apt/sources.list.d/termux-desktop-xfce.list
    wget -P $PREFIX/etc/apt/sources.list.d https://raw.githubusercontent.com/Yisus7u7/termux-desktop-xfce/gh-pages/termux-desktop-xfce.list

    # Habilita repositórios necessários
    apt install -y x11-repo
    apt update

    # Instala XFCE4, Termux-X11 e pacotes adicionais
    apt install -y xfce4 xfce4-goodies termux-desktop-xfce breeze-cursor-theme kvantum \
        ttf-microsoft-cascadia audacious leafpad pavucontrol-qt hexchat geany synaptic \
        firefox termux-x11-nightly pulseaudio
}

installing_xfce4-conf() {
    printf "${info}${green}Installing xfce4-conf...${reset}\n"
    sleep 2
    cd $HOME
    wget https://github.com/AndersonShelby/xfce4-conf/releases/download/v1.0.2-Alpha-Genesis/XFCE4-Conf.v1.0.2-Alpha-Genesis.tar.gz

    printf "${info}${green}Unpacking dotfiles...${reset}\n"
    tar -xzf XFCE4-Conf.v1.0.2-Alpha-Genesis.tar.gz > /dev/null 2>&1
}

environment_setup() {
    cd $HOME
    mv $HOME/files/.config $HOME/files/.themes $HOME/files/.icons $HOME/files/.local $HOME/
    
}

terminal_conf() {
    printf "${info}${green}Replacing Zsh configuration...${reset}\n"

    # Move existing .oh-my-zsh and .zshrc to backup
    [ -d "$HOME/.oh-my-zsh" ] && mv "$HOME/.oh-my-zsh" "$HOME/backup/"
    [ -f "$HOME/.zshrc" ] && mv "$HOME/.zshrc" "$HOME/backup/"

    # Replace with new configuration
    [ -d "$HOME/files/.oh-my-zsh" ] && cp -r "$HOME/files/.oh-my-zsh" "$HOME/"
    [ -f "$HOME/files/.zshrc" ] && cp "$HOME/files/.zshrc" "$HOME/"

    printf "${info}${green}Zsh configuration replaced successfully!${reset}\n"
}

# Função principal
main() {
    # Iniciar funções
    clear # Limpar terminal
    install_packages

    clear
    prepare_environment

    clear
    installing_xfce4-conf

    clear
    environment_setup

    clear
    # Verificar resposta do usuário
    read -p "Do you want to replace the Zsh configuration? (Y/n): " response

    response=$(echo "$response" | tr '[:upper:]' '[:lower:]')

    if [[ "$response" == "y" || -z "$response" ]]; then
	    terminal_conf
    else
	    printf "${info}${green}Operation canceled.${reset}"
fi

    # Removendo files
    rm -rf $HOME/files

    printf "${info}${green}It looks like everything is ready, use ${blue}./startdesktop${green} to start the desktop.${reset}\n"

}

# Chamando a função principal
main

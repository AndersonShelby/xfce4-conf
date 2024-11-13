#!/data/data/com.termux/files/usr/bin/env bash

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

# Iniciando

cd $HOME
clear

printf "${info}${green}installing xfce4 and basic apps...${reset}\n"

sleep 2
apt update && apt upgrade -y
apt install -y wget
rm $PREFIX/etc/apt/sources.list.d/termux-desktop-xfce.list
wget -P $PREFIX/etc/apt/sources.list.d https://raw.githubusercontent.com/Yisus7u7/termux-desktop-xfce/gh-pages/termux-desktop-xfce.list
apt install -y x11-repo 
apt update
apt install -y xfce4 xfce4-goodies termux-desktop-xfce breeze-cursor-theme kvantum ttf-microsoft-cascadia audacious leafpad pavucontrol-qt hexchat geany synaptic 
apt install -y firefox

printf "${info}${green}Installing termux-x11 and additional packages...${reset}\n"
sleep 2
pkg update
pkg upgrade
pkg install x11-repo
pkg install termux-x11-nightly
pkg install tur-repo
pkg install pulseaudio
pkg install proot-distro
pkg install git

printf "${info}${green}boostrap data...${reset}\n"
sleep 2
rm -rf $HOME/.backup
mkdir $HOME/.backup
mv $HOME/.config $HOME/.backup
mv $HOME/.vnc $HOME/.backup
cd $HOME

printf "${info}${green}Downloading wallpapers and xstartup...${reset}\n"
sleep 2
wget https://github.com/Yisus7u7/termux-desktop-lxqt/releases/download/data/termux_desktop_lxqt_data.tar.xz
tar -xvf termux_desktop_lxqt_data.tar.xz
rm termux_desktop_lxqt_data.tar.xz
rm .vnc/xstartup
wget https://github.com/Yisus7u7/termux-desktop-xfce/releases/download/desktop-5.0.3/data.tar.xz
tar -xvf data.tar.xz
rm data.tar.xz

printf "${info}${green}setup folders...${reset}\n"

sleep 2
mkdir $HOME/Desktop 
mkdir $HOME/Downloads 
mkdir $HOME/Templates 
mkdir $HOME/Public 
mkdir $HOME/Documents 
mkdir $HOME/Pictures 
mkdir $HOME/Videos 
termux-setup-storage

ln -s $HOME/storage/music Music 

cd $HOME/Desktop
wget https://raw.githubusercontent.com/Yisus7u7/termux-desktop-xfce/main/welcome/LEAME.txt
wget https://raw.githubusercontent.com/Yisus7u7/termux-desktop-xfce/main/welcome/README.txt
rm LEAME.txt README.txt
cd $HOME

mv $PREFIX/share/kvantum/* $PREFIX/share/Kvantum

# Instalando a minhas configs
printf "${info}${green}Backing up current settings...${reset}\n"
printf "\n"
printf "${info}${red}WARNING: ${green}Your current configurations will be moved to ${blue}~/Backup.${reset}\n"
printf "${info}${green}If you have important settings, they will be saved there for future restoration.\n"
read -p "Press Enter to continue or Ctrl+C to cancel."

cd $HOME

# Diretório de destino para o backup
backup_dir="$HOME/Backup"

# Cria o diretório de backup se ele não existir
mkdir -p "$backup_dir"

# Lista de pastas a serem movidas
folders=("$HOME/.config" "$HOME/.icons" "$HOME/.themes" "$HOME/.local" "$HOME/.oh-my-zsh")

# Move cada pasta para o diretório de backup, caso ela exista
for folder in "${folders[@]}"; do
    if [ -d "$folder" ]; then
        printf "${info}${green}moving $folder to $backup_dir${reset}\n"
        mv "$folder" "$backup_dir"
    else
        printf "${error}${red}Warning: $folder does not exist.${reset}\n"
    fi
done

printf "${info}${green}Backup completed.${reset}\n"
sleep 3
clear

# Instalando config
printf "${info}${green}Installing configuration...${reset}\n"
cd $HOME

# instalando git, e clonando arquivos.
apt install git -y
git clone https://github.com/AndersonShelby/xfce4-conf.git

# Pasta .config
mv ~/xfce4-conf/dots/.config ~/.config
# Pasta icons
mv ~/xfce4-conf/dots/.icons ~/.icons
# pasta .themes
mv ~/xfce4-conf/dots/.themes ~/.themes
# pasta .oh-my-zsh
mv ~/xfce4-conf/dots/.oh-my-zsh ~/.oh-my-zsh
# pasta .local/.local-folder
mv ~/xfce4-conf/dots/.local-folder ~/.local
# arquivo .zshrc
mv ~/xfce4-conf/dots/.zshrc ~/.zshrc
# pasta rofi
mv ~/xfce4-conf/configs/rofi ~/.config/rofi

printf "${info}${green}Setup installation complete...${reset}\n"
sleep 3
clear

# configuração opcional
cd $HOME
printf "${info}${green}Additional configuration.${reset}\n"
printf "\n"

# Instalação opcional da configuração do Cava
read -p "Do you want to apply Cava configuration? (y/n): " install_cava
if [[ "$install_cava" == "y" ]]; then
    apt install cava -y
    mv ~/xfce4-conf/configs/cava ~/.config/cava
    printf "${info}${green}Cava configuration applied!${reset}"
fi

# Instalação opcional da configuração do Neofetch
read -p "Do you want to apply Neofetch configuration? (y/n): " install_neofetch
if [[ "$install_neofetch" == "y" ]]; then
    apt install neofetch -y
    mv ~/xfce4-conf/configs/neofetch ~/.config/neofetch
    echo "Configuração do Neofetch aplicada!"
fi

printf "\n"
sleep 4
clear

# Remover pasta xfce4-conf
cd $HOME
rm -rf $HOME/xfce4-conf

# Fim
printf "${info}${green}Apparently everything is ready!${reset}"

exit

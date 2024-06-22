#!/bin/bash

# Atualizar e instalar pacotes necessários no Termux
pkg update -y
pkg upgrade -y
pkg install proot-distro wget ncurses-utils -y

# Instalar Debian no proot
proot-distro install debian

# Ativar o wake lock do Termux
termux-wake-lock

# Entrar no ambiente Debian e executar o segundo script
proot-distro login debian --isolated -- bash -c "
  apt update -y && apt upgrade -y && apt install wget -y && cd /root/ &&
  wget https://raw.githubusercontent.com/Perzivall/Flutter-Web-Development-Environment-using-Android/main/auto_install_step_2.sh -O auto_install_step_2.sh &&
  chmod +x auto_install_step_2.sh && exit
"

echo "proot-distro login debian --isolated -- ./auto_install_step_2.sh" >> passo2.sh && chmod +X passo2.sh && ./passo2.sh

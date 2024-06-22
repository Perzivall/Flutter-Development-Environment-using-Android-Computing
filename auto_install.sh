#!bin/bash

pkg update -y 
pkg upgrade -y 
pkg install proot-distro wget ncurses-utils -y 
proot-distro install debian 
termux-wake-lock
proot-distro login debian --isolated -- sh -c "curl -fsSl https://raw.githubusercontent.com/Perzivall/Flutter-Web-Development-Environment-using-Android/main/auto_install_step_2.sh | sh"

echo "Instalação concluida!"

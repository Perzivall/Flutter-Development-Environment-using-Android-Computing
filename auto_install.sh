#!bin/bash

pkg update -y 
pkg upgrade -y 
pkg install proot-distro wget -y 
proot-distro install debian 
termux-wake-lock
proot-distro login debian -- wget https://raw.githubusercontent.com/Perzivall/Flutter-Web-Development-Environment-using-Android/main/auto_install_step_2.sh
proot-distro login debian -- chmod +x auto_install_step_2.sh
proot-distro login debian -- ./auto_install_step_2.sh

echo "Instalação concluida!"

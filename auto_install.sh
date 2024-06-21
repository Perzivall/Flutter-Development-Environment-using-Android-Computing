#!bin/bash

pkg update -y &&
pkg upgrade -y &&
pkg install proot-distro pkg-config openjdk-17 wget git vim curl-y &&
proot-distro install debian &&
termux-wake-lock && 
proot-distro login debian -- passwd ; wget https://github.com/Perzivall/Flutter-Web-Development-Environment-using-Android/blob/main/auto_install_step_2.sh ; ./auto_install_step_2.sh

echo "Instalação concluida!"

#!/bin/bash
clear
read -p 'Enter a user: ' YOUR_USER \n
read -p 'Enter a password: ' YOUR_PASSWORD
echo
echo "termux-wake-lock && proot-distro login debian --user $YOUR_USER -- bash -c './start.sh && /bin/bash'" >> start.sh
echo
echo 'WARNING!'
echo 'Whenever you want to start Enviroment, type ./start.sh'
echo
chmod +x start.sh

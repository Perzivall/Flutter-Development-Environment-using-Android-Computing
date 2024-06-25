#!/bin/bash
clear
echo ''
echo 'Now well create a start enviroment script'
echo
read -p 'Enter a user: ' YOUR_USER \n
read -p 'Enter a password: ' YOUR_PASSWORD
echo
echo "termux-wake-lock && proot-distro login debian --user $YOUR_USER -- bash -c './start.sh && /bin/bash'" >> start.sh
chmod +x start.sh
echo '-----------------------------------------------'
echo
echo 'REMEMBER!'
echo 'Whenever you want to start Enviroment, type ./start.sh'
echo
echo 'Installation complete!'
echo
echo '-----------------------------------------------'
rm auto_install_step_3.sh -fr


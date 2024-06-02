Flutter programming platform for use a android smartphone as server

Download and install Termux
Acess and download: https://github.com/termux/termux-app/releases/

Update termux
pkg update -y
pkg upgrade -y

Install PROOT
pkg install proot-distro -y
proot-distro install debian

Login in PROOT enviroment distro
proot-distro login debian
apt update -y && apt upgrade -y

Install code-server
curl -fsSL https://code-server.dev/install.sh | sh





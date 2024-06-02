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

CREATE START SCRIPT
```sh
ip_address=$(ifconfig | grep 'inet' | awk '{print $2}' | grep '192')
file_path="/root/.config/code-server/config.yaml"

if [ $ip_address == "192.0.0.8" ]; then
        echo "Não foi possivel obter IP, usando localhost"
        ip_address="127.0.0.1"
fi
                                                               
sed -i -E "s/^(bind-addr:).*/\1 $ip_address:8080/" "$file_path"
echo "-----------------------------------------"
echo "Ativando servidor"

nohup code-server & disown 

echo "Acesse o ip $ip_address:8080"
echo "-----------------------------------------"
```




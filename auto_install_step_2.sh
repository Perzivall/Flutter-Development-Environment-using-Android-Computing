#!/bin/bash 

#DADOS DO USUARIO
sleep 3
echo 'Agora vamos configurar seu usuario linux, e senha.'
echo
read 'Crie um novo usuario: ' YOUR_USER 
echo
read 'Digite uma senha: ' YOUR_PASSWORD 
echo
echo 'Remember this password!'
echo 'Will be use to acess VSCode Web Server'
sleep 5

apt install sudo unzip xz-utils zip libglu1-mesa pkg-config openjdk-17-jdk-headless wget git vim libc6:arm64 libncurses5:arm64 libstdc++6:arm64 libbz2-1.0:arm64 libgtk-3-dev liblzma-dev libstdc++-12-dev -y 



echo "$YOUR_USER   ALL=(ALL:ALL) ALL" | sudo tee -a /etc/sudoers
useradd -m -s /bin/bash $YOUR_USER && echo "$YOUR_USER:$YOUR_PASSWORD" | chpasswd && usermod -aG sudo $YOUR_USER

cd /home/$YOUR_USER
curl -fsSL https://code-server.dev/install.sh | sh
su - $YOUR_USER -c code-server &

wget https://github.com/Perzivall/Flutter-Server-Android-arm64/releases/download/34.0.4/start.sh
wget https://github.com/Perzivall/Flutter-Web-Development-Environment-using-Android/releases/download/34.0.4/configure_password.sh

chmod +x start.sh
chmod +x configure_password.sh

mkdir /home/$YOUR_USER/android-sdk
cd /home/$YOUR_USER/android-sdk
wget https://github.com/Perzivall/Flutter-Server-Android-arm64/releases/download/34.0.4/build-tools-34.0.4-aarch64.tar.xz 
wget https://github.com/Perzivall/Flutter-Server-Android-arm64/releases/download/34.0.4/platform-tools-34.0.4-aarch64.tar.xz 
wget https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip 
tar -xf build-tools-34.0.4-aarch64.tar.xz 
tar -xf platform-tools-34.0.4-aarch64.tar.xz 
unzip commandlinetools-linux-11076708_latest.zip 
cd cmdline-tools 
mkdir latest 
mv * latest 
cd /home/$YOUR_USER/android-sdk
git clone https://github.com/flutter/flutter.git
cd /home/$YOUR_USER/android-sdk/flutter/bin
./flutter doctor -v
echo 'export ANDROID_SDK_ROOT="$HOME/android-sdk/"' >> /home/$YOUR_USER/.bashrc
echo 'export ANDROID_HOME="$HOME/android-sdk/"' >> /home/$YOUR_USER/.bashrc
echo 'export PATH="$PATH:$HOME/android-sdk/build-tools/34.0.4"' >> /home/$YOUR_USER/.bashrc
echo 'export PATH="$PATH:$HOME/android-sdk/platform-tools"' >> /home/$YOUR_USER/.bashrc
echo 'export PATH="$PATH:$HOME/android-sdk/flutter/bin"' >> /home/$YOUR_USER/.bashrc
echo 'export PATH="$PATH:$HOME/android-sdk/cmdline-tools/latest/bin"' >> /home/$YOUR_USER/.bashrc
source ~/.bashrc
killall node
cd /home/$YOUR_USER/

# Caminho do arquivo de configuração
file_path="/home/$YOUR_USER/.config/code-server/config.yaml"

# Verificando se o arquivo de configuração existe
if [ ! -f "$file_path" ]; then
    echo "Arquivo de configuração não encontrado: $file_path"
    exit 1
fi

# Usando sed para substituir a linha que contém 'password:'
# Utilizando | como delimitador para evitar conflitos com caracteres da senha
sed -i -E "s|^(password:).*|\1 $YOUR_PASSWORD|" "$file_path"

su - $YOUR_USER -c ./start.sh

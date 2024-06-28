#!/bin/bash

# Configuração do usuário
clear
echo 'Agora vamos configurar seu usuário Linux e senha.'
echo
read -p 'Criar novo usuário: ' YOUR_USER 
echo
read -p 'Criar nova senha: ' -s YOUR_PASSWORD 
echo
echo 'Lembre-se desta senha!'
echo
echo 'Será usada para acessar o servidor VSCode Web.'
echo
sleep 5

# Atualização e instalação de pacotes
apt update && apt upgrade -y
apt install sudo unzip xz-utils zip curl net-tools pkg-config wget git vim box64 -y 

# Configuração do usuário sudo
echo "$YOUR_USER   ALL=(ALL:ALL) ALL" | sudo tee -a /etc/sudoers
useradd -m -s /bin/bash $YOUR_USER
echo "$YOUR_USER:$YOUR_PASSWORD" | chpasswd
usermod -aG sudo $YOUR_USER

# Instalação do code-server
su - $YOUR_USER -c "curl -fsSL https://code-server.dev/install.sh | sh"
su - $YOUR_USER -c "code-server &"

# Download dos scripts adicionais
cd /home/$YOUR_USER
wget https://raw.githubusercontent.com/Perzivall/Flutter-Web-Development-Environment-using-Android/main/start.sh
wget https://github.com/Perzivall/Flutter-Web-Development-Environment-using-Android/releases/download/34.0.4/configure_password.sh
chmod +x start.sh configure_password.sh

# Criação de diretórios e configuração do Android SDK
mkdir -p /home/$YOUR_USER/VSCodeProjects /home/$YOUR_USER/android-sdk/gradle
cd /home/$YOUR_USER/android-sdk
wget https://github.com/Perzivall/Flutter-Server-Android-arm64/releases/download/34.0.4/build-tools-34.0.4-aarch64.tar.xz 
wget https://github.com/Perzivall/Flutter-Server-Android-arm64/releases/download/34.0.4/platform-tools-34.0.4-aarch64.tar.xz 
wget https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip 
tar -xf build-tools-34.0.4-aarch64.tar.xz 
tar -xf platform-tools-34.0.4-aarch64.tar.xz 
unzip commandlinetools-linux-11076708_latest.zip 

# Organizando cmdline-tools
cd cmdline-tools 
mkdir latest 
mv * latest 

# Clonando o Flutter
cd /home/$YOUR_USER/android-sdk
git clone https://github.com/flutter/flutter.git

# Configuração do Flutter e variáveis de ambiente
cd /home/$YOUR_USER/android-sdk/flutter/bin
./flutter doctor -v
echo 'export GRADLE_HOME="$HOME/android-sdk/gradle"' >> /home/$YOUR_USER/.bashrc
echo 'export ANDROID_SDK_ROOT="$HOME/android-sdk/"' >> /home/$YOUR_USER/.bashrc
echo 'export ANDROID_HOME="$HOME/android-sdk/"' >> /home/$YOUR_USER/.bashrc
echo 'export PATH="$PATH:$HOME/android-sdk/build-tools/34.0.4"' >> /home/$YOUR_USER/.bashrc
echo 'export PATH="$PATH:$HOME/android-sdk/platform-tools"' >> /home/$YOUR_USER/.bashrc
echo 'export PATH="$PATH:$HOME/android-sdk/flutter/bin"' >> /home/$YOUR_USER/.bashrc
echo 'export PATH="$PATH:$HOME/android-sdk/cmdline-tools/latest/bin"' >> /home/$YOUR_USER/.bashrc
source /home/$YOUR_USER/.bashrc

# Aceitar licenças do SDK Android
su - $YOUR_USER -c "yes | /home/$YOUR_USER/android-sdk/cmdline-tools/latest/bin/sdkmanager --licenses"
killall node

# Precache do Flutter
cd /home/$YOUR_USER/
su - $YOUR_USER -c "/home/$YOUR_USER/android-sdk/flutter/bin/flutter precache -a"

# Configuração de gen_snapshot para diferentes arquiteturas
for arch in android-arm64-release android-arm-release android-arm64-profile android-arm-profile android-x64-release android-x86-jit-release android-x64-profile; do
    cd /home/$YOUR_USER/android-sdk/flutter/bin/cache/artifacts/engine/$arch/
    cp -r linux-x64/ linux-arm64/
    cd linux-arm64
    mv gen_snapshot gen_snapshot_
    echo "/usr/bin/box64 /home/$YOUR_USER/android-sdk/flutter/bin/cache/artifacts/engine/$arch/linux-arm64/gen_snapshot_ \"\$@\"" > gen_snapshot
    chmod +x gen_snapshot
done

# Configuração do arquivo de configuração do code-server
file_path="/home/$YOUR_USER/.config/code-server/config.yaml"

# Verificando se o arquivo de configuração existe
if [ ! -f "$file_path" ]; then
    echo "Arquivo de configuração não encontrado: $file_path"
    exit 1
fi

# Usando sed para substituir a linha que contém 'password:'
sed -i -E "s|^(password:).*|\1 $YOUR_PASSWORD|" "$file_path"

# Instalação de extensões do VSCode
su - $YOUR_USER -c "code-server --install-extension spacebox.monospace-idx-theme"
su - $YOUR_USER -c "code-server --install-extension dart-code.dart-code"
su - $YOUR_USER -c "code-server --install-extension dart-code.flutter"

# Configuração de preferências do VSCode
su - $YOUR_USER -c "echo '{
    \"workbench.colorTheme\": \"Monospace IDX Dark\",
    \"workbench.iconTheme\": \"monospace-idx-file-icon-theme\"
}' >> /home/$YOUR_USER/.local/share/code-server/User/settings.json"

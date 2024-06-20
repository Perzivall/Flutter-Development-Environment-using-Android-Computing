Flutter programming platform for use a android smartphone as server

Download and install Termux
Acess and download: https://github.com/termux/termux-app/releases/

Update termux
```
pkg update -y
pkg upgrade -y
```

Install PROOT
```
pkg install proot-distro -y
proot-distro install debian
```

Login in PROOT enviroment distro
```
proot-distro login debian --
```

Update Packages Debian
```
apt update -y && apt upgrade -y && apt install wget git sudo openjdk-17-jdk-headless sudo vim curl git unzip xz-utils zip libglu1-mesa libc6:arm64 libncurses5:arm64 libstdc++6:arm64 libbz2-1.0:arm64 -y
```

Add new user in VISUDO
```
visudo

```

Then Insert in 
#User privilege specification
```
USUARIO ALL=(ALL:ALL) ALL
```

Create user
```
useradd -m -s /bin/bash USUARIO && echo "USUARIO:SENHA" | chpasswd && usermod -aG sudo USUARIO

```

Access the new USUARIO
```
su USUARIO
```

Install code-server
```
curl -fsSL https://code-server.dev/install.sh | sh
```

CREATE START SCRIPT NAMED "start.sh"
```
#!/bin/bash

# Obtendo o endereço IP
ip_address=$(ifconfig | grep 'inet ' | awk '{print $2}' | grep '192' | head -n 1)

# Caminho do arquivo de configuração
file_path="/home/$(whoami)/.config/code-server/config.yaml"

# Verificando se a variável ip_address está vazia
if [ -z "$ip_address" ]; then
    echo "Não foi possível obter IP, usando localhost"
    ip_address="127.0.0.1"
fi

# Usando sed para substituir tudo após o ':' em linhas que contêm 'bind-addr'
# Utilizando | como delimitador para evitar conflitos com caracteres IP
sed -i -E "s|^(bind-addr:).*|\1 $ip_address:8080|" "$file_path"

# Mensagem de ativação do servidor
echo "-----------------------------------------"
echo "Ativando servidor"

# Iniciando o code-server em segundo plano e desanexando do terminal
nohup code-server & disown
                  
# Informando o IP de acesso
echo "Acesse o IP http://$ip_address:8080"
echo "-----------------------------------------"
```

SET PERMISSIONS TO EXECUTE SCRIPT
```
chmod +x start.sh
```

START SCRIPT 
```
./start.sh
```

Now acess the IP address showing in terminal in our Browser
example: http://192.168.1.105:8080

Create directory in /home/YOUR_USER/
```
mkdir /home/$(whoami)/android-sdk
cd /home/$(whoami)/android-sdk
wget https://github.com/Perzivall/Flutter-Server-Android-arm64/releases/download/34.0.4/build-tools-34.0.4-aarch64.tar.xz &&
wget https://github.com/Perzivall/Flutter-Server-Android-arm64/releases/download/34.0.4/platform-tools-34.0.4-aarch64.tar.xz &&
tar -xf build-tools-34.0.4-aarch64.tar.xz &&
tar -xf platform-tools-34.0.4-aarch64.tar.xz
```

Adicione variaveis ao PATH 
```
echo 'export ANDROID_SDK_ROOT="$HOME/android-sdk/"' >> ~/.bashrc
echo 'export ANDROID_HOME="$HOME/android-sdk/"' >> ~/.bashrc
echo 'export PATH="$PATH:$HOME/android-sdk/build-tools/34.0.4"' >> ~/.bashrc
echo 'export PATH="$PATH:$HOME/android-sdk/platform-tools"' >> ~/.bashrc
echo 'export PATH="$PATH:$HOME/android-sdk/flutter/bin"' >> ~/.bashrc
```

IN YOUR BROWSER, OPEN THE VSCODE SERVER IP ON THE PORT 8080, THEN FOLLOW THIS STEPS
```
1. Install the flutter extension on VSCode
2. Click on the command vscode and write "Flutter: New Project"
3. Click on the bottom side popup "Download SDK" and select folder "/home/YOUR_USER/android-sdk/"
4. Wait the donwload complete, then create new Flutter project
```

# TIPS
     For connect and run apps android on the device
    If Android +11
    Open the debugger settings on the device, find wireless debugging and find Pair device with pairing code
    
    ```
    adb pair IP_ADDRESS:PORT
    ```
    Then digit the code pairing

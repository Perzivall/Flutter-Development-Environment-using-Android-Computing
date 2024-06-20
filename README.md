Flutter programming platform for use a android smartphone as server

# Termux configuration

1. Download and install Termux
    - In your android browser
    - Acess and download: https://github.com/termux/termux-app/releases/

2. Open Termux and update
    ```
    pkg update -y &&
    pkg upgrade -y
    ```

3. Install Proot
    ```
    pkg install proot-distro -y &&
    proot-distro install debian
    ```

# Proot configuration

1. Login in PROOT enviroment distro
    ```
    proot-distro login debian
    ```

2. Change root password
    ```
    passwd
    ```

3. Update Packages Debian
    ```
    apt update -y && apt upgrade -y && apt install wget git sudo openjdk-17-jdk-headless sudo vim curl git unzip xz-utils zip libglu1-mesa libc6:arm64 libncurses5:arm64 libstdc++6:arm64 libbz2-1.0:arm64 clang cmake git ninja-build pkg-config libgtk-3-dev liblzma-dev libstdc++-12-dev -y
    ```

4. Add new user in VISUDO
    ```
    visudo
    ```
   > Then Insert in the following line in
   > #User privilege specification

    ```
    YOUR_USER ALL=(ALL:ALL) ALL
    ```

5. Create user
    ```
    useradd -m -s /bin/bash YOUR_USER && echo "YOUR_USER:YOUR_PASSWORD" | chpasswd && usermod -aG sudo YOUR_USER

    ```

6. Access the new YOUR_USER
    ```
    su YOUR_USER
    ```

7. Acess the YOUR_USER path home
    ```
    cd $HOME
    ```

8. Install code-server
    ```
    curl -fsSL https://code-server.dev/install.sh | sh
    ```

9. CREATE START SCRIPT AND NAMED AS "start.sh"
    
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

10. Set execution permissions
    ```
    chmod +x start.sh
    ```

11. Start script 
    ```
    ./start.sh
    ```

# Acess VSCode in a Browser computer

    Now you have to able to access the IP address showing in terminal in our Browser, it's showing ip in the termux cli
    example: http://192.168.1.105:8080

1. Open the terminal-cli in VSCode and
    ```
    mkdir /home/$(whoami)/android-sdk
    cd /home/$(whoami)/android-sdk
    wget https://github.com/Perzivall/Flutter-Server-Android-arm64/releases/download/34.0.4/build-tools-34.0.4-aarch64.tar.xz &&
    wget https://github.com/Perzivall/Flutter-Server-Android-arm64/releases/download/34.0.4/platform-tools-34.0.4-aarch64.tar.xz &&
    wget https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip &&
    tar -xf build-tools-34.0.4-aarch64.tar.xz &&
    tar -xf platform-tools-34.0.4-aarch64.tar.xz &&
    unzip commandlinetools-linux-11076708_latest.zip &&
    cd cmdline-tools &&
    mkdir latest &&
    mv * latest
    ```

2. Add variables in the $PATH 
    ```
    echo 'export ANDROID_SDK_ROOT="$HOME/android-sdk/"' >> ~/.bashrc
    echo 'export ANDROID_HOME="$HOME/android-sdk/"' >> ~/.bashrc
    echo 'export PATH="$PATH:$HOME/android-sdk/build-tools/34.0.4"' >> ~/.bashrc
    echo 'export PATH="$PATH:$HOME/android-sdk/platform-tools"' >> ~/.bashrc
    echo 'export PATH="$PATH:$HOME/android-sdk/flutter/bin"' >> ~/.bashrc
    echo 'export PATH="$PATH:$HOME/android-sdk/cmdline-tools/latest/bin"' >> ~/.bashrc
    source ~/.bashrc
    ```

3. IN YOUR BROWSER, OPEN THE VSCODE SERVER IP ON THE PORT 8080, THEN FOLLOW THIS STEPS

    ```
    1. Install the flutter extension on VSCode
    2. Click on the command-pallet in vscode and write "Flutter: New Project"
    3. Click on the bottom side popup "Download SDK" and select folder "/home/YOUR_USER/android-sdk/"
    4. Wait the download is complete, then try create new Flutter project
    ```

# TIPS
You can connect and debugging apps direcly in this device

1. If android +11 OS
    Open the debugger settings on the device, find wireless debugging and find Pair device with pairing code
   ```    
   adb pair IP_ADDRESS:PORT
   ```
   > Then digit the code pairing, and
   ```
   adb connect IP_ADDRESS:PORT
   ```

# For disabling PID Exited with signal 9, connect adb device in the termux device
```
adb shell "/system/bin/device_config set_sync_disabled_for_tests persistent"
adb shell "/system/bin/device_config put activity_manager max_phantom_processes 2147483647"
```
> Opcional
```
adb shell settings put global settings_enable_monitor_phantom_procs false
```



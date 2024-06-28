![Nota](https://img.shields.io/badge/ANDROID-SHELL-green) ![Nota](https://img.shields.io/badge/ANDROID-FLUTTER-blue) ![Nota](https://img.shields.io/badge/PERFORMANCE-NATIVE-orange)
# Flutter Web Development Environment using Android. 

> Use Your smartphone processing to development flutter apps. Enviroment with native performance! Won't used virtualzations

> Made by Perzivall in Brazil 🇧🇷

> with love, Perzivall 👨‍💻

> Acess JW.ORG ❤️
```
Que as pessoas saibam que tu, cujo nome é Jeová, Somente tu és o Altíssimo sobre toda a terra.
```
```
May people know that you, whose name is Jehovah, You alone are the Most High over all the earth.
```

# ☕ Help me to buy a coffe
- Thank'you for yours contribuitions
- https://ko-fi.com/perzivall

# 📍 Easy Install
![Nota](https://img.shields.io/badge/MAIN-INSTALL-orange) ![Nota](https://img.shields.io/badge/EASY-INSTALL-green) ![Nota](https://img.shields.io/badge/CLEAN-INSTALL-blue)

If do you want, can use a easy install script

1. Download and install Termux
    > In your android browser, 
    > acess and download: https://github.com/termux/termux-app/releases/
      
2. In Termux Command-Line, type
   
   ```
    termux-wake-lock && curl -fsSl https://raw.githubusercontent.com/Perzivall/Flutter-Web-Development-Environment-using-Android/main/auto_install.sh | sh && proot-distro login ubuntu -- sh -c "./auto_install_step_2.sh" && (curl -fsSl -o auto_install_step_3.sh https://raw.githubusercontent.com/Perzivall/Flutter-Web-Development-Environment-using-Android/main/auto_install_step_3.sh &&  chmod +x auto_install_step_3.sh && ./auto_install_step_3.sh)
   ```
   >
   > Then skip to this [step](https://github.com/Perzivall/Flutter-Web-Development-Environment-using-Android#-acess-vscode-in-a-browser-computer)

# 📟 Termux configuration
![Nota](https://img.shields.io/badge/ADVANCED-INSTALL-black) ![Nota](https://img.shields.io/badge/OUTDATED-FUNCIONAL-purple)


1. Download and install Termux
    - In your android browser
    - Acess and download: https://github.com/termux/termux-app/releases/
    - Recomended [Click to download](https://github.com/termux/termux-app/releases/download/v0.118.1/termux-app_v0.118.1+github-debug_arm64-v8a.apk)
    
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

4. Activate Wake-Lock 
   ```
   termux-wake-lock
   ```
   > This command can be used to trigger a wakelock which causes Android not to go into deep sleep.Use this command always when open the termux

# 🫚 Proot configuration

1. Login in Proot enviroment distro
    ```
    proot-distro login debian
    ```

2. Change root password
    ```
    passwd
    ```

3. Update Packages Debian
    ```
    apt update -y && apt upgrade -y && apt install sudo unzip xz-utils zip curl net-tools pkg-config openjdk-17-jdk-headless wget git vim -y
    ```

4. Add new user in sudoers file
    ```
    visudo
    ```
   > Then Insert in the following line in
    >
   >  #User privilege specification

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

9. Download start script web-server enviroment
    
    ```
    wget https://github.com/Perzivall/Flutter-Server-Android-arm64/releases/download/34.0.4/start.sh
    wget https://github.com/Perzivall/Flutter-Web-Development-Environment-using-Android/releases/download/34.0.4/configure_password.sh
    ```

10. Set execution permissions and create first password to acess the Web Enviroment
    ```
    chmod +x start.sh
    chmod +x configure_password.sh &&
    ./configure_password.sh
    ```

11. Install Android SDK tools
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
    mv * latest &&
    cd $HOME
    ```

12. Add variables in the $PATH 
    ```
    echo 'export ANDROID_SDK_ROOT="$HOME/android-sdk/"' >> ~/.bashrc
    echo 'export ANDROID_HOME="$HOME/android-sdk/"' >> ~/.bashrc
    echo 'export PATH="$PATH:$HOME/android-sdk/build-tools/34.0.4"' >> ~/.bashrc
    echo 'export PATH="$PATH:$HOME/android-sdk/platform-tools"' >> ~/.bashrc
    echo 'export PATH="$PATH:$HOME/android-sdk/flutter/bin"' >> ~/.bashrc
    echo 'export PATH="$PATH:$HOME/android-sdk/cmdline-tools/latest/bin"' >> ~/.bashrc
    source ~/.bashrc
    ```

13. For Start enviroment 
    ```
    ./start.sh
    ```
14. For Stop enviroment
    ```
    killall node
    ```

# 💻 Acess VSCode in a Browser computer 
> Now you have to able to access the IP address showing in terminal in our Browser, it's showing ip in the termux cli
>
>    example: http://192.168.1.105:8080

> [!Warning]
>    The smartphone and computer must be on the same network.
>     
>    The computer can use a wired connection, but they must have IPs in the same range
    


    ```
    1. Install the flutter extension on VSCode
    2. Click on the command-pallet in vscode and write  " > Flutter: New Project "
    3. Click on the bottom side popup "Download SDK" and select folder "/home/YOUR_USER/android-sdk/"
    4. Wait paciently to download is complete, then try create new Flutter project
    ```

2. Create a new project Flutter

# 🧑‍🍳 After create Flutter Project
> [!Warning]
> For flutter compile correcly android apps, follow this steps

1. Open the file Android > gradle.properties and add this line in final of file
   ```
   android.aapt2FromMavenOverride=/home/$USER/android-sdk/build-tools/34.0.4/aapt2
   ```
2. Open the Android > app > build.gradle and add configure buildToolsVersion to 34.0.4
   ```
    buildToolsVersion = "34.0.4"
   ```
   Example
   ```
       defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.example.flutter_application_1"
        // You can update the following values to match your application needs.
        // For more information, see: https://docs.flutter.dev/deployment/android#reviewing-the-gradle-build-configuration.
        minSdk = flutter.minSdkVersion

        // ADD THIS LINE
        buildToolsVersion = "34.0.4" 

        targetSdk = flutter.targetSdkVersion
        versionCode = flutterVersionCode.toInteger()
        versionName = flutterVersionName
    }
   ```

4. In the first run, do you need to accept the sdkmanager licenses. Open the terminal and
   ```
   sdkmanager --licenses
   ```

# 📲 Use your smartphone to run compiled apps
You can connect and debugging apps direcly in this device

1. If android smartphone version >= Android 11

    > Open the debugger settings on the device, find wireless debugging and find Pair device with pairing code
   ```    
   adb pair 127.0.0.1:PORT (this "PORT" is specifiqued in > Developer option > Wireless Debugging > Pair with code)
   ```
   > Then, digit the code pairing. After, type
   ```
   adb connect 127.0.0.1:PORT
   ```

2. If android smartphone version =< Android 10
   > With your android phone debugging active, connect your phone in a computer, download adb windows tools and
   ```
    adb tcpip 5555
   ```
   > In your VSCode Web terminal, type
   ```
   adb connect 127.0.0.1:5555
   ```
   
   > For connect your smartphone in VSCode enviroment, use always this adb connect command
   > 
   > The adb tcpip command only needs to be run once
   >
   > This command ```adb reconnect offline``` can'be util
    

# ⚠️ For disabling PID Exited with signal 9
> [!Warning]
> In someone devices, the termux crashes with code "PID Exited with signal 9"
> Execute this command to solve

1. In your VSCode Web browser, open the terminal, connect your device via adb and type
    ```
    adb shell "/system/bin/device_config set_sync_disabled_for_tests persistent"
    adb shell "/system/bin/device_config put activity_manager max_phantom_processes 2147483647"
    ```
    > Optional
    ```
    adb shell settings put global settings_enable_monitor_phantom_procs false
    ```

# 🤖 Know Issues

1. Compilation

   - [x] Works only in debug mode (resolved)

   - [x] Working to use release and profile (resolved)

# 🤗 Acknowledgments
1. First of all
   > My god Jehova for give my life ♥
   > 
   > My wife Josiara for all her love ♥
   > 
   > My Daughtter Manuella ♥ 
   
2.  lzhiyong for compile build-tools and sdk for architecture arm64
    > https://github.com/lzhiyong/android-sdk-tools



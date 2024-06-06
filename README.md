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
apt update -y && apt upgrade -y
```

Create user
```
useradd -m -s /bin/bash USUARIO && echo "USUARIO:SENHA" | chpasswd && usermod -aG sudo USUARIO

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

START AND STOP CODE SERVER TO CREATE INITIAL FILES
```
code-server
```
AWAIT 10 SECONDS AND STOP SERVICE
```
code-server stop
```

EDIT CONFIG FILE SERVER AND SAVE

auth: none
```
nano /root/.config/code-server/config.yaml
```


START SCRIPT 
```
./start.sh
```
Now acess the IP address showing in terminal in our Browser
example: http://192.168.1.105:8080




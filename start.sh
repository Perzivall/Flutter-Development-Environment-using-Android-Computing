#!/bin/bash
                                                        # Obtendo o endereço IP
ip_address=$(ifconfig | grep 'inet ' | awk '{print $2}' | grep '192' | head -n 1)
                                                                                 # Caminho do arquivo de configuração
file_path="/home/$(whoami)/.config/code-server/config.yaml"                                                                                                             clear
# Verificando se a variável ip_address está vazia
if [ -z "$ip_address" ]; then
    echo "Não foi possível obter IP, usando localhost"
    ip_address="127.0.0.1"
fi                                                      
# Usando sed para substituir tudo após o ':' em linhas que contêm 'bind-addr'
# Utilizando | como delimitador para evitar conflitos com caracteres IP
sed -i -E "s|^(bind-addr:).*|\1 $ip_address:8080|" "$file_path"
echo                                                    echo "Ativando servidor..."
echo
nohup code-server > lastLog.txt 2>&1 & disown

# Informando o IP de acesso
echo "-----------------------------------------"
echo "Now access in your browser http://$ip_address:8080"
echo "-----------------------------------------"
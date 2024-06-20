#!/bin/bash

# Caminho do arquivo de configuração
file_path="/home/$(whoami)/.config/code-server/config.yaml"

# Solicitando a senha do usuário
read -sp "Digite a nova senha: " new_password
echo

# Verificando se o arquivo de configuração existe
if [ ! -f "$file_path" ]; then
    echo "Arquivo de configuração não encontrado: $file_path"
    exit 1
fi

# Usando sed para substituir a linha que contém 'password:'
# Utilizando | como delimitador para evitar conflitos com caracteres da senha
sed -i -E "s|^(password:).*|\1 $new_password|" "$file_path"

# Confirmando a alteração
echo "Senha alterada com sucesso no arquivo de configuração."

#Script for discovery IP Address and configure
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

#!/bin/bash

# Atualizar o arquivo de conexão para apontar para o container do banco de dados
CONEXAO_FILE="/opt/mk-auth/include/conexao.php"

if [ -f "$CONEXAO_FILE" ]; then
    echo "Configurando conexão com o banco de dados em $DB_HOST..."
    sed -i "s/127.0.0.1/$DB_HOST/g" "$CONEXAO_FILE"
    sed -i "s/localhost/$DB_HOST/g" "$CONEXAO_FILE"
fi

# Atualizar o arquivo de conexão para apontar para o container do banco de dados
CONEXAO_FILE="/opt/mk-auth/include/conexao.php"

if [ -f "$CONEXAO_FILE" ]; then
    echo "Configurando conexão com o banco de dados em $DB_HOST..."
    sed -i "s/127.0.0.1/$DB_HOST/g" "$CONEXAO_FILE"
    sed -i "s/localhost/$DB_HOST/g" "$CONEXAO_FILE"
fi

# Apontar RADIUS para o container do banco de dados
SQL_MOD="/etc/freeradius/3.0/mods-available/sql"
if [ -f "$SQL_MOD" ]; then
    echo "Configurando conexão SQL do RADIUS..."
    sed -i "s/server = \"localhost\"/server = \"$DB_HOST\"/g" "$SQL_MOD"
    sed -i "s/server = 'localhost'/server = '$DB_HOST'/g" "$SQL_MOD"
    chown -R freerad:freerad /etc/freeradius/3.0/
fi

# Iniciar os pools do PHP-FPM do MK-Auth
mkdir -p /run
echo "Iniciando FPM Pools..."
for pool in admin central api boleto publico retorno; do
    if [ -f "/opt/mk-auth/hhvm/8-0-30/bin/php-fpm" ]; then
        /opt/mk-auth/hhvm/8-0-30/bin/php-fpm -y /usr/local/etc/php/php-${pool}.conf &
    fi
done

# Iniciar o Apache em background
echo "Iniciando Apache..."
service apache2 start

# Iniciar o FreeRADIUS
echo "Iniciando FreeRADIUS..."
freeradius -X &

# Manter o container rodando
tail -f /var/log/apache2/access.log /var/log/apache2/error.log

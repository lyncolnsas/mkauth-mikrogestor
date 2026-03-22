# Usar Debian 11 (Bullseye) para melhor suporte a repositórios
FROM debian:bullseye

# Evitar prompts interativos
ENV DEBIAN_FRONTEND=noninteractive

# Instalar dependências (No Bullseye, o PHP padrão é o 7.4)
RUN apt-get update && apt-get install -y \
    apache2 \
    php \
    php-mysql \
    php-gd \
    php-curl \
    php-xml \
    php-mbstring \
    php-bcmath \
    php7.4-sqlite3 \
    libapache2-mod-php \
    mariadb-client \
    freeradius \
    freeradius-mysql \
    net-tools \
    procps \
    curl \
    tar \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Ativar módulos do Apache
RUN a2enmod rewrite headers proxy proxy_http proxy_fcgi ssl expires deflate

# Preparar diretórios
RUN mkdir -p /opt/mk-auth /var/www/html

# Copiar o arquivo da aplicação (agora de forma direta para otimização do repositório)
COPY remote-files/opt/mk-auth/ /opt/mk-auth/
COPY remote-files/var/www/ /var/www/

# Copiar configurações específicas
COPY clean-apache.conf /etc/apache2/sites-available/000-default.conf
COPY remote-files/etc/ /etc/
COPY remote-files/usr/local/etc/php/ /usr/local/etc/php/

# Criar links simbólicos para a lógica do hotsite (como no sistema original)
RUN a2ensite 000-default.conf && \
    for f in /opt/mk-auth/hotsite/*.hhvm; do ln -s "$f" "/var/www/$(basename "$f")"; done

# Ajustar permissões
RUN chown -R www-data:www-data /opt/mk-auth /var/www

# Configurar o entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Expor portas (Web e RADIUS)
EXPOSE 80 443 1812/udp 1813/udp

ENTRYPOINT ["/entrypoint.sh"]

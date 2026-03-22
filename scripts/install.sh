#!/bin/bash
# --- MK-AUTH MIKROGESTOR AUTOMATIC INSTALLER (UBUNTU SERVER) ---
set -e

# Cores para o output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}================================================================${NC}"
echo -e "${GREEN}    MK-AUTH MIKROGESTOR - INSTALADOR AUTOMÁTICO (DOCKER)      ${NC}"
echo -e "${BLUE}================================================================${NC}"

# 1. Verificar privilégios de root
if [ "$EUID" -ne 0 ]; then 
  echo -e "${RED}[ERR!] Por favor, execute como root (sudo).${NC}"
  exit 1
fi

# 2. Atualizar o sistema
echo -e "${BLUE}[1/5] Atualizando repositórios do Ubuntu...${NC}"
apt-get update -y && apt-get upgrade -y

# 3. Instalar dependências básicas
echo -e "${BLUE}[2/5] Instalando dependências (curl, git, gnupg)...${NC}"
apt-get install -y curl git gnupg2 ca-certificates lsb-release

# 4. Instalar Docker e Docker Compose se necessário
if ! command -v docker &> /dev/null; then
    echo -e "${BLUE}[3/5] Docker não encontrado. Instalando motor Docker...${NC}"
    curl -fsSL https://get.docker.com | sh
    systemctl enable docker
    systemctl start docker
    echo -e "${GREEN}[OK] Docker instalado com sucesso.${NC}"
else
    echo -e "${GREEN}[INFO] Docker já está instalado.${NC}"
fi

if ! command -v docker-compose &> /dev/null; then
    echo -e "${BLUE}[3.1/5] Instalando Docker Compose...${NC}"
    apt-get install -y docker-compose
    echo -e "${GREEN}[OK] Docker Compose instalado.${NC}"
fi

# 5. Configuração de Rede (Desabilitar Apache do Host se houver)
if systemctl is-active --quiet apache2; then
    echo -e "${RED}[AVISO] Apache rodando no host. Parando para evitar conflito na porta 80...${NC}"
    systemctl stop apache2
    systemctl disable apache2
fi

# 6. Preparar pastas e permissões
echo -e "${BLUE}[4/5] Configurando ambiente de containers...${NC}"
chown -R www-data:www-data remote-files/ 2>/dev/null || true
chmod +x entrypoint.sh scripts/*.sh

# 7. Subir o sistema com Docker Compose
echo -e "${BLUE}[5/5] Construindo e iniciando containers (Isso pode demorar alguns minutos)...${NC}"
docker-compose up -d --build

# 8. Verificação final
echo -e "${BLUE}================================================================${NC}"
echo -e "${GREEN}    INSTALAÇÃO CONCLUÍDA COM SUCESSO!        ${NC}"
echo -e "${BLUE}================================================================${NC}"
echo -e "Acesse o sistema em: http://seu-ip/"
echo -e "Acesse o painel administrativo em: http://seu-ip/admin/"
echo -e "${BLUE}----------------------------------------------------------------${NC}"
docker ps

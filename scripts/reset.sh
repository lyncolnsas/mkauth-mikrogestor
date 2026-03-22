#!/bin/bash
# --- MK-AUTH MIKROGESTOR RESET SCRIPT (CLEAN REINSTALL) ---
set -e

# Cores para o output
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${RED}================================================================${NC}"
echo -e "         ATENÇÃO: VOCÊ ESTÁ RESETANDO O SISTEMA!              "
echo -e "      ISSOR IRÁ LIMPAR CONTAINERS E DADOS TEMPORÁRIOS!        "
echo -e "================================================================${NC}"

# 1. Parar containers e remover volumes
echo -e "${RED}[1/3] Parando containers e apagando volumes do banco...${NC}"
docker-compose down -v --remove-orphans

# 2. Limpar logs e temporários locales
echo -e "${RED}[2/3] Limpando logs locais...${NC}"
rm -rf backups/*.log 2>/dev/null || true

# 3. Remover a imagem do app para forçar reconstrução
echo -e "${RED}[3/3] Removendo imagem antiga do aplicativo...${NC}"
docker rmi mkauth-mikrogestor-app:latest 2>/dev/null || true

echo -e "${RED}================================================================${NC}"
echo -e "  RESET COMPLETO. VOCÊ PODE EXECUTAR O install.sh AGORA.       "
echo -e "================================================================${NC}"

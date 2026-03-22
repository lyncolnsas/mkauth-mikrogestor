# Guia de Replicação: Mk-Auth (10.11.84.169)

Este guia explica como utilizar os arquivos baixados na pasta `remote-files` para reproduzir o sistema em uma nova máquina (recomendado: VM com Debian 10 Buster).

## 1. Estrutura dos Arquivos
- `remote-files/database/mkradius.sql`: Backup completo do banco de dados MariaDB.
- `remote-files/opt/mk-auth/mkauth_core.tar.gz`: Core da aplicação (excluindo logs e caches).
- `remote-files/etc/apache2/`: Arquivos de configuração dos sites no Apache.

## 2. Requisitos de Ambiente
- **OS**: Debian 10 Buster (Limpo).
- **RAM**: 4GB+.
- **Disco**: 40GB+.

## 3. Método 1: Restauração Manual (Nativo)
# ... (conteúdo anterior mantido) ...

## 4. Método 2: Usar Docker (Recomendado)
Para facilitar a reprodução, preparei um ambiente Docker completo.

### Requisitos
- Docker Desktop instalado e em execução.

### Passos para Rodar
1. Abra o terminal na pasta `mkauth-mikrogestor`.
2. Execute o comando para subir o ambiente:
   ```powershell
   docker-compose up -d --build
   ```
3. Aguarde o banco de dados inicializar e o Apache subir.
4. Acesse via browser em `http://localhost`.

### Arquivos Docker
- `Dockerfile`: Configura o Debian 10 e instala as dependências.
- `docker-compose.yml`: Orquestra os containers de App e Banco de Dados.
- `entrypoint.sh`: Configura a conexão do banco automaticamente.

## 5. Observações Importantes
- **Radius**: O RADIUS do Docker está configurado para ouvir nas portas 1812/1813 UDP do seu localhost.
- **Banco de Dados**: O container do banco (`mkauth-db`) inicializa automaticamente com o dump `mkradius.sql`.
- **Radius**: O arquivo `/opt/mk-auth/include/conexao.php` indica que o RADIUS deve ser atualizado em `/etc/freeradius/3.0/mods-enabled/sql`.
- **HHVM**: O original tinha diretórios `hhvm/`, mas não estava ativo. Considere usar PHP 7.3 padrão.

---
*Cópia realizada em 20/03/2026.*

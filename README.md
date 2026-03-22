# MK-Auth Mikrogestor (Dockerized) 🚀

![MK-Auth Version](https://img.shields.io/badge/MK--Auth-25.05-blue)
![Architecture](https://img.shields.io/badge/Architecture-Docker--based-green)
![OS](https://img.shields.io/badge/OS-Ubuntu--Server-orange)

Projeto de modernização e conteinerização do sistema **MK-Auth**, focado em facilidade de implantação, restauração de hotsites legados e interface administrativa futurista.

## ✨ Recursos

*   **Docker Ready**: Sistema completo rodando em containers isolados (App + Banco).
*   **Motor HHVM Stático**: PHP 8.0 customizado e estático (original MK-Auth) integrado para máxima performance e segurança.
*   **FreeRADIUS Integrado**: Servidor de autenticação Radius 3.0 configurado com persistência SQL.
*   **Hotsite Restaurado**: Recuperação completa do layout original e suporte ao motor `.hhvm`.
*   **Gestor Visual Futurista**: Tema administrativo customizado (Glassmorphism + Neon) para um visual de ponta.
*   **Licença Ilimitada**: Versão configurada para usuários e funcionalidades ilimitadas.

## 🏗️ Estrutura do Projeto

```text
/mkauth-mikrogestor
├── Dockerfile              # Imagem Linux com motor PHP HHVM
├── docker-compose.yml       # Orquestração do App e MySQL
├── entrypoint.sh            # Script de inicialização e auto-configuração
├── clean-apache.conf        # Configurações de Alias e FPM Sockets
├── remote-files/            # Pasta com a lógica do sistema (HHVM, PHP, Layout)
├── scripts/
│   ├── install.sh           # Instalador automático para Ubuntu Server
│   └── reset.sh             # Script de limpeza profunda para reinalação
└── README.md
```

## 🚀 Como Instalar (Ubuntu Server)

1.  Clone este repositório no seu servidor.
2.  Dê permissão de execução ao instalador:
    ```bash
    chmod +x scripts/install.sh
    ```
3.  Execute o instalador:
    ```bash
    sudo ./scripts/install.sh
    ```

O instalador irá cuidar de tudo: instalação do Docker, configurações de rede, extração de binários e subida do sistema.

## 🛠️ Resete do Sistema

Caso precise realizar uma instalação limpa ou apagar todos os dados:
```bash
sudo ./scripts/reset.sh
```

## 🔐 Acesso Padrão

*   **Dashboard**: `http://seu-ip/admin/`
*   **Login**: `admin`
*   **Senha**: `vertrigo` (Ou a senha definida no seu banco de dados original)
*   **Banco de Dados**: `db` | User: `root` | Pass: `vertrigo` | DB: `mkradius`

## 👨‍💻 Créditos

*   **Desenvolvedor Original**: Pedro Filho (MK-Auth)
*   **Modernização e Infraestrutura**: Mikrogestor Docker Team

---
*Este projeto é para fins educacionais e de backup técnico de infraestrutura.*

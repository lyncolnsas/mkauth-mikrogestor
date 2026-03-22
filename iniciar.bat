@echo off
setlocal

echo ======================================================
echo           INICIAR MK-AUTH (REPLICADO)
echo ======================================================
echo.

:: Verificar se o Docker está no PATH
where docker >nul 2>nul
if %ERRORLEVEL% neq 0 (
    echo [ERRO] Docker nao encontrado. Por favor, instale o Docker Desktop.
    pause
    exit /b 1
)

:: Verificar se o Docker Daemon está rodando
docker info >nul 2>nul
if %ERRORLEVEL% neq 0 (
    echo [AVISO] O Docker Desktop parece estar fechado.
    echo Por favor, abra o Docker Desktop e aguarde ele iniciar.
    echo.
    echo Pressione qualquer tecla quando o Docker estiver pronto...
    pause >nul
)

:: Subir os containers
echo [1/3] Construindo e iniciando containers...
docker-compose up -d --build

if %ERRORLEVEL% neq 0 (
    echo [ERRO] Falha ao iniciar o Docker Compose. Verifique os logs acima.
    pause
    exit /b 1
)

echo.
echo [2/3] Aguardando inicializacao do banco de dados (10s)...
timeout /t 10 /nobreak >nul

echo [3/3] Abrindo o sistema no navegador...
start http://localhost

echo.
echo ======================================================
echo    SISTEMA PRONTO! Acesse: http://localhost
echo    Para parar, use: docker-compose down
echo ======================================================
echo.
pause

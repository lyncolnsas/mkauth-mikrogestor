<?php
# ALTERE ABAIXO APENAS OS VALORES DAS CONSTANTES PARA SEU CONTEUDO PERSONALIZADO
# ALTERE TAMBEM FREERADIUS EM /etc/freeradius/3.0/mods-enabled/sql

if (!defined('CONHOSTNAME')) define('CONHOSTNAME', "127.0.0.1");
if (!defined('CONUSERNAME')) define('CONUSERNAME', "root");
if (!defined('CONPASSWRD')) define('CONPASSWRD', "vertrigo");
if (!defined('CONDATABASE')) define('CONDATABASE', "mkradius");

$LOADMYSQL = new mysqli(CONHOSTNAME, CONUSERNAME, CONPASSWRD, CONDATABASE);
if ($LOADMYSQL->connect_errno) exit('<H3>Impossivel estabelecer uma conexao com banco de dados...</H3>');
$LOADMYSQL->set_charset('utf8');
$LOADMYSQL->autocommit(true);

<?php
# ITENS QUE DEFINE SISTEMA
if (!defined('KEY2PROVEDOR')) define('KEY2PROVEDOR', 'a087d35e46c3f477eb10f7511506089a');
if (!defined('MY_COD_PAIS')) define('MY_COD_PAIS', '55');
if (!defined('DIR2ADMIN')) define('DIR2ADMIN', 'admin');

# NADA ABAIXO DEVE-SE ALTERAR
if (!defined('KERNEL2LINUX')) define('KERNEL2LINUX', '6.12');
if (!defined('HOST2NAME')) define('HOST2NAME', 'mk-auth');
if (!defined('VERSAO2UPDATE')) define('VERSAO2UPDATE', '25.05');
if (!defined('DIR2API')) define('DIR2API', '/opt/mk-auth/api/');
if (!defined('DIR2ARQ2BANCOS')) define('DIR2ARQ2BANCOS', '/opt/mk-auth/arq_bancos/');
if (!defined('DIR2BCKP')) define('DIR2BCKP', '/opt/mk-auth/bckp/');
if (!defined('DIR2BOLETO')) define('DIR2BOLETO', '/opt/mk-auth/boleto/');
if (!defined('DIR2CACHE')) define('DIR2CACHE', '/opt/mk-auth/cache/');
if (!defined('DIR2CLASSES')) define('DIR2CLASSES', '/opt/mk-auth/libs/');
if (!defined('DIR2DADOS')) define('DIR2DADOS', '/opt/mk-auth/dados/');
if (!defined('DIR2ETC')) define('DIR2ETC', '/opt/mk-auth/etc/');
if (!defined('DIR2JOBS')) define('DIR2JOBS', '/opt/mk-auth/jobs/');
if (!defined('DIR2LIBS')) define('DIR2LIBS', '/opt/mk-auth/libs/');
if (!defined('DIR2MKFILES')) define('DIR2MKFILES', '/opt/mk-auth/mkfiles/');
if (!defined('DIR2TMP2PHP')) define('DIR2TMP2PHP', '/var/tmp/');
if (!defined('DIR2TMP2BOT')) define('DIR2TMP2BOT', '/opt/mk-auth/tmp_bot/');
if (!defined('DIR2TMP2EML')) define('DIR2TMP2EML', '/opt/mk-auth/tmp_eml/');
if (!defined('DIR2TMP2SQL')) define('DIR2TMP2SQL', '/opt/mk-auth/tmp_sql/');
if (!defined('DIR2XPCACHE')) define('DIR2XPCACHE', '/opt/mk-auth/xpcache/');

if (strtoupper(php_sapi_name()) != 'CLI') {
if (!defined('SERVER2NAME')) define('SERVER2NAME', $_SERVER['SERVER_NAME']);

# GET HTTPS
switch (true) {
case (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] == 'on') :
	define('HTTTPS', 'on');
break;
case (!empty($_SERVER['HTTP_X_FORWARDED_PROTO']) && $_SERVER['HTTP_X_FORWARDED_PROTO'] == 'https') :
	define('HTTTPS', 'on');
break;
case (!empty($_SERVER['HTTP_X_FORWARDED_SSL']) && $_SERVER['HTTP_X_FORWARDED_SSL'] == 'on') :
	define('HTTTPS', 'on');
break;
default :
	define('HTTTPS', 'off');
break;
}

# URL ADMIN
if (HTTTPS == 'on') {
	define('ADMIN2URL', 'https://' . SERVER2NAME . '/' . DIR2ADMIN . '/');
} else {
	define('ADMIN2URL', 'http://' . SERVER2NAME . ':' . $_SERVER['SERVER_PORT'] . '/' . DIR2ADMIN . '/');
}

# GET IP
switch (true) {
case ((isset($_SERVER['HTTP_CF_CONNECTING_IP'])) && (!empty($_SERVER['HTTP_CF_CONNECTING_IP']))) :
	$my_remote_addr = (string) $_SERVER['HTTP_CF_CONNECTING_IP'];
	define('ENDERECO2IP', $my_remote_addr);
break;
case ((isset($_SERVER['HTTP_X_FORWARDED_FOR'])) && (!empty($_SERVER['HTTP_X_FORWARDED_FOR']))) :
	$my_http_x_forwarded_for = (string) $_SERVER['HTTP_X_FORWARDED_FOR'];
	$my_http_x_forwarded_for = explode(',', $my_http_x_forwarded_for);
	$my_http_x_forwarded_for = array_filter($my_http_x_forwarded_for);
	$my_http_x_forwarded_for = array_values($my_http_x_forwarded_for);
	$my_http_x_forwarded_for = end($my_http_x_forwarded_for);
	define('ENDERECO2IP', $my_http_x_forwarded_for);
break;
case ((isset($_SERVER['HTTP_CLIENT_IP'])) && (!empty($_SERVER['HTTP_CLIENT_IP']))) :
	$my_http_client_ip = (string) $_SERVER['HTTP_CLIENT_IP'];
	$my_http_client_ip = explode('.', $my_http_client_ip);
	define('ENDERECO2IP', $my_http_client_ip[3].$my_http_client_ip[2].$my_http_client_ip[1].$my_http_client_ip[0]);
break;
case ((isset($_SERVER['REMOTE_ADDR'])) && (!empty($_SERVER['REMOTE_ADDR']))) :
	$my_remote_addr = (string) $_SERVER['REMOTE_ADDR'];
	define('ENDERECO2IP', $my_remote_addr);
break;
default :
	define('ENDERECO2IP', '127.0.0.1');
break;
}
}

# AUTOLOAD
spl_autoload_register(function($classe) {
	$arquivo = str_replace('mka_', false, str_replace('mkac_', false, strtolower($classe)));
	$arquivo = $arquivo . '.class';
	if (file_exists(DIR2CLASSES . $arquivo)) include(DIR2CLASSES . $arquivo);
	return;
});

# LIMPAR SQL
function CLSMYSQL($valor, $tipo = 'padrao') {
	global $LOADMYSQL;
	$valor = stripslashes($valor ?? '');
	if (function_exists('mysqli_real_escape_string')) {
		$valor = mysqli_real_escape_string($LOADMYSQL, $valor);
	} else {
		$valor = mysqli_escape_string($LOADMYSQL, $valor);
	}
	switch ($tipo) {
		case 'text' :
			$corrompido = array('Ã§', 'Ã£', 'Ã¡', 'Ã©', 'Ãº', 'Ã¢', 'Ã´', 'Ãµ', 'Ã³', 'Ãª', 'Ã­', 'Ã“');
			$correto = array('ç', 'ã', 'á', 'é', 'ú', 'â', 'ô', 'õ', 'ó', 'ê', 'í', 'Ó');
			$valor = ($valor != '') ? "'" . str_replace($corrompido, $correto, $valor) . "'" : "''";
		break;
		case 'date' :
			$valor = ($valor != '') ? "'" . strval($valor) . "'" : 'NULL';
		break;
		case 'int' :
			$valor = ($valor != '') ? intval($valor) : 0;
		break;
		case 'double' :
			$valor = ($valor != '') ? "'" . floatval($valor) . "'" : 'NULL';
		break;
		default :
			$valor = ($valor != '') ? $valor : 'NULL';
		break;
	}
	return $valor;
}

# TIMEZONE
date_default_timezone_set('America/Sao_Paulo');


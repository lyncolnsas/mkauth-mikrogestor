<?php

class ZAPI {

	public function gerarTXT($i, $t) : string {

		// i eh interacao
		// t eh tipo

		$sleep = mt_rand(3, 9);

		$instancia = $this->instancia;
		$token_instancia = $this->token_instancia;
		$token = $this->token;
		$destino = $this->destino;
		$mensagem = urlencode($this->mensagem);
		$arquivo = $this->arquivo;
		$legenda = urlencode($this->legenda);
		$arqnome = urlencode($this->arqnome);

		// inicio
		$cmd_zapi = "sleep({$sleep});" . PHP_EOL;
		$cmd_zapi .= PHP_EOL;

		if ($t == 1) {

			$cmd_zapi .= "\$curl{$i} = curl_init();" . PHP_EOL;
			$cmd_zapi .= "curl_setopt(\$curl{$i}, CURLOPT_URL, 'https://api.z-api.io/instances/{$instancia}/token/{$token_instancia}/send-text');" . PHP_EOL;
			$cmd_zapi .= "curl_setopt(\$curl{$i}, CURLOPT_RETURNTRANSFER, true);" . PHP_EOL;
			$cmd_zapi .= "curl_setopt(\$curl{$i}, CURLOPT_ENCODING, '');" . PHP_EOL;
			$cmd_zapi .= "curl_setopt(\$curl{$i}, CURLOPT_MAXREDIRS, 10);" . PHP_EOL;
			$cmd_zapi .= "curl_setopt(\$curl{$i}, CURLOPT_TIMEOUT, 60);" . PHP_EOL;
			$cmd_zapi .= "curl_setopt(\$curl{$i}, CURLOPT_SSL_VERIFYHOST, false);" . PHP_EOL;
			$cmd_zapi .= "curl_setopt(\$curl{$i}, CURLOPT_SSL_VERIFYPEER, false);" . PHP_EOL;
			$cmd_zapi .= "curl_setopt(\$curl{$i}, CURLOPT_HTTP_VERSION, CURL_HTTP_VERSION_1_1);" . PHP_EOL;
			$cmd_zapi .= "curl_setopt(\$curl{$i}, CURLOPT_CUSTOMREQUEST, 'POST');" . PHP_EOL;
			$cmd_zapi .= "curl_setopt(\$curl{$i}, CURLOPT_HTTPHEADER, array('client-token: {$token}', 'content-type: application/x-www-form-urlencoded'));" . PHP_EOL;
			$cmd_zapi .= "curl_setopt(\$curl{$i}, CURLOPT_POSTFIELDS, 'phone=+{$destino}&message={$mensagem}');" . PHP_EOL;
			$cmd_zapi .= "\$resposta{$i} = curl_exec(\$curl{$i});" . PHP_EOL;
			$cmd_zapi .= "\$httpCode{$i} = curl_getinfo(\$curl{$i}, CURLINFO_HTTP_CODE);" . PHP_EOL;
			$cmd_zapi .= "curl_close(\$curl{$i});" . PHP_EOL . PHP_EOL;

		}

		if ($t == 2) {

			$cmd_zapi .= "\$curl{$i} = curl_init();" . PHP_EOL;
			$cmd_zapi .= "curl_setopt(\$curl{$i}, CURLOPT_URL, 'https://api.z-api.io/instances/{$instancia}/token/{$token_instancia}/send-image');" . PHP_EOL;
			$cmd_zapi .= "curl_setopt(\$curl{$i}, CURLOPT_RETURNTRANSFER, true);" . PHP_EOL;
			$cmd_zapi .= "curl_setopt(\$curl{$i}, CURLOPT_ENCODING, '');" . PHP_EOL;
			$cmd_zapi .= "curl_setopt(\$curl{$i}, CURLOPT_MAXREDIRS, 10);" . PHP_EOL;
			$cmd_zapi .= "curl_setopt(\$curl{$i}, CURLOPT_TIMEOUT, 60);" . PHP_EOL;
			$cmd_zapi .= "curl_setopt(\$curl{$i}, CURLOPT_SSL_VERIFYHOST, false);" . PHP_EOL;
			$cmd_zapi .= "curl_setopt(\$curl{$i}, CURLOPT_SSL_VERIFYPEER, false);" . PHP_EOL;
			$cmd_zapi .= "curl_setopt(\$curl{$i}, CURLOPT_HTTP_VERSION, CURL_HTTP_VERSION_1_1);" . PHP_EOL;
			$cmd_zapi .= "curl_setopt(\$curl{$i}, CURLOPT_CUSTOMREQUEST, 'POST');" . PHP_EOL;
			$cmd_zapi .= "curl_setopt(\$curl{$i}, CURLOPT_HTTPHEADER, array('client-token: {$token}', 'content-type: application/x-www-form-urlencoded'));" . PHP_EOL;
			$cmd_zapi .= "curl_setopt(\$curl{$i}, CURLOPT_POSTFIELDS, 'phone=+{$destino}&image=' . \$anexo{$i} . '&caption={$legenda}');" . PHP_EOL;
			$cmd_zapi .= "\$resposta{$i} = curl_exec(\$curl{$i});" . PHP_EOL;
			$cmd_zapi .= "\$httpCode{$i} = curl_getinfo(\$curl{$i}, CURLINFO_HTTP_CODE);" . PHP_EOL;
			$cmd_zapi .= "curl_close(\$curl{$i});" . PHP_EOL . PHP_EOL;

		}

		if ($t == 3) {

			$cmd_zapi .= "\$curl{$i} = curl_init();" . PHP_EOL;
			$cmd_zapi .= "curl_setopt(\$curl{$i}, CURLOPT_URL, 'https://api.z-api.io/instances/{$instancia}/token/{$token_instancia}/send-document/pdf');" . PHP_EOL;
			$cmd_zapi .= "curl_setopt(\$curl{$i}, CURLOPT_RETURNTRANSFER, true);" . PHP_EOL;
			$cmd_zapi .= "curl_setopt(\$curl{$i}, CURLOPT_ENCODING, '');" . PHP_EOL;
			$cmd_zapi .= "curl_setopt(\$curl{$i}, CURLOPT_MAXREDIRS, 10);" . PHP_EOL;
			$cmd_zapi .= "curl_setopt(\$curl{$i}, CURLOPT_TIMEOUT, 60);" . PHP_EOL;
			$cmd_zapi .= "curl_setopt(\$curl{$i}, CURLOPT_SSL_VERIFYHOST, false);" . PHP_EOL;
			$cmd_zapi .= "curl_setopt(\$curl{$i}, CURLOPT_SSL_VERIFYPEER, false);" . PHP_EOL;
			$cmd_zapi .= "curl_setopt(\$curl{$i}, CURLOPT_HTTP_VERSION, CURL_HTTP_VERSION_1_1);" . PHP_EOL;
			$cmd_zapi .= "curl_setopt(\$curl{$i}, CURLOPT_CUSTOMREQUEST, 'POST');" . PHP_EOL;
			$cmd_zapi .= "curl_setopt(\$curl{$i}, CURLOPT_HTTPHEADER, array('client-token: {$token}', 'content-type: application/x-www-form-urlencoded'));" . PHP_EOL;
			$cmd_zapi .= "curl_setopt(\$curl{$i}, CURLOPT_POSTFIELDS, 'phone=+{$destino}&document=' . \$anexo{$i} . '&caption={$legenda}&fileName={$arqnome}');" . PHP_EOL;
			$cmd_zapi .= "\$resposta{$i} = curl_exec(\$curl{$i});" . PHP_EOL;
			$cmd_zapi .= "\$httpCode{$i} = curl_getinfo(\$curl{$i}, CURLINFO_HTTP_CODE);" . PHP_EOL;
			$cmd_zapi .= "curl_close(\$curl{$i});" . PHP_EOL . PHP_EOL;

		}

		return $cmd_zapi;

	}

	public function gerarLOG($i, $t) : string {

		if (isset($this->log_job->login)) $v_login = $this->log_job->login;
		if (empty($v_login)) $v_login = $this->destino;

		if (isset($this->log_job->titulo)) $v_titulo = $this->log_job->titulo;
		$txt_titulo = '';
		if (!empty($v_titulo)) $txt_titulo = "[Titulo: {$v_titulo}] ";

		$l_mensagem = trim($this->mensagem);
		if ($t == 2) $l_mensagem = trim('legenda img ' . $this->legenda);
		if ($t == 3) $l_mensagem = trim('legenda pdf ' . $this->legenda);
		$l_mensagem = preg_replace("/[\t\s]+/", " ", $l_mensagem);
		$l_mensagem = str_replace(array('"', "'"), "", $l_mensagem);

		$log_zapi = "\$log{$i} = MKAC_DBASE::prepare('INSERT INTO sis_enviadas (login, data, tipo, mensagem, uuid, xto) VALUES (:login, now(), :tipo, :mensagem, :uuid, :xto)');" . PHP_EOL;
		$log_zapi .= "\$log{$i}->bindValue(':login', '{$v_login}');" . PHP_EOL;
		$log_zapi .= "\$log{$i}->bindValue(':tipo', 'app');" . PHP_EOL;
		$log_zapi .= "if(\$httpCode{$i} == 200 || \$httpCode{$i} == 201) {" . PHP_EOL;
		$log_zapi .= "\t\$log{$i}->bindValue(':mensagem', '{$txt_titulo}{$l_mensagem}');" . PHP_EOL;
		$log_zapi .= "} else {" . PHP_EOL;
		$log_zapi .= "\t\$log{$i}->bindValue(':mensagem', \"{$txt_titulo}codigo (\$httpCode{$i}) \$resposta{$i}\");" . PHP_EOL;
		$log_zapi .= "}" . PHP_EOL;
		$log_zapi .= "\$log{$i}->bindValue(':uuid', '" . $this->uuid . "');" . PHP_EOL;
		$log_zapi .= "\$log{$i}->bindValue(':xto', '" . $this->destino . "');" . PHP_EOL;
		$log_zapi .= "\$log{$i}->execute();" . PHP_EOL;

		return $log_zapi;

	}

}

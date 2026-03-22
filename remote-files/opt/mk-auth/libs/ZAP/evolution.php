<?php

class EVOLUTION {

	public function gerarTXT($i, $t) : string {

		// i eh interacao
		// t eh tipo

		$segundos = array(11, 17, 23, 29, 37, 43, 53, 59, 67, 73); // 10 primos com 6 de diferenca
		$sleep = $segundos[array_rand($segundos)];

		$wapp_host = $this->wapp_host;
		$wapp_login = $this->wapp_login;
		$wapp_pass = $this->wapp_pass;
		$destino = $this->destino;
		$mensagem = urlencode($this->mensagem);
		$arquivo = $this->arquivo;
		$legenda = urlencode($this->legenda);
		$arqnome = urlencode($this->arqnome);

		$Host = (!preg_match('/^http[s]?:\/\//', $wapp_host)) ? 'http://' . $wapp_host : $wapp_host;
		$mensagem = urldecode($mensagem);
		$legenda = urldecode($legenda);
		$arqnome = rtrim($arqnome, '.pdf') . '.pdf';

		// inicio
		$cmd_evo = "sleep({$sleep});" . PHP_EOL;
		$cmd_evo .= PHP_EOL;

		if ($t == 1) {

			$cmd_evo .= "\$curl{$i} = curl_init();" . PHP_EOL;
			$cmd_evo .= "curl_setopt(\$curl{$i}, CURLOPT_URL, '{$Host}/message/sendText/{$wapp_login}');" . PHP_EOL;
			$cmd_evo .= "curl_setopt(\$curl{$i}, CURLOPT_RETURNTRANSFER, true);" . PHP_EOL;
			$cmd_evo .= "curl_setopt(\$curl{$i}, CURLOPT_ENCODING, '');" . PHP_EOL;
			$cmd_evo .= "curl_setopt(\$curl{$i}, CURLOPT_MAXREDIRS, 10);" . PHP_EOL;
			$cmd_evo .= "curl_setopt(\$curl{$i}, CURLOPT_TIMEOUT, 60);" . PHP_EOL;
			$cmd_evo .= "curl_setopt(\$curl{$i}, CURLOPT_SSL_VERIFYHOST, false);" . PHP_EOL;
			$cmd_evo .= "curl_setopt(\$curl{$i}, CURLOPT_SSL_VERIFYHOST, false);" . PHP_EOL;
			$cmd_evo .= "curl_setopt(\$curl{$i}, CURLOPT_FOLLOWLOCATION, true);" . PHP_EOL;
			$cmd_evo .= "curl_setopt(\$curl{$i}, CURLOPT_HTTP_VERSION, CURL_HTTP_VERSION_1_1);" . PHP_EOL;
			$cmd_evo .= "curl_setopt(\$curl{$i}, CURLOPT_CUSTOMREQUEST, 'POST');" . PHP_EOL;
			$cmd_evo .= "curl_setopt(\$curl{$i}, CURLOPT_HTTPHEADER, array('content-type: application/json', 'apikey: {$wapp_pass}'));" . PHP_EOL;
			$cmd_evo .= "curl_setopt(\$curl{$i}, CURLOPT_POSTFIELDS, json_encode(array('number' => '{$destino}', 'options' => array('delay' => 1200, 'presence' => 'composing', 'linkPreview' => false), 'textMessage'=> array('text' => '{$mensagem}'))));" . PHP_EOL;
			$cmd_evo .= "\$resposta{$i} = curl_exec(\$curl{$i});" . PHP_EOL;
			$cmd_evo .= "\$httpCode{$i} = curl_getinfo(\$curl{$i}, CURLINFO_HTTP_CODE);" . PHP_EOL;
			$cmd_evo .= "curl_close(\$curl{$i});" . PHP_EOL . PHP_EOL;

		}

		if ($t == 2) {

			$cmd_evo .= "\$curl{$i} = curl_init();" . PHP_EOL;
			$cmd_evo .= "curl_setopt(\$curl{$i}, CURLOPT_URL, '{$Host}/message/sendMedia/{$wapp_login}');" . PHP_EOL;
			$cmd_evo .= "curl_setopt(\$curl{$i}, CURLOPT_RETURNTRANSFER, true);" . PHP_EOL;
			$cmd_evo .= "curl_setopt(\$curl{$i}, CURLOPT_ENCODING, '');" . PHP_EOL;
			$cmd_evo .= "curl_setopt(\$curl{$i}, CURLOPT_MAXREDIRS, 10);" . PHP_EOL;
			$cmd_evo .= "curl_setopt(\$curl{$i}, CURLOPT_TIMEOUT, 60);" . PHP_EOL;
			$cmd_evo .= "curl_setopt(\$curl{$i}, CURLOPT_SSL_VERIFYHOST, false);" . PHP_EOL;
			$cmd_evo .= "curl_setopt(\$curl{$i}, CURLOPT_SSL_VERIFYHOST, false);" . PHP_EOL;
			$cmd_evo .= "curl_setopt(\$curl{$i}, CURLOPT_FOLLOWLOCATION, true);" . PHP_EOL;
			$cmd_evo .= "curl_setopt(\$curl{$i}, CURLOPT_HTTP_VERSION, CURL_HTTP_VERSION_1_1);" . PHP_EOL;
			$cmd_evo .= "curl_setopt(\$curl{$i}, CURLOPT_CUSTOMREQUEST, 'POST');" . PHP_EOL;
			$cmd_evo .= "curl_setopt(\$curl{$i}, CURLOPT_HTTPHEADER, array('content-type: application/json', 'apikey: {$wapp_pass}'));" . PHP_EOL;
			$cmd_evo .= "curl_setopt(\$curl{$i}, CURLOPT_POSTFIELDS, json_encode(array('number' => '{$destino}', 'options' => array('delay' => 1200, 'presence' => 'composing'), 'mediaMessage'=> array( 'mediatype' => 'image', 'caption' => '{$legenda}', 'media' => \$anexo{$i}))));" . PHP_EOL;
			$cmd_evo .= "\$resposta{$i} = curl_exec(\$curl{$i});" . PHP_EOL;
			$cmd_evo .= "\$httpCode{$i} = curl_getinfo(\$curl{$i}, CURLINFO_HTTP_CODE);" . PHP_EOL;
			$cmd_evo .= "curl_close(\$curl{$i});" . PHP_EOL . PHP_EOL;

		}

		if ($t == 3) {

			$cmd_evo .= "\$curl{$i} = curl_init();" . PHP_EOL;
			$cmd_evo .= "curl_setopt(\$curl{$i}, CURLOPT_URL, '{$Host}/message/sendMedia/{$wapp_login}');" . PHP_EOL;
			$cmd_evo .= "curl_setopt(\$curl{$i}, CURLOPT_RETURNTRANSFER, true);" . PHP_EOL;
			$cmd_evo .= "curl_setopt(\$curl{$i}, CURLOPT_ENCODING, '');" . PHP_EOL;
			$cmd_evo .= "curl_setopt(\$curl{$i}, CURLOPT_MAXREDIRS, 10);" . PHP_EOL;
			$cmd_evo .= "curl_setopt(\$curl{$i}, CURLOPT_TIMEOUT, 60);" . PHP_EOL;
			$cmd_evo .= "curl_setopt(\$curl{$i}, CURLOPT_SSL_VERIFYHOST, false);" . PHP_EOL;
			$cmd_evo .= "curl_setopt(\$curl{$i}, CURLOPT_SSL_VERIFYHOST, false);" . PHP_EOL;
			$cmd_evo .= "curl_setopt(\$curl{$i}, CURLOPT_FOLLOWLOCATION, true);" . PHP_EOL;
			$cmd_evo .= "curl_setopt(\$curl{$i}, CURLOPT_HTTP_VERSION, CURL_HTTP_VERSION_1_1);" . PHP_EOL;
			$cmd_evo .= "curl_setopt(\$curl{$i}, CURLOPT_CUSTOMREQUEST, 'POST');" . PHP_EOL;
			$cmd_evo .= "curl_setopt(\$curl{$i}, CURLOPT_HTTPHEADER, array('content-type: application/json', 'apikey: {$wapp_pass}'));" . PHP_EOL;
			$cmd_evo .= "curl_setopt(\$curl{$i}, CURLOPT_POSTFIELDS, json_encode(array('number' => '{$destino}', 'options' => array('delay' => 1200, 'presence' => 'composing'), 'mediaMessage' => array( 'mediatype' => 'document', 'fileName' => '{$arqnome}', 'caption' => '{$legenda}', 'media' => \$anexo{$i}))));" . PHP_EOL;
			$cmd_evo .= "\$resposta{$i} = curl_exec(\$curl{$i});" . PHP_EOL;
			$cmd_evo .= "\$httpCode{$i} = curl_getinfo(\$curl{$i}, CURLINFO_HTTP_CODE);" . PHP_EOL;
			$cmd_evo .= "curl_close(\$curl{$i});" . PHP_EOL . PHP_EOL;

		}

		return $cmd_evo;

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

		$log_evo = "\$log{$i} = MKAC_DBASE::prepare('INSERT INTO sis_enviadas (login, data, tipo, mensagem, uuid, xto) VALUES (:login, now(), :tipo, :mensagem, :uuid, :xto)');" . PHP_EOL;
		$log_evo .= "\$log{$i}->bindValue(':login', '{$v_login}');" . PHP_EOL;
		$log_evo .= "\$log{$i}->bindValue(':tipo', 'app');" . PHP_EOL;
		$log_evo .= "if(\$httpCode{$i} == 200 || \$httpCode{$i} == 201) {" . PHP_EOL;
		$log_evo .= "\t\$log{$i}->bindValue(':mensagem', '{$txt_titulo}{$l_mensagem}');" . PHP_EOL;
		$log_evo .= "} else {" . PHP_EOL;
		$log_evo .= "\t\$log{$i}->bindValue(':mensagem', \"{$txt_titulo}codigo (\$httpCode{$i}) \$resposta{$i}\");" . PHP_EOL;
		$log_evo .= "}" . PHP_EOL;
		$log_evo .= "\$log{$i}->bindValue(':uuid', '" . $this->uuid . "');" . PHP_EOL;
		$log_evo .= "\$log{$i}->bindValue(':xto', '" . $this->destino . "');" . PHP_EOL;
		$log_evo .= "\$log{$i}->execute();" . PHP_EOL;

		return $log_evo;

	}

}

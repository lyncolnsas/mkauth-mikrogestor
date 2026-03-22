<?php

class WAPP {

	public function gerarTXT($i, $t) : string {

		// i eh interacao
		// t eh tipo

		$sleep = mt_rand(3, 9);

		$wapp_host = $this->wapp_host;
		$wapp_login = $this->wapp_login;
		$wapp_pass = $this->wapp_pass;
		$destino = $this->destino;
		$mensagem = urlencode($this->mensagem);
		$arquivo = $this->arquivo;
		$legenda = urlencode($this->legenda);
		$arqnome = urlencode($this->arqnome);

		$Host = (!preg_match('/^http[s]?:\/\//', $wapp_host)) ? 'http://' . $wapp_host : $wapp_host;

		// inicio
		$cmd_post = "sleep({$sleep});" . PHP_EOL;
		$cmd_post .= PHP_EOL;

		if ($t == 1) {

			$cmd_post .= "\$curl{$i} = curl_init();" . PHP_EOL;
			$cmd_post .= "curl_setopt(\$curl{$i}, CURLOPT_URL, '{$Host}/send-message');" . PHP_EOL;
			$cmd_post .= "curl_setopt(\$curl{$i}, CURLOPT_RETURNTRANSFER, true);" . PHP_EOL;
			$cmd_post .= "curl_setopt(\$curl{$i}, CURLOPT_ENCODING, '');" . PHP_EOL;
			$cmd_post .= "curl_setopt(\$curl{$i}, CURLOPT_MAXREDIRS, 10);" . PHP_EOL;
			$cmd_post .= "curl_setopt(\$curl{$i}, CURLOPT_TIMEOUT, 60);" . PHP_EOL;
			$cmd_post .= "curl_setopt(\$curl{$i}, CURLOPT_SSL_VERIFYHOST, false);" . PHP_EOL;
			$cmd_post .= "curl_setopt(\$curl{$i}, CURLOPT_SSL_VERIFYPEER, false);" . PHP_EOL;
			$cmd_post .= "curl_setopt(\$curl{$i}, CURLOPT_HTTP_VERSION, CURL_HTTP_VERSION_1_1);" . PHP_EOL;
			$cmd_post .= "curl_setopt(\$curl{$i}, CURLOPT_CUSTOMREQUEST, 'POST');" . PHP_EOL;
			$cmd_post .= "curl_setopt(\$curl{$i}, CURLOPT_HTTPHEADER, array('content-type: application/x-www-form-urlencoded'));" . PHP_EOL;
			$cmd_post .= "curl_setopt(\$curl{$i}, CURLOPT_POSTFIELDS, 'to={$destino}&msg={$mensagem}&login={$wapp_login}&pass={$wapp_pass}');" . PHP_EOL;
			$cmd_post .= "\$resposta{$i} = strip_tags(curl_exec(\$curl{$i}));" . PHP_EOL;
			$cmd_post .= "\$httpCode{$i} = curl_getinfo(\$curl{$i}, CURLINFO_HTTP_CODE);" . PHP_EOL;
			$cmd_post .= "curl_close(\$curl{$i});" . PHP_EOL . PHP_EOL;

		}

		if ($t == 2) {

			$cmd_post .= "\$mimetype = trim(shell_exec(' file --mime-type -b {$arquivo} '));" . PHP_EOL . PHP_EOL;
			$cmd_post .= "\$curl{$i} = curl_init();" . PHP_EOL;
			$cmd_post .= "curl_setopt(\$curl{$i}, CURLOPT_URL, '{$Host}/send-image');" . PHP_EOL;
			$cmd_post .= "curl_setopt(\$curl{$i}, CURLOPT_RETURNTRANSFER, true);" . PHP_EOL;
			$cmd_post .= "curl_setopt(\$curl{$i}, CURLOPT_ENCODING, '');" . PHP_EOL;
			$cmd_post .= "curl_setopt(\$curl{$i}, CURLOPT_MAXREDIRS, 10);" . PHP_EOL;
			$cmd_post .= "curl_setopt(\$curl{$i}, CURLOPT_TIMEOUT, 60);" . PHP_EOL;
			$cmd_post .= "curl_setopt(\$curl{$i}, CURLOPT_SSL_VERIFYHOST, false);" . PHP_EOL;
			$cmd_post .= "curl_setopt(\$curl{$i}, CURLOPT_SSL_VERIFYPEER, false);" . PHP_EOL;
			$cmd_post .= "curl_setopt(\$curl{$i}, CURLOPT_HTTP_VERSION, CURL_HTTP_VERSION_1_1);" . PHP_EOL;
			$cmd_post .= "curl_setopt(\$curl{$i}, CURLOPT_CUSTOMREQUEST, 'POST');" . PHP_EOL;
			$cmd_post .= "curl_setopt(\$curl{$i}, CURLOPT_HTTPHEADER, array('content-type: application/x-www-form-urlencoded'));" . PHP_EOL;
			$cmd_post .= "curl_setopt(\$curl{$i}, CURLOPT_POSTFIELDS, 'to={$destino}&caption={$legenda}&image=' . \$anexo{$i} . '&mimetype=' . \$mimetype . '&login={$wapp_login}&pass={$wapp_pass}');" . PHP_EOL;
			$cmd_post .= "\$resposta{$i} = strip_tags(curl_exec(\$curl{$i}));" . PHP_EOL;
			$cmd_post .= "\$httpCode{$i} = curl_getinfo(\$curl{$i}, CURLINFO_HTTP_CODE);" . PHP_EOL;
			$cmd_post .= "curl_close(\$curl{$i});" . PHP_EOL . PHP_EOL;

		}

		if ($t == 3) {

			$cmd_post .= "\$curl{$i} = curl_init();" . PHP_EOL;
			$cmd_post .= "curl_setopt(\$curl{$i}, CURLOPT_URL, '{$Host}/send-document');" . PHP_EOL;
			$cmd_post .= "curl_setopt(\$curl{$i}, CURLOPT_RETURNTRANSFER, true);" . PHP_EOL;
			$cmd_post .= "curl_setopt(\$curl{$i}, CURLOPT_ENCODING, '');" . PHP_EOL;
			$cmd_post .= "curl_setopt(\$curl{$i}, CURLOPT_MAXREDIRS, 10);" . PHP_EOL;
			$cmd_post .= "curl_setopt(\$curl{$i}, CURLOPT_TIMEOUT, 60);" . PHP_EOL;
			$cmd_post .= "curl_setopt(\$curl{$i}, CURLOPT_SSL_VERIFYHOST, false);" . PHP_EOL;
			$cmd_post .= "curl_setopt(\$curl{$i}, CURLOPT_SSL_VERIFYPEER, false);" . PHP_EOL;
			$cmd_post .= "curl_setopt(\$curl{$i}, CURLOPT_HTTP_VERSION, CURL_HTTP_VERSION_1_1);" . PHP_EOL;
			$cmd_post .= "curl_setopt(\$curl{$i}, CURLOPT_CUSTOMREQUEST, 'POST');" . PHP_EOL;
			$cmd_post .= "curl_setopt(\$curl{$i}, CURLOPT_HTTPHEADER, array('content-type: application/x-www-form-urlencoded'));" . PHP_EOL;
			$cmd_post .= "curl_setopt(\$curl{$i}, CURLOPT_POSTFIELDS, 'to={$destino}&caption={$legenda}&document=' . \$anexo{$i} . '&mimetype=application/pdf&filename={$arqnome}&login={$wapp_login}&pass={$wapp_pass}');" . PHP_EOL;
			$cmd_post .= "\$resposta{$i} = strip_tags(curl_exec(\$curl{$i}));" . PHP_EOL;
			$cmd_post .= "\$httpCode{$i} = curl_getinfo(\$curl{$i}, CURLINFO_HTTP_CODE);" . PHP_EOL;
			$cmd_post .= "curl_close(\$curl{$i});" . PHP_EOL . PHP_EOL;

		}

		return $cmd_post;

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

		$log_post = "\$log{$i} = MKAC_DBASE::prepare('INSERT INTO sis_enviadas (login, data, tipo, mensagem, uuid, xto) VALUES (:login, now(), :tipo, :mensagem, :uuid, :xto)');" . PHP_EOL;
		$log_post .= "\$log{$i}->bindValue(':login', '{$v_login}');" . PHP_EOL;
		$log_post .= "\$log{$i}->bindValue(':tipo', 'app');" . PHP_EOL;
		$log_post .= "if(\$httpCode{$i} == 200 || \$httpCode{$i} == 201) {" . PHP_EOL;
		$log_post .= "\t\$log{$i}->bindValue(':mensagem', '{$txt_titulo}{$l_mensagem}');" . PHP_EOL;
		$log_post .= "} else {" . PHP_EOL;
		$log_post .= "\t\$log{$i}->bindValue(':mensagem', \"{$txt_titulo}codigo (\$httpCode{$i}) \$resposta{$i}\");" . PHP_EOL;
		$log_post .= "}" . PHP_EOL;
		$log_post .= "\$log{$i}->bindValue(':uuid', '" . $this->uuid . "');" . PHP_EOL;
		$log_post .= "\$log{$i}->bindValue(':xto', '" . $this->destino . "');" . PHP_EOL;
		$log_post .= "\$log{$i}->execute();" . PHP_EOL;

		return $log_post;

	}

}

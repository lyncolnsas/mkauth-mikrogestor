<?php

class ULTRAMSG {

	public function gerarTXT($i, $t) : string {

		// i eh interacao
		// t eh tipo

		$sleep = mt_rand(3, 9);

		$instancia = $this->instancia;
		$token = $this->token;
		$destino = $this->destino;
		$mensagem = urlencode($this->mensagem);
		$arquivo = $this->arquivo;
		$legenda = urlencode($this->legenda);
		$arqnome = urlencode($this->arqnome);

		// inicio
		$cmd_umsg = "sleep({$sleep});" . PHP_EOL;
		$cmd_umsg .= PHP_EOL;

		if ($t == 1) {

			$cmd_umsg .= "\$curl{$i} = curl_init();" . PHP_EOL;
			$cmd_umsg .= "curl_setopt(\$curl{$i}, CURLOPT_URL, 'https://api.ultramsg.com/{$instancia}/messages/chat');" . PHP_EOL;
			$cmd_umsg .= "curl_setopt(\$curl{$i}, CURLOPT_RETURNTRANSFER, true);" . PHP_EOL;
			$cmd_umsg .= "curl_setopt(\$curl{$i}, CURLOPT_ENCODING, '');" . PHP_EOL;
			$cmd_umsg .= "curl_setopt(\$curl{$i}, CURLOPT_MAXREDIRS, 10);" . PHP_EOL;
			$cmd_umsg .= "curl_setopt(\$curl{$i}, CURLOPT_TIMEOUT, 60);" . PHP_EOL;
			$cmd_umsg .= "curl_setopt(\$curl{$i}, CURLOPT_SSL_VERIFYHOST, false);" . PHP_EOL;
			$cmd_umsg .= "curl_setopt(\$curl{$i}, CURLOPT_SSL_VERIFYPEER, false);" . PHP_EOL;
			$cmd_umsg .= "curl_setopt(\$curl{$i}, CURLOPT_HTTP_VERSION, CURL_HTTP_VERSION_1_1);" . PHP_EOL;
			$cmd_umsg .= "curl_setopt(\$curl{$i}, CURLOPT_CUSTOMREQUEST, 'POST');" . PHP_EOL;
			$cmd_umsg .= "curl_setopt(\$curl{$i}, CURLOPT_HTTPHEADER, array('content-type: application/x-www-form-urlencoded'));" . PHP_EOL;
			$cmd_umsg .= "curl_setopt(\$curl{$i}, CURLOPT_POSTFIELDS, 'token={$token}&to=+{$destino}&body={$mensagem}');" . PHP_EOL;
			$cmd_umsg .= "\$resposta{$i} = curl_exec(\$curl{$i});" . PHP_EOL;
			$cmd_umsg .= "\$httpCode{$i} = curl_getinfo(\$curl{$i}, CURLINFO_HTTP_CODE);" . PHP_EOL;
			$cmd_umsg .= "curl_close(\$curl{$i});" . PHP_EOL . PHP_EOL;

		}

		if ($t == 2) {

			$cmd_umsg .= "\$curl{$i} = curl_init();" . PHP_EOL;
			$cmd_umsg .= "curl_setopt(\$curl{$i}, CURLOPT_URL, 'https://api.ultramsg.com/{$instancia}/messages/image');" . PHP_EOL;
			$cmd_umsg .= "curl_setopt(\$curl{$i}, CURLOPT_RETURNTRANSFER, true);" . PHP_EOL;
			$cmd_umsg .= "curl_setopt(\$curl{$i}, CURLOPT_ENCODING, '');" . PHP_EOL;
			$cmd_umsg .= "curl_setopt(\$curl{$i}, CURLOPT_MAXREDIRS, 10);" . PHP_EOL;
			$cmd_umsg .= "curl_setopt(\$curl{$i}, CURLOPT_TIMEOUT, 60);" . PHP_EOL;
			$cmd_umsg .= "curl_setopt(\$curl{$i}, CURLOPT_SSL_VERIFYHOST, false);" . PHP_EOL;
			$cmd_umsg .= "curl_setopt(\$curl{$i}, CURLOPT_SSL_VERIFYPEER, false);" . PHP_EOL;
			$cmd_umsg .= "curl_setopt(\$curl{$i}, CURLOPT_HTTP_VERSION, CURL_HTTP_VERSION_1_1);" . PHP_EOL;
			$cmd_umsg .= "curl_setopt(\$curl{$i}, CURLOPT_CUSTOMREQUEST, 'POST');" . PHP_EOL;
			$cmd_umsg .= "curl_setopt(\$curl{$i}, CURLOPT_HTTPHEADER, array('content-type: application/x-www-form-urlencoded'));" . PHP_EOL;
			$cmd_umsg .= "curl_setopt(\$curl{$i}, CURLOPT_POSTFIELDS, 'token={$token}&to=+{$destino}&image=' . \$anexo{$i} . '&caption={$legenda}');" . PHP_EOL;
			$cmd_umsg .= "\$resposta{$i} = curl_exec(\$curl{$i});" . PHP_EOL;
			$cmd_umsg .= "\$httpCode{$i} = curl_getinfo(\$curl{$i}, CURLINFO_HTTP_CODE);" . PHP_EOL;
			$cmd_umsg .= "curl_close(\$curl{$i});" . PHP_EOL . PHP_EOL;

		} 

		if ($t == 3) {

			$cmd_umsg .= "\$curl{$i} = curl_init();" . PHP_EOL;
			$cmd_umsg .= "curl_setopt(\$curl{$i}, CURLOPT_URL, 'https://api.ultramsg.com/{$instancia}/messages/document');" . PHP_EOL;
			$cmd_umsg .= "curl_setopt(\$curl{$i}, CURLOPT_RETURNTRANSFER, true);" . PHP_EOL;
			$cmd_umsg .= "curl_setopt(\$curl{$i}, CURLOPT_ENCODING, '');" . PHP_EOL;
			$cmd_umsg .= "curl_setopt(\$curl{$i}, CURLOPT_MAXREDIRS, 10);" . PHP_EOL;
			$cmd_umsg .= "curl_setopt(\$curl{$i}, CURLOPT_TIMEOUT, 60);" . PHP_EOL;
			$cmd_umsg .= "curl_setopt(\$curl{$i}, CURLOPT_SSL_VERIFYHOST, false);" . PHP_EOL;
			$cmd_umsg .= "curl_setopt(\$curl{$i}, CURLOPT_SSL_VERIFYPEER, false);" . PHP_EOL;
			$cmd_umsg .= "curl_setopt(\$curl{$i}, CURLOPT_HTTP_VERSION, CURL_HTTP_VERSION_1_1);" . PHP_EOL;
			$cmd_umsg .= "curl_setopt(\$curl{$i}, CURLOPT_CUSTOMREQUEST, 'POST');" . PHP_EOL;
			$cmd_umsg .= "curl_setopt(\$curl{$i}, CURLOPT_HTTPHEADER, array('content-type: application/x-www-form-urlencoded'));" . PHP_EOL;
			$cmd_umsg .= "curl_setopt(\$curl{$i}, CURLOPT_POSTFIELDS, 'token={$token}&to=+{$destino}&document=' . \$anexo{$i} . '&filename={$arqnome}&caption={$legenda}');" . PHP_EOL;
			$cmd_umsg .= "\$resposta{$i} = curl_exec(\$curl{$i});" . PHP_EOL;
			$cmd_umsg .= "\$httpCode{$i} = curl_getinfo(\$curl{$i}, CURLINFO_HTTP_CODE);" . PHP_EOL;
			$cmd_umsg .= "curl_close(\$curl{$i});" . PHP_EOL . PHP_EOL;

		}

		return $cmd_umsg;

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

		$log_umsg = "\$log{$i} = MKAC_DBASE::prepare('INSERT INTO sis_enviadas (login, data, tipo, mensagem, uuid, xto) VALUES (:login, now(), :tipo, :mensagem, :uuid, :xto)');" . PHP_EOL;
		$log_umsg .= "\$log{$i}->bindValue(':login', '{$v_login}');" . PHP_EOL;
		$log_umsg .= "\$log{$i}->bindValue(':tipo', 'app');" . PHP_EOL;
		$log_umsg .= "if(\$httpCode{$i} == 200 || \$httpCode{$i} == 201) {" . PHP_EOL;
		$log_umsg .= "\t\$log{$i}->bindValue(':mensagem', '{$txt_titulo}{$l_mensagem}');" . PHP_EOL;
		$log_umsg .= "} else {" . PHP_EOL;
		$log_umsg .= "\t\$log{$i}->bindValue(':mensagem', \"{$txt_titulo}codigo (\$httpCode{$i}) \$resposta{$i}\");" . PHP_EOL;
		$log_umsg .= "}" . PHP_EOL;
		$log_umsg .= "\$log{$i}->bindValue(':uuid', '" . $this->uuid . "');" . PHP_EOL;
		$log_umsg .= "\$log{$i}->bindValue(':xto', '" . $this->destino . "');" . PHP_EOL;
		$log_umsg .= "\$log{$i}->execute();" . PHP_EOL;

		return $log_umsg;

	}

}

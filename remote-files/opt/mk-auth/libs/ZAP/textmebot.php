<?php

class TEXTMEBOT {

	public function gerarTXT($i, $t) : string {

		// i eh interacao
		// t eh tipo

		$segundos = array(11, 17, 23, 29, 37, 43, 53, 59, 67, 73); // 10 primos com 6 de diferenca
		$sleep = $segundos[array_rand($segundos)];

		$token = $this->token;
		$destino = $this->destino;
		$mensagem = urlencode($this->mensagem);
		$legenda = urlencode($this->legenda);

		if (strlen($destino) === 13 && $destino[4] === '9') $destino = substr($destino, 0, 4) . substr($destino, 5);
		$destino9 = substr($destino, 0, 4) . '9' . substr($destino, 5);

		if ($i == 1) {

			$salto = (int) preg_replace('/[^0-9]/', false, $destino);
			$salto = ($salto % 11) + 1;
			$salto = $salto * $sleep;
			$sleep = round($salto / 6);

		}

		// inicio
		$cmd_textmebot = "sleep({$sleep});" . PHP_EOL . PHP_EOL;

		if ($t == 1) {

			$cmd_textmebot .= "\$curl{$i} = curl_init();" . PHP_EOL;
			$cmd_textmebot .= "curl_setopt(\$curl{$i}, CURLOPT_URL, 'http://api.textmebot.com/send.php?recipient=+{$destino}&apikey={$token}&text={$mensagem}');" . PHP_EOL;
			$cmd_textmebot .= "curl_setopt(\$curl{$i}, CURLOPT_RETURNTRANSFER, true);" . PHP_EOL;
			$cmd_textmebot .= "curl_setopt(\$curl{$i}, CURLOPT_MAXREDIRS, 10);" . PHP_EOL;
			$cmd_textmebot .= "curl_setopt(\$curl{$i}, CURLOPT_TIMEOUT, 60);" . PHP_EOL;
			$cmd_textmebot .= "curl_setopt(\$curl{$i}, CURLOPT_HTTPGET, true);" . PHP_EOL;
			$cmd_textmebot .= "\$resposta{$i} = curl_exec(\$curl{$i});" . PHP_EOL;
			$cmd_textmebot .= "\$httpCode{$i} = curl_getinfo(\$curl{$i}, CURLINFO_HTTP_CODE);" . PHP_EOL;
			$cmd_textmebot .= "curl_close(\$curl{$i});" . PHP_EOL . PHP_EOL;

			$cmd_textmebot .= "sleep(3);" . PHP_EOL . PHP_EOL;

			$cmd_textmebot .= "\$curl{$i}9 = curl_init();" . PHP_EOL;
			$cmd_textmebot .= "curl_setopt(\$curl{$i}9, CURLOPT_URL, 'http://api.textmebot.com/send.php?recipient=+{$destino9}&apikey={$token}&text={$mensagem}');" . PHP_EOL;
			$cmd_textmebot .= "curl_setopt(\$curl{$i}9, CURLOPT_RETURNTRANSFER, true);" . PHP_EOL;
			$cmd_textmebot .= "curl_setopt(\$curl{$i}9, CURLOPT_MAXREDIRS, 10);" . PHP_EOL;
			$cmd_textmebot .= "curl_setopt(\$curl{$i}9, CURLOPT_TIMEOUT, 60);" . PHP_EOL;
			$cmd_textmebot .= "curl_setopt(\$curl{$i}9, CURLOPT_HTTPGET, true);" . PHP_EOL;
			$cmd_textmebot .= "curl_exec(\$curl{$i}9);" . PHP_EOL;
			$cmd_textmebot .= "curl_close(\$curl{$i}9);" . PHP_EOL . PHP_EOL;

		}

		if ($t == 2) {

			$cmd_textmebot .= "\$curl{$i} = curl_init();" . PHP_EOL;
			$cmd_textmebot .= "curl_setopt(\$curl{$i}, CURLOPT_URL, 'http://api.textmebot.com/send.php?recipient=+{$destino}&apikey={$token}&text={$legenda}&file='. \$anexo{$i});" . PHP_EOL;
			$cmd_textmebot .= "curl_setopt(\$curl{$i}, CURLOPT_RETURNTRANSFER, true);" . PHP_EOL;
			$cmd_textmebot .= "curl_setopt(\$curl{$i}, CURLOPT_MAXREDIRS, 10);" . PHP_EOL;
			$cmd_textmebot .= "curl_setopt(\$curl{$i}, CURLOPT_TIMEOUT, 60);" . PHP_EOL;
			$cmd_textmebot .= "curl_setopt(\$curl{$i}, CURLOPT_HTTPGET, true);" . PHP_EOL;
			$cmd_textmebot .= "\$resposta{$i} = curl_exec(\$curl{$i});" . PHP_EOL;
			$cmd_textmebot .= "\$httpCode{$i} = curl_getinfo(\$curl{$i}, CURLINFO_HTTP_CODE);" . PHP_EOL;
			$cmd_textmebot .= "curl_close(\$curl{$i});" . PHP_EOL . PHP_EOL;

			$cmd_textmebot .= "sleep(3);" . PHP_EOL . PHP_EOL;

			$cmd_textmebot .= "\$curl{$i}9 = curl_init();" . PHP_EOL;
			$cmd_textmebot .= "curl_setopt(\$curl{$i}9, CURLOPT_URL, 'http://api.textmebot.com/send.php?recipient=+{$destino9}&apikey={$token}&text={$mensagem}');" . PHP_EOL;
			$cmd_textmebot .= "curl_setopt(\$curl{$i}9, CURLOPT_RETURNTRANSFER, true);" . PHP_EOL;
			$cmd_textmebot .= "curl_setopt(\$curl{$i}9, CURLOPT_MAXREDIRS, 10);" . PHP_EOL;
			$cmd_textmebot .= "curl_setopt(\$curl{$i}9, CURLOPT_TIMEOUT, 60);" . PHP_EOL;
			$cmd_textmebot .= "curl_setopt(\$curl{$i}9, CURLOPT_HTTPGET, true);" . PHP_EOL;
			$cmd_textmebot .= "curl_exec(\$curl{$i}9);" . PHP_EOL;
			$cmd_textmebot .= "curl_close(\$curl{$i}9);" . PHP_EOL . PHP_EOL;

		}

		if ($t == 3) {

			$cmd_textmebot .= "\$curl{$i} = curl_init();" . PHP_EOL;
			$cmd_textmebot .= "curl_setopt(\$curl{$i}, CURLOPT_URL, 'http://api.textmebot.com/send.php?recipient=+{$destino}&apikey={$token}&text={$legenda}&document=' . \$anexo{$i});" . PHP_EOL;
			$cmd_textmebot .= "curl_setopt(\$curl{$i}, CURLOPT_RETURNTRANSFER, true);" . PHP_EOL;
			$cmd_textmebot .= "curl_setopt(\$curl{$i}, CURLOPT_MAXREDIRS, 10);" . PHP_EOL;
			$cmd_textmebot .= "curl_setopt(\$curl{$i}, CURLOPT_TIMEOUT, 60);" . PHP_EOL;
			$cmd_textmebot .= "curl_setopt(\$curl{$i}, CURLOPT_HTTPGET, true);" . PHP_EOL;
			$cmd_textmebot .= "\$resposta{$i} = curl_exec(\$curl{$i});" . PHP_EOL;
			$cmd_textmebot .= "\$httpCode{$i} = curl_getinfo(\$curl{$i}, CURLINFO_HTTP_CODE);" . PHP_EOL;
			$cmd_textmebot .= "curl_close(\$curl{$i});" . PHP_EOL . PHP_EOL;

			$cmd_textmebot .= "sleep(3);" . PHP_EOL . PHP_EOL;

			$cmd_textmebot .= "\$curl{$i}9 = curl_init();" . PHP_EOL;
			$cmd_textmebot .= "curl_setopt(\$curl{$i}9, CURLOPT_URL, 'http://api.textmebot.com/send.php?recipient=+{$destino9}&apikey={$token}&text={$mensagem}');" . PHP_EOL;
			$cmd_textmebot .= "curl_setopt(\$curl{$i}9, CURLOPT_RETURNTRANSFER, true);" . PHP_EOL;
			$cmd_textmebot .= "curl_setopt(\$curl{$i}9, CURLOPT_MAXREDIRS, 10);" . PHP_EOL;
			$cmd_textmebot .= "curl_setopt(\$curl{$i}9, CURLOPT_TIMEOUT, 60);" . PHP_EOL;
			$cmd_textmebot .= "curl_setopt(\$curl{$i}9, CURLOPT_HTTPGET, true);" . PHP_EOL;
			$cmd_textmebot .= "curl_exec(\$curl{$i}9);" . PHP_EOL;
			$cmd_textmebot .= "curl_close(\$curl{$i}9);" . PHP_EOL . PHP_EOL;

		}

		return $cmd_textmebot;

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

		$log_textmebot = "\$log{$i} = MKAC_DBASE::prepare('INSERT INTO sis_enviadas (login, data, tipo, mensagem, uuid, xto) VALUES (:login, now(), :tipo, :mensagem, :uuid, :xto)');" . PHP_EOL;
		$log_textmebot .= "\$log{$i}->bindValue(':login', '{$v_login}');" . PHP_EOL;
		$log_textmebot .= "\$log{$i}->bindValue(':tipo', 'app');" . PHP_EOL;
		$log_textmebot .= "if(\$httpCode{$i} == 200 || \$httpCode{$i} == 201) {" . PHP_EOL;
		$log_textmebot .= "\t\$log{$i}->bindValue(':mensagem', '{$txt_titulo}{$l_mensagem}');" . PHP_EOL;
		$log_textmebot .= "} else {" . PHP_EOL;
		$log_textmebot .= "\t\$log{$i}->bindValue(':mensagem', \"{$txt_titulo}codigo (\$httpCode{$i}) \$resposta{$i}\");" . PHP_EOL;
		$log_textmebot .= "}" . PHP_EOL;
		$log_textmebot .= "\$log{$i}->bindValue(':uuid', '" . $this->uuid . "');" . PHP_EOL;
		$log_textmebot .= "\$log{$i}->bindValue(':xto', '" . $this->destino . "');" . PHP_EOL;
		$log_textmebot .= "\$log{$i}->execute();" . PHP_EOL;

		return $log_textmebot;

	}

}

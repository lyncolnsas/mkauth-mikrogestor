<?php

class TRACCARSMS {

	public function gerarTXT() : string {

		$para = $this->para;
		$texto = $this->texto;

		$file_traccar = $this->arquivo;

		$v_validade = intval(time() + (60 * 60 * 18));

		$celular = '+' . MY_COD_PAIS . $para;
		$Host = str_replace('http://', false, str_replace('https://', false, $this->servidor));

		$cmd_traccar = "#!/usr/bin/env /opt/php8/bin/php" . PHP_EOL;
		$cmd_traccar .= "<?php" . PHP_EOL;
		$cmd_traccar .= "# SISTEMA MK-AUTH - TRACCAR" . PHP_EOL;
		$cmd_traccar .= "include('/opt/mk-auth/include/configure.php');" . PHP_EOL;
		$cmd_traccar .= "include('/opt/mk-auth/include/conexao.php');" . PHP_EOL;
		$cmd_traccar .= PHP_EOL;
		$cmd_traccar .= "\$psax = shell_exec(' ps ax | grep SMS/[T]RACCAR | wc -l ');" . PHP_EOL;
		$cmd_traccar .= "if (\$psax > 5) die();" . PHP_EOL;
		$cmd_traccar .= PHP_EOL;
		$cmd_traccar .= "unlink('{$file_traccar}');" . PHP_EOL;
		$cmd_traccar .= "if (time() > {$v_validade}) exit();" . PHP_EOL;
		$cmd_traccar .= PHP_EOL;
		$cmd_traccar .= "sleep(3);" . PHP_EOL;
		$cmd_traccar .= PHP_EOL;
		$cmd_traccar .= "\$curl = curl_init();" . PHP_EOL;
		$cmd_traccar .= "curl_setopt(\$curl, CURLOPT_URL, \"http://{$Host}\");" . PHP_EOL;
		$cmd_traccar .= "curl_setopt(\$curl, CURLOPT_POSTFIELDS, json_encode(array('to' => '{$celular}', 'message' => '{$texto}')));" . PHP_EOL;
		$cmd_traccar .= "curl_setopt(\$curl, CURLOPT_RETURNTRANSFER, true);" . PHP_EOL;
		$cmd_traccar .= "curl_setopt(\$curl, CURLOPT_CONNECTTIMEOUT, 6); " . PHP_EOL;
		$cmd_traccar .= "curl_setopt(\$curl, CURLOPT_TIMEOUT, 60);" . PHP_EOL;
		$cmd_traccar .= "curl_setopt(\$curl, CURLOPT_HTTPHEADER, array(\"Authorization: {$this->apiKey}\"));" . PHP_EOL;
		$cmd_traccar .= "curl_exec(\$curl);" . PHP_EOL;
		$cmd_traccar .= "curl_close(\$curl);" . PHP_EOL;
		$cmd_traccar .= PHP_EOL;

		return $cmd_traccar;

	}

}

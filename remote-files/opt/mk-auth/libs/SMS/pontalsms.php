<?php

class PONTALSMS {

	public function gerarTXT() : string {

		$para = $this->para;
		$texto = $this->texto;

		$file_pontal = $this->arquivo;

		$v_validade = intval(time() + (60 * 60 * 18));

		$cmd_pontal = "#!/usr/bin/env /opt/php8/bin/php" . PHP_EOL;
		$cmd_pontal .= "<?php" . PHP_EOL;
		$cmd_pontal .= "# SISTEMA MK-AUTH - PONTAL" . PHP_EOL;
		$cmd_pontal .= "include('/opt/mk-auth/include/configure.php');" . PHP_EOL;
		$cmd_pontal .= "include('/opt/mk-auth/include/conexao.php');" . PHP_EOL;
		$cmd_pontal .= PHP_EOL;
		$cmd_pontal .= "\$psax = shell_exec(' ps ax | grep SMS/[P]ONTAL | wc -l ');" . PHP_EOL;
		$cmd_pontal .= "if (\$psax > 5) die();" . PHP_EOL;
		$cmd_pontal .= PHP_EOL;
		$cmd_pontal .= "unlink('{$file_pontal}');" . PHP_EOL;
		$cmd_pontal .= "if (time() > {$v_validade}) exit();" . PHP_EOL;
		$cmd_pontal .= PHP_EOL;
		$cmd_pontal .= "sleep(3);" . PHP_EOL;
		$cmd_pontal .= PHP_EOL;
		$cmd_pontal .= "\$curl = curl_init();" . PHP_EOL;
		$cmd_pontal .= "curl_setopt(\$curl, CURLOPT_URL, \"https://sms-api-pointer.pontaltech.com.br/v1/single-sms\");" . PHP_EOL;
		$cmd_pontal .= "curl_setopt(\$curl, CURLOPT_USERPWD, \"{$this->conta}:{$this->senha}\");" . PHP_EOL;
		$cmd_pontal .= "curl_setopt(\$curl, CURLOPT_RETURNTRANSFER, true);" . PHP_EOL;
		$cmd_pontal .= "curl_setopt(\$curl, CURLOPT_POST, true);" . PHP_EOL;
		$cmd_pontal .= "curl_setopt(\$curl, CURLOPT_POSTFIELDS, json_encode(array('to' => '{$para}', 'message' => '{$texto}')));" . PHP_EOL;
		$cmd_pontal .= "curl_setopt(\$curl, CURLOPT_SSL_VERIFYPEER, false);" . PHP_EOL;
		$cmd_pontal .= "curl_setopt(\$curl, CURLOPT_HTTPHEADER, array('Cache-Control: no-cache'));" . PHP_EOL;
		$cmd_pontal .= "curl_exec(\$curl);" . PHP_EOL;
		$cmd_pontal .= "curl_close(\$curl);" . PHP_EOL;
		$cmd_pontal .= PHP_EOL;

		return $cmd_pontal;

	}

}

<?php

class PLAYSMS {

	public function gerarTXT() : string {

		$para = $this->para;
		$texto = $this->texto;

		$file_playsms = $this->arquivo;

		$v_validade = intval(time() + (60 * 60 * 18));

		$Host = str_replace('http://', false, str_replace('https://', false, $this->servidor));
		$Body['app'] = 'webservices';
		$Body['u'] = $this->conta;
		$Body['p'] = $this->senha;
		$Body['h'] = $this->senha;
		$Body['ta'] = 'pv';
		$Body['op'] = 'pv';
		$Body['to'] = MY_COD_PAIS . $para;
		$Body['msg'] = $texto;
		$Body = http_build_query($Body);

		$cmd_playsms = "#!/usr/bin/env /opt/php8/bin/php" . PHP_EOL;
		$cmd_playsms .= "<?php" . PHP_EOL;
		$cmd_playsms .= "# SISTEMA MK-AUTH - PlaySMS" . PHP_EOL;
		$cmd_playsms .= "include('/opt/mk-auth/include/configure.php');" . PHP_EOL;
		$cmd_playsms .= "include('/opt/mk-auth/include/conexao.php');" . PHP_EOL;
		$cmd_playsms .= PHP_EOL;
		$cmd_playsms .= "\$psax = shell_exec(' ps ax | grep SMS/[P]LAYSMS | wc -l ');" . PHP_EOL;
		$cmd_playsms .= "if (\$psax > 5) die();" . PHP_EOL;
		$cmd_playsms .= PHP_EOL;
		$cmd_playsms .= "unlink('{$file_playsms}');" . PHP_EOL;
		$cmd_playsms .= "if (time() > {$v_validade}) exit();" . PHP_EOL;
		$cmd_playsms .= PHP_EOL;
		$cmd_playsms .= "sleep(3);" . PHP_EOL;
		$cmd_playsms .= PHP_EOL;
		$cmd_playsms .= "\$curl = curl_init();" . PHP_EOL;
		$cmd_playsms .= "curl_setopt(\$curl, CURLOPT_URL, \"http://{$Host}/index.php?{$Body}\");" . PHP_EOL;
		$cmd_playsms .= "curl_setopt(\$curl, CURLOPT_RETURNTRANSFER, true);" . PHP_EOL;
		$cmd_playsms .= "curl_setopt(\$curl, CURLOPT_CONNECTTIMEOUT, 6); " . PHP_EOL;
		$cmd_playsms .= "curl_setopt(\$curl, CURLOPT_TIMEOUT, 60);" . PHP_EOL;
		$cmd_playsms .= "curl_exec(\$curl);" . PHP_EOL;
		$cmd_playsms .= "curl_close(\$curl);" . PHP_EOL;
		$cmd_playsms .= PHP_EOL;

		return $cmd_playsms;

	}

}

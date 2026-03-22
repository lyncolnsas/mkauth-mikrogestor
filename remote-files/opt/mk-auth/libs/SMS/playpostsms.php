<?php

class PLAYPOSTSMS {

	public function gerarTXT() : string {

		$para = $this->para;
		$texto = $this->texto;

		$file_playpost = $this->arquivo;

		$v_validade = intval(time() + (60 * 60 * 18));

		$Body['u'] = $this->conta;
		$Body['p'] = $this->senha;
		$Body['to'] = MY_COD_PAIS . $para;
		$Body['msg'] = $texto;
		$Body['token'] = $this->conta;
		$Body['celular'] = '+' . MY_COD_PAIS . $para;
		$Body['mensagem'] = $texto;
		$Body = http_build_query($Body);

		$cmd_playpost = "#!/usr/bin/env /opt/php8/bin/php" . PHP_EOL;
		$cmd_playpost .= "<?php" . PHP_EOL;
		$cmd_playpost .= "# SISTEMA MK-AUTH - PlayPOST" . PHP_EOL;
		$cmd_playpost .= "include('/opt/mk-auth/include/configure.php');" . PHP_EOL;
		$cmd_playpost .= "include('/opt/mk-auth/include/conexao.php');" . PHP_EOL;
		$cmd_playpost .= PHP_EOL;
		$cmd_playpost .= "\$psax = shell_exec(' ps ax | grep SMS/[P]LAYPOST | wc -l ');" . PHP_EOL;
		$cmd_playpost .= "if (\$psax > 5) die();" . PHP_EOL;
		$cmd_playpost .= PHP_EOL;
		$cmd_playpost .= "unlink('{$file_playpost}');" . PHP_EOL;
		$cmd_playpost .= "if (time() > {$v_validade}) exit();" . PHP_EOL;
		$cmd_playpost .= PHP_EOL;
		$cmd_playpost .= "sleep(3);" . PHP_EOL;
		$cmd_playpost .= PHP_EOL;
		$cmd_playpost .= "\$curl = curl_init();" . PHP_EOL;
		$cmd_playpost .= "curl_setopt(\$curl, CURLOPT_URL, \"{$this->servidor}\");" . PHP_EOL;
		$cmd_playpost .= "curl_setopt(\$curl, CURLOPT_POST, true);" . PHP_EOL;
		$cmd_playpost .= "curl_setopt(\$curl, CURLOPT_POSTFIELDS, \"{$Body}\");" . PHP_EOL;
		$cmd_playpost .= "curl_setopt(\$curl, CURLOPT_FOLLOWLOCATION, true);" . PHP_EOL;
		$cmd_playpost .= "curl_setopt(\$curl, CURLOPT_RETURNTRANSFER, true);" . PHP_EOL;
		$cmd_playpost .= "curl_setopt(\$curl, CURLOPT_SSL_VERIFYPEER, false);" . PHP_EOL;
		$cmd_playpost .= "curl_setopt(\$curl, CURLOPT_HEADER, false);" . PHP_EOL;
		$cmd_playpost .= "curl_exec(\$curl);" . PHP_EOL;
		$cmd_playpost .= "curl_close(\$curl);" . PHP_EOL;
		$cmd_playpost .= PHP_EOL;

		return $cmd_playpost;

	}

}

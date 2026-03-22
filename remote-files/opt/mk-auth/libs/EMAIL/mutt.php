<?php

class MUTT {

	public function gerarTXT() : string {

		$validade = intval(time() + (60 * 60 * 18));
		$sleep = mt_rand(3, 9);

		$file_msg = $this->file_msg;
		$file_mutt = $this->file_mutt;
		$anexo = $this->anexo;
		$assunto = $this->assunto;
		$email_dest = $this->email_dest;

		$binario = '/usr/bin/mutt2';
		if (KERNEL2LINUX == '3.16' || KERNEL2LINUX == '4.9') $binario = '/usr/bin/mutt';

		$cmd_mutt = "#!/usr/bin/env /opt/php8/bin/php" . PHP_EOL;
		$cmd_mutt .= "<?php" . PHP_EOL;
		$cmd_mutt .= "# Sistema MK-AUTH - MUTT" . PHP_EOL;
		$cmd_mutt .= "include('/opt/mk-auth/include/configure.php');" . PHP_EOL;
		$cmd_mutt .= "include('/opt/mk-auth/include/conexao.php');" . PHP_EOL;
		$cmd_mutt .= PHP_EOL;
		$cmd_mutt .= "if (time() > {$validade}) unlink('{$file_mutt}');" . PHP_EOL;
		$cmd_mutt .= PHP_EOL;

		if ($anexo) {

			$cmd_mutt .= "if (!file_exists('{$anexo}')) exit();" . PHP_EOL;
			$cmd_mutt .= PHP_EOL;

		}

		$cmd_mutt .= "\$psax = shell_exec(' ps ax | grep EMAIL/[M]UTT | wc -l ');" . PHP_EOL;
		$cmd_mutt .= "if (\$psax > 5) exit();" . PHP_EOL;
		$cmd_mutt .= PHP_EOL;
		$cmd_mutt .= "unlink('{$file_mutt}');" . PHP_EOL;
		$cmd_mutt .= PHP_EOL;
		$cmd_mutt .= "sleep({$sleep});" . PHP_EOL;
		$cmd_mutt .= PHP_EOL;

		if ($anexo) {

			$cmd_mutt .= "shell_exec(\"{$binario} -F /opt/mk-auth/etc/mutt.cfg -s '{$assunto}' {$email_dest} -a {$anexo} < {$file_msg}\");" . PHP_EOL;
			$cmd_mutt .= PHP_EOL;

		} else {

			$cmd_mutt .= "shell_exec(\"{$binario} -F /opt/mk-auth/etc/mutt.cfg -s '{$assunto}' {$email_dest} < {$file_msg}\");" . PHP_EOL;
			$cmd_mutt .= PHP_EOL;

		}

		return $cmd_mutt;

	}

}

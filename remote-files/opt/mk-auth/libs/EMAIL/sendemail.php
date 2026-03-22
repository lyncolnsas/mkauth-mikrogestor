<?php

class SENDEMAIL {

	public function gerarTXT() : string {

		$validade = intval(time() + (60 * 60 * 18));
		$sleep = mt_rand(3, 9);

		$file_msg = $this->file_msg;
		$file_sendemail = $this->file_sendemail;
		$anexo = $this->anexo;
		$assunto = $this->assunto;
		$email_dest = $this->email_dest;
		$realname = $this->realname;
		$end_email = $this->end_email;
		$servidor_email = $this->servidor_email;
		$porta_email = $this->porta_email;
		$tls_email = $this->tls_email;
		$usuario_email = $this->usuario_email;
		$senha_email = $this->senha_email;

		$cmd_sendemail = "#!/usr/bin/env /opt/php8/bin/php" . PHP_EOL;
		$cmd_sendemail .= "<?php" . PHP_EOL;
		$cmd_sendemail .= "# Sistema MK-AUTH - SENDEMAIL" . PHP_EOL;
		$cmd_sendemail .= "include('/opt/mk-auth/include/configure.php');" . PHP_EOL;
		$cmd_sendemail .= "include('/opt/mk-auth/include/conexao.php');" . PHP_EOL;
		$cmd_sendemail .= PHP_EOL;
		$cmd_sendemail .= "if (time() > {$validade}) unlink('{$file_sendemail}');" . PHP_EOL;
		$cmd_sendemail .= PHP_EOL;

		if ($anexo) {

			$cmd_sendemail .= "if (!file_exists('{$anexo}')) exit();" . PHP_EOL;
			$cmd_sendemail .= PHP_EOL;

		}

		$cmd_sendemail .= "\$psax = shell_exec(' ps ax | grep EMAIL/[S]ENDEMAIL | wc -l ');" . PHP_EOL;
		$cmd_sendemail .= "if (\$psax > 5) exit();" . PHP_EOL;
		$cmd_sendemail .= PHP_EOL;
		$cmd_sendemail .= "unlink('{$file_sendemail}');" . PHP_EOL;
		$cmd_sendemail .= PHP_EOL;
		$cmd_sendemail .= "sleep({$sleep});" . PHP_EOL;
		$cmd_sendemail .= PHP_EOL;

		if ($anexo) {

			$cmd_sendemail .= "shell_exec(\"sendEmail -f '{$realname} <{$end_email}>' -t {$email_dest} -u '{$assunto}' -a {$anexo} -s {$servidor_email}:{$porta_email} -o timeout=600 message-file='{$file_msg}' tls={$tls_email} -xu {$usuario_email} -xp '{$senha_email}'\");" . PHP_EOL;
			$cmd_sendemail .= PHP_EOL;

		} else {

			$cmd_sendemail .= "shell_exec(\"sendEmail -f '{$realname} <{$end_email}>' -t {$email_dest} -u '{$assunto}' -s {$servidor_email}:{$porta_email} -o timeout=60 message-file='{$file_msg}' tls={$tls_email} -xu {$usuario_email} -xp '{$senha_email}'\");" . PHP_EOL;
			$cmd_sendemail .= PHP_EOL;

		}

		return $cmd_sendemail;

	}

}

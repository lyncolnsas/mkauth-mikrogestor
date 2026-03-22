<?php

class PHPMAILER {

	public function gerarTXT() : string {

		$validade = intval(time() + (60 * 60 * 18));
		$sleep = mt_rand(3, 9);

		$file_msg = $this->file_msg;
		$file_phpmailer = $this->file_phpmailer;
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

		$cmd_phpmailer = "#!/usr/bin/env /opt/php8/bin/php" . PHP_EOL;
		$cmd_phpmailer .= "<?php" . PHP_EOL;
		$cmd_phpmailer .= "# Sistema MK-AUTH - PHPMailer" . PHP_EOL;
		$cmd_phpmailer .= "include('/opt/mk-auth/include/configure.php');" . PHP_EOL;
		$cmd_phpmailer .= "include('/opt/mk-auth/include/conexao.php');" . PHP_EOL;
		$cmd_phpmailer .= "include('/opt/mk-auth/libs/PHPMailer/phpmailer.php');" . PHP_EOL;
		$cmd_phpmailer .= PHP_EOL;
		$cmd_phpmailer .= "if (time() > {$validade}) unlink('{$file_phpmailer}');" . PHP_EOL;
		$cmd_phpmailer .= PHP_EOL;

		if ($anexo) {

			$cmd_phpmailer .= "if (!file_exists('{$anexo}')) exit();" . PHP_EOL;
			$cmd_phpmailer .= PHP_EOL;

		}

		$cmd_phpmailer .= "\$psax = shell_exec(' ps ax | grep EMAIL/[P]HPMAILER | wc -l ');" . PHP_EOL;
		$cmd_phpmailer .= "if (\$psax > 5) exit();" . PHP_EOL;
		$cmd_phpmailer .= PHP_EOL;
		$cmd_phpmailer .= "unlink('{$file_phpmailer}');" . PHP_EOL;
		$cmd_phpmailer .= PHP_EOL;
		$cmd_phpmailer .= "sleep({$sleep});" . PHP_EOL;
		$cmd_phpmailer .= PHP_EOL;

		$cmd_phpmailer .= "\$config_servidor = new stdClass();" . PHP_EOL;
		$cmd_phpmailer .= "\$config_servidor->host = '{$servidor_email}';" . PHP_EOL;
		$cmd_phpmailer .= "\$config_servidor->user = '{$usuario_email}';" . PHP_EOL;
		$cmd_phpmailer .= "\$config_servidor->pass = '{$senha_email}';" . PHP_EOL;
		$cmd_phpmailer .= "\$config_servidor->tls = '{$tls_email}';" . PHP_EOL;
		$cmd_phpmailer .= "\$config_servidor->port = '{$porta_email}';" . PHP_EOL;
		$cmd_phpmailer .= "\$config_servidor->name = '{$realname}';" . PHP_EOL;
		$cmd_phpmailer .= PHP_EOL;
		$cmd_phpmailer .= "\$message = new MKA\FMAIL\PHP2MAIL;" . PHP_EOL;
		$cmd_phpmailer .= "\$message->servidor = \$config_servidor;" . PHP_EOL;
		$cmd_phpmailer .= "\$message->to = '{$email_dest}';" . PHP_EOL;
		$cmd_phpmailer .= "\$message->from = '{$end_email}';" . PHP_EOL;
		$cmd_phpmailer .= "\$message->assunto = '{$assunto}';" . PHP_EOL;
		$cmd_phpmailer .= "\$message->mensagem = file_get_contents('{$file_msg}');" . PHP_EOL;
		if ($anexo) $cmd_phpmailer .= "\$message->anexo = '{$anexo}';" . PHP_EOL;
		$cmd_phpmailer .= "\$message->postar();" . PHP_EOL;
		$cmd_phpmailer .= PHP_EOL;

		return $cmd_phpmailer;

	}

}

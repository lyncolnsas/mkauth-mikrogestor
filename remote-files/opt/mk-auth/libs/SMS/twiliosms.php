<?php

class TWILIOSMS {

	public function gerarTXT() : string {

		$para = $this->para;
		$texto = $this->texto;

		$file_twilio = $this->arquivo;

		$celular = '+' . MY_COD_PAIS . $para;
		$v_validade = intval(time() + (60 * 60 * 18));

		$cmd_twilio = "#!/usr/bin/env /opt/php8/bin/php" . PHP_EOL;
		$cmd_twilio .= "<?php" . PHP_EOL;
		$cmd_twilio .= "# SISTEMA MK-AUTH - Twilio" . PHP_EOL;
		$cmd_twilio .= "include('/opt/mk-auth/include/configure.php');" . PHP_EOL;
		$cmd_twilio .= "include('/opt/mk-auth/include/conexao.php');" . PHP_EOL;
		$cmd_twilio .= "include('" . DIR2LIBS . "Twilio/autoload.php');" . PHP_EOL;
		$cmd_twilio .= PHP_EOL;
		$cmd_twilio .= "\$psax = shell_exec(' ps ax | grep SMS/[T]WILIO | wc -l ');" . PHP_EOL;
		$cmd_twilio .= "if (\$psax > 5) die();" . PHP_EOL;
		$cmd_twilio .= PHP_EOL;
		$cmd_twilio .= "unlink('{$file_twilio}');" . PHP_EOL;
		$cmd_twilio .= "if (time() > {$v_validade}) exit();" . PHP_EOL;
		$cmd_twilio .= PHP_EOL;
		$cmd_twilio .= "sleep(3);" . PHP_EOL;
		$cmd_twilio .= PHP_EOL;
		$cmd_twilio .= "use Twilio\Rest\Client;" . PHP_EOL;
		$cmd_twilio .= PHP_EOL;
		$cmd_twilio .= "\$client = new Client('{$this->conta}', '{$this->token}');" . PHP_EOL;
		$cmd_twilio .= "\$client -> messages -> create('{$celular}', array('from' => '{$this->numero}', 'body' => '{$texto}'));" . PHP_EOL;
		$cmd_twilio .= PHP_EOL;

		return $cmd_twilio;

	}

}

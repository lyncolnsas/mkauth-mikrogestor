<?php

class GATEWAYMESMS {

	public function gerarTXT() : string {

		$para = $this->para;
		$texto = $this->texto;
		$operadora = $this->operadora;

		$file_gatewayme = $this->arquivo;

		$v_validade = intval(time() + (60 * 60 * 18));

		$celular = '+' . MY_COD_PAIS . $para;
		$dispositivo = @$this->idDispositivo[$operadora];
		if ($dispositivo == null) $dispositivo = $this->idDispositivo[array_rand($this->idDispositivo)];

		$cmd_gatewayme = "#!/usr/bin/env /opt/php8/bin/php" . PHP_EOL;
		$cmd_gatewayme .= "<?php" . PHP_EOL;
		$cmd_gatewayme .= "# SISTEMA MK-AUTH - SMSGatewayMe" . PHP_EOL;
		$cmd_gatewayme .= "include('/opt/mk-auth/include/configure.php');" . PHP_EOL;
		$cmd_gatewayme .= "include('/opt/mk-auth/include/conexao.php');" . PHP_EOL;
		$cmd_gatewayme .= "include('" . DIR2LIBS . "SMSGatewayMe/autoload.php');" . PHP_EOL;
		$cmd_gatewayme .= PHP_EOL;
		$cmd_gatewayme .= "\$psax = shell_exec(' ps ax | grep SMS/[G]ATEWAYME | wc -l ');" . PHP_EOL;
		$cmd_gatewayme .= "if (\$psax > 5) die();" . PHP_EOL;
		$cmd_gatewayme .= PHP_EOL;
		$cmd_gatewayme .= "unlink('{$file_gatewayme}');" . PHP_EOL;
		$cmd_gatewayme .= "if (time() > {$v_validade}) exit();" . PHP_EOL;
		$cmd_gatewayme .= PHP_EOL;
		$cmd_gatewayme .= "sleep(3);" . PHP_EOL;
		$cmd_gatewayme .= PHP_EOL;
		$cmd_gatewayme .= "use SMSGatewayMe\Client\ApiClient;" . PHP_EOL;
		$cmd_gatewayme .= "use SMSGatewayMe\Client\Configuration;" . PHP_EOL;
		$cmd_gatewayme .= "use SMSGatewayMe\Client\Api\MessageApi;" . PHP_EOL;
		$cmd_gatewayme .= "use SMSGatewayMe\Client\Model\SendMessageRequest;" . PHP_EOL;
		$cmd_gatewayme .= PHP_EOL;
		$cmd_gatewayme .= "\$config = Configuration::getDefaultConfiguration();" . PHP_EOL;
		$cmd_gatewayme .= "\$config->setSSLVerification(false);" . PHP_EOL;
		$cmd_gatewayme .= "\$config->setApiKey('Authorization', '{$this->apiKey}');" . PHP_EOL;
		$cmd_gatewayme .= "\$apiClient = new ApiClient(\$config);" . PHP_EOL;
		$cmd_gatewayme .= "\$messageClient = new MessageApi(\$apiClient);" . PHP_EOL;
		$cmd_gatewayme .= PHP_EOL;
		$cmd_gatewayme .= "\$msg = new SendMessageRequest(['phoneNumber' => '{$celular}', 'message' => '{$texto}', 'deviceId' => {$dispositivo}]);" . PHP_EOL;
		$cmd_gatewayme .= "\$sendMessages = \$messageClient->sendMessages([\$msg]);" . PHP_EOL;
		$cmd_gatewayme .= PHP_EOL;

		return $cmd_gatewayme;

	}

}

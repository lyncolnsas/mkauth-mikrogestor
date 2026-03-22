<?php
namespace MKA\FMAIL;

class PHP2MAIL {

	public $servidor;
	public $to;
	public $from;
	public $assunto;
	public $mensagem;
	public $anexo = false;

	public function postar() {

		require_once('class.phpmailer.php');
		require_once('class.smtp.php');

		$server = $this->servidor;

		$mail = new \PHPMailer;

		$mail->SMTPOptions = array(
			'ssl' => array(
				'verify_peer' => false,
				'verify_peer_name' => false,
				'allow_self_signed' => true
			)
		);

		$mail->isSMTP();														// Set mailer to use SMTP
		$mail->SMTPAuth = true;													// Enable SMTP authentication
		$mail->Host = $server->host;											// Specify main and backup
		$mail->Username = $server->user;										// SMTP username
		$mail->Password = $server->pass;										// SMTP password
		if ($server->tls == 'yes') $mail->SMTPSecure = 'tls';					// Enable TLS encryption
		$mail->Port = $server->port;											// TCP port to connect to

		if (!empty($server->name)) {
			$mail->setFrom($this->from, $server->name);							// Address to send
		} else {
			$mail->setFrom($this->from);										// Address to send
		}

		$mail->addAddress($this->to);               							// Name is optional
		if (!empty($server->reply)) $mail->addReplyTo($server->reply);			// Address to reply
		if ($this->anexo != false) $mail->addAttachment($this->anexo);			// Add attachments

		$mail->isHTML(true);													// Set email format to HTML

		$mail->Subject = $this->assunto;
		$mail->Body    = $this->mensagem;
		$mail->send();

	}

}

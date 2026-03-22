/** HOTSITE CRIADO POR PEDRO FILHO
* Licensed under the MIT license: http://www.opensource.org/licenses/mit-license.php
*/


// FUNCAO QUE VERIFICA SE DADO UM STRING EH STRING NUMERICO ---------------------------------------
function numero(string) {
	if (!string) return false;
	var Chars = "0123456789";

	for (var i = 0; i < string.length; i++) {
		if (Chars.indexOf(string.charAt(i)) == -1) return false;
	}
	return true;
}


// VALIDA OS DADOS DO FORMULARIO ------------------------------------------------------------------
function verifica_form(form) {
	var passed = false;
	var ok = false
	var campo
	for (var i = 0; i < form.length; i++) {
		campo = form[i].getAttribute("name");
		if (form[i].getAttribute("df_verificar") == "sim") {
			if (form[i].getAttribute("type") == "text" | form[i].getAttribute("type") == "textarea" | form[i].type == "password") {
				if (form[i].value == "" | form[i].value == "http://") {
					form[campo].focus();
					$.jGrowl('Preencha todos os campos requeridos corretamente');
					return passed;
				}
			}

			var msg = ""
			if (form[campo].getAttribute("df_validar") == "cpf") msg = checa_cpf(form[campo].value);
			if (form[campo].getAttribute("df_validar") == "senha") msg = valida_senha(form[campo].value);
			if (form[campo].getAttribute("df_validar") == "letras") msg = chega_letras(form[campo].value);
			if (form[campo].getAttribute("df_validar") == "mac") msg = valida_mac(form[campo].value);
			if (form[campo].getAttribute("df_validar") == "cnpj") msg = checa_cnpj(form[campo].value);
			if (form[campo].getAttribute("df_validar") == "cpf_cnpj") {
				msg = checa_cpf(form[campo].value);
				if (msg != "") msg = checa_cnpj(form[campo].value);
			}
			if (form[campo].getAttribute("df_validar") == "email") msg = checa_email(form[campo].value);
			if (form[campo].getAttribute("df_validar") == "numerico") msg = checa_numerico(form[campo].value);
			if (msg != "") {
				if (form[campo].getAttribute("df_validar") == "cpf_cnpj") msg = "informe corretamente o numero do CPF ou CNPJ";
				form[campo].focus();
				form[campo].select();
				$.jGrowl(msg);
				return passed;
			}
		}
	}
	passed = true;
	return passed;
}


// CHEGA SE DADO E NUMERICO -----------------------------------------------------------------------
function checa_numerico(String) {
	var mensagem = "Este campo aceita somente números"
	var msg = "";
	if (isNaN(String)) msg = mensagem;
	return msg;
}


// CHEGA SE DADO E UM TEXTO -----------------------------------------------------------------------
function chega_letras(String) {
	var regexTexto = /^[a-z' 'A-ZãÃáÁàÀêÊéÉèÈíÍìÌôÔõÕóÓòÒúÚùÙûÛçÇ.;:,ºª]+$/;
	var mensagem = "Este campo aceita somente letras"
	var msg = "";

	if (!regexTexto.test(String)) msg = mensagem;
	return msg;
}


// CHEGA SE AS SENHAS CONFEREM --------------------------------------------------------------------
function valida_senha(String) {
	var mensagem = "As senhas nao conferem!"
	var msg = "";
	if ((String) != document.getElementById('senha2').value) msg = mensagem;
	return msg;
}


// CHEGA SE DADO E UM E-MAIL ----------------------------------------------------------------------
function checa_email(campo) {
	var mensagem = "Informe corretamente endereco e-mail"
	var msg = "";
	var email = /^\w+[\+\.\w-]*@([\w-]+\.)*\w+[\w-]*\.([a-z]{2,4}|\d+)$/i

	var returnval = email.test(campo)
	if (returnval == false) {
		msg = mensagem;
	}

	return msg;
}


// CHEGA SE E UM CPF VALIDO -----------------------------------------------------------------------
function checa_cpf(CPF) {
	var mensagem = "informe corretamente o número do CPF"
	var msg = "";
	if (CPF.length != 11 || CPF == "00000000000" || CPF == "11111111111" || CPF == "22222222222" || CPF == "33333333333" || CPF == "44444444444" || CPF == "55555555555" || CPF == "66666666666" || CPF == "77777777777" || CPF == "88888888888" || CPF == "99999999999") msg = mensagem;
	soma = 0;
	for (y = 0; y < 9; y++)
	soma += parseInt(CPF.charAt(y)) * (10 - y);
	resto = 11 - (soma % 11);
	if (resto == 10 || resto == 11) resto = 0;
	if (resto != parseInt(CPF.charAt(9))) msg = mensagem;
	soma = 0;
	for (y = 0; y < 10; y++)
	soma += parseInt(CPF.charAt(y)) * (11 - y);
	resto = 11 - (soma % 11);
	if (resto == 10 || resto == 11) resto = 0;
	if (resto != parseInt(CPF.charAt(10))) msg = mensagem;
	return msg;
}


// CHEGA SE E UM CNPJ VALIDO ----------------------------------------------------------------------
function checa_cnpj(s) {
	var mensagem = "informe corretamente o número do CNPJ"
	var msg = "";
	var y;
	var c = s.substr(0, 12);
	var dv = s.substr(12, 2);
	var d1 = 0;
	for (y = 0; y < 12; y++) {
		d1 += c.charAt(11 - y) * (2 + (y % 8));
	}
	if (d1 == 0) msg = mensagem;
	d1 = 11 - (d1 % 11);
	if (d1 > 9) d1 = 0;
	if (dv.charAt(0) != d1) msg = mensagem;
	d1 *= 2;
	for (y = 0; y < 12; y++) {
		d1 += c.charAt(11 - y) * (2 + ((y + 1) % 8));
	}
	d1 = 11 - (d1 % 11);
	if (d1 > 9) d1 = 0;
	if (dv.charAt(1) != d1) msg = mensagem;
	return msg;
}


// CRIA UM LINK -----------------------------------------------------------------------------------
function link(vlink) {
	window.location.href = vlink;
}


// DESATIVA O BACKSPACE ---------------------------------------------------------------------------
function preventBackspace(e) {
	var evt = e || window.event;
		if (evt) {
			var keyCode = evt.charCode || evt.keyCode;
			if (keyCode === 8) {
			if (evt.preventDefault) {
				evt.preventDefault();
				} else {
				evt.returnValue = false;
				}
			}
		}
}


// RELOAD DEPOIS DE ALGUNS SEGUNDOS ---------------------------------------------------------------
function reloadAqui() {
	setTimeout("location.reload(true);", 3000);
}

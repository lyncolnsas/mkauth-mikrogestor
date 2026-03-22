function Planos() {
    $.ajax({
        type: "GET",
        url: "planos.json.hhvm",
        headers: {
            Authorization: 'Bearer ' + sessionStorage.getItem("token")
        },
        dataType: "json",
        success: function (data) {
            if (data.error == undefined) {
                if (data.planos != undefined) {
                    data.planos.forEach(function (planos) {
                        if (planos.valor) {
                            var txt_plano = '<option value="' + planos.nome + '"> ' + planos.nome + ' - R$ ' + planos.valor + '</option>';
                        } else {
                            var txt_plano = '<option value="' + planos.nome + '"> ' + planos.nome + '</option>';
                        }
                        $("#plano").append(txt_plano)
                    });
                }
            } else {
                console.log(data.error.text);
            }
        }
    });
}

function dia_vencimento(){
        $.ajax({
            type: "GET",
            url: "empresa.json.hhvm",
            headers: {
                Authorization: 'Bearer ' + sessionStorage.getItem("token")
            },
            dataType: "json",
            success: function (data) {
                if (data.error == undefined) {
                    if (data.empresa != undefined) {
                        data.empresa.vencimentos.forEach(function (venc) {
                            $("#venc").append(`<option value="${venc}"> Todo dia ${venc}</option>`) 
                        });
                    }
                } else {
                    console.log(data.error.text);
                }
            }
        });
}
    
function CadastroEnviar() {
    $("input").blur(function () {
        if ($(this).val() == "") {
            $(this).addClass("is-invalid");
        } else {
            $(this).removeClass("is-invalid");
        }
    });

    $("#enviar").click(function () {
        window.unescape = window.unescape || window.decodeURI;
        var codigoPromocao = $("#promocod").val();
        var telefoneC = $("#telefone").val()
        if (codigoPromocao === '') {
            $("#promocod").val('Sem Codigo');
        }
        if (telefoneC === '') {
            $("#telefone").val('(00) 0000-000')
        }
        var contagem_erros = 0;
        $("#form input").each(function () {
            if ($(this).val() == "") {
                $(this).addClass("is-invalid");
                contagem_erros++;
            }
        });
        if (contagem_erros == 0) {
            if ($("#aceitou").prop("checked") == true) {
                cadastro_cliente = JSON.stringify({
                    venc: $("#venc").val(),
                    plano: $("#plano").val(),
                    q: $("#q").val(),
                    senha: $("#senha").val(),
                    nome: unescape(encodeURIComponent($("#nome").val())),
                    email: $("#email").val(),
                    cpf_cnpj: $("#cpf_cnpj").val(),
                    rg: $("#rg").val(),
                    nascimento: $("#cli_data_nasc").val(),
                    cep: $("#cep").val(),
                    endereco: unescape(encodeURIComponent($("#endereco").val())),
                    numero: $("#numero").val(),
                    complemento: unescape(encodeURIComponent($("#complemento").val())),
                    bairro: unescape(encodeURIComponent($("#bairro").val())),
                    cidade: unescape(encodeURIComponent($("#cidade").val())),
                    estado: $("#estado").val(),
                    telefone: $("#telefone").val(),
                    celular: $("#celular").val(),
                    promocod: $("#promocod").val(),
                    aceitou: $("#aceitou").val()
                });
                
                $.ajax({
                    type: "POST",
                    url: "cadastro.json.hhvm",
                    headers: {
                        Authorization: 'Bearer ' + sessionStorage.getItem("token")
                    },
                    dataType: "json",
                    data: cadastro_cliente,
                    success: function (data) {
                        if (data.error == undefined) {
                            alert('Cadastro feito com sucesso...');
                            $("#venc").val('');
                            $("#plano").val('');
                            $("#q").val('');
                            $("#senha").val('');
                            $("#nome").val('');
                            $("#email").val('');
                            $("#cpf_cnpj").val('');
                            $("#rg").val('');
                            $("#cli_data_nasc").val('');
                            $("#cep").val('');
                            $("#endereco").val('');
                            $("#numero").val('');
                            $("#complemento").val('');
                            $("#bairro").val('');
                            $("#cidade").val('');
                            $("#estado").val('');
                            $("#telefone").val('');
                            $("#celular").val('');
                            $("#promocod").val('');
                            $("#aceitou").prop( "checked", false );
                            $("#q").removeClass("is-valid");
                            $("#promocod").removeClass("is-invalid");
                        } else {
                            alert(data.error.text);
                            console.log(data.error.text);
                        }
                    }
                });
            } else if ($("#aceitou").prop("checked") == false) {
                $("#contrato").css({ "color": "red" })
                console.log("aceite os termos de uso");
            }
        } else {
            alert("Preencha todos os campos");
        }
    });
}

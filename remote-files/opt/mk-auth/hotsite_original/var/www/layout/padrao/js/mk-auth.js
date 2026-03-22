/*  - CRIADO POR: JOSE DE SOUSA SANTOS
    - Email: josesantos@mk-auth.com.br
*/

function getToken() {
    $.ajax({
        type: "POST",
        url: "auth.jwt.hhvm",
        success: function (data) {
            sessionStorage.setItem("token", data);
        }
    });
}

function refreshToken() { setInterval(getToken, 4 * 60 * 1000);}
refreshToken();
  
$("#enviar_news").click(function () {
	var retorno;
	var mpg_popup;
	window.name = "sistema";
	function fabrewin() {
		if (navigator.appName.indexOf("Netscape") != -1)
			mpg_popup = window.open("", "mpg_popup", "toolbar=0, location=0, directories=0, status=1, menubar=0, scrollbars=1, resizable=0, screenX=0, screenY=0, left=0, top=0, width=540, height=300");
		else
			mpg_popup = window.open("", "mpg_popup", "toolbar=0, location=0, directories=0, status=0, menubar=0, scrollbars=1, resizable=0, screenX=0, screenY=0, left=0, top=0, width=540, height=300");
		window.location = '#';
		return true;
	}
	fabrewin();
});

function nl2br(str, is_xhtml) {
    var breakTag = (is_xhtml || typeof is_xhtml === 'undefined') ? '<br />' : '<br>';
    return (str + '').replace(/([^>\r\n]?)(\r\n|\n\r|\r|\n)/g, '$1' + breakTag + '$2');
}

// links script
function linkPage() {
    $.ajax({
        type: "GET",
        url: "links.json.hhvm",
        headers: {
            Authorization: 'Bearer ' + sessionStorage.getItem("token")
        },
        dataType: "json",
        success: function (data) {
            if (data.error == undefined) {
                if (data.links != undefined) {
                    data.links.forEach(function (links) {
                        $("#LinksProvedor").append('<div class="btn btn-link textF"> <a class="textF" ' + "href=" + links.endereco +
                            " target=" + links.destino + ">" + decodeURIComponent(escape(atob(links.nome_base64))) + '<a><br /></div>');
                    });
                }
            } else {
                console.log(data.error.text);
            }
        }
    });
}
// links script fim

// Planos script
function PlanosPage() {
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
                            var planoAtual = '<p>- Por apenas R$' + planos.valor + '<br /> </p>';
                        } else {
                            var planoAtual = '';
                        }
                        $("#planosP").append(nl2br('<div class="col-lg-4 col-sm-6 wow fadeInUp" data-wow-delay="0.1s">' +
                            '<a class="cat-item d-block text-center rounded p-3" href=cadastro?plano=' + planos.nome + '>' +
                            '<div class="rounded p-5"> <h5 style="color: #000;">Veja abaixo os planos de acesso:</h5>' +
                            '<strong style="color: #0D6EFD;">Plano </strong> <strong>' + planos.nome + '</strong> <br /> <p>' + planos.descricao +
                            '<br />'+ planoAtual +'</p><button class="btn btn-primary border-0"><i class="bi bi-cart-plus"></i> ASSINE</button>' +
                            '</div> </a> </div>'));
                    });
                }
            } else {
                console.log(data.error.text);
            }
        }
    });
}
// Planos script end

// noticas script
function NoticiasPage() {
    $.ajax({
        type: "GET",
        url: "noticias.json.hhvm",
        headers: {
            Authorization: 'Bearer ' + sessionStorage.getItem("token")
        },
        dataType: "json",
        success: function (data) {
            const ordenar = data.noticias.sort((a, b) => b.data.localeCompare(a.data));
            const limitar = ordenar.slice(0, 5);
            if (data.error == undefined) {
                if (data.noticias != undefined) {
                    limitar.forEach(function (noticias) {
                        // let removerHora = noticias.data.replace("00:00:00", "");
                        let dataNoticia = new Date(noticias.data);
                        let dataFormatada = ((dataNoticia.getDate())) + "/" + ((dataNoticia.getMonth() + 1)) + "/" + dataNoticia.getFullYear();
                        $("#noticiasT").append('<span class="bi bi-newspaper pt-2">  '
                            + "<a href=noticia?uuid=" + noticias.uuid + '>' + decodeURIComponent(escape(atob(noticias.titulo_base64))) + '</a><p style="right; font-size: 10px; padding-top: 5px;">' + dataFormatada + '</p>');
                    });
                }
            } else {
                console.log(data.error.text);
            }
        }
    });
}
// noticas script fim

// Downloads script
function DownloadsPage() {
    $.ajax({
        type: "GET",
        url: "downloads.json.hhvm",
        headers: {
            Authorization: 'Bearer ' + sessionStorage.getItem("token")
        },
        dataType: "json",
        success: function (data) {
            if (data.error == undefined) {

                if (data.downloads != undefined) {
                    data.downloads.forEach(function (downloads) {
                        $("#DonwloadPagef").append('<span class="bi bi-download p-2">   </span> '
                            + "<a href=down?uuid=" + downloads.uuid + '>' + downloads.nome + "</a><br>");

                    });
                }
            } else {
                console.log(data.error.text);
            }
        }
    });
}
// Downloads script fim

// pegar uuid
function Urluuid() {
    const urlParam = new URLSearchParams(window.location.search);
    const param_uuid = urlParam.get('uuid');
    return param_uuid;
}

// pegar id
function UrlId() {
    const urlParam = new URLSearchParams(window.location.search);
    const param_Id = urlParam.get('id');
    return param_Id;
}

//Paginas script
function PaginasPage() {
    $.ajax({
        type: "GET",
        url: "paginas.json.hhvm",
        headers: {
            Authorization: 'Bearer ' + sessionStorage.getItem("token")
        },
        dataType: "json",
        success: function (data) {
            if (data.error == undefined) {
                if (data.paginas != undefined) {
                    data.paginas.forEach(function (paginas) {
                        $("#PaginasPage").append('<a class="dropdown-item" ' + "href=pagina?id=" + paginas.id + ">" + paginas.nome + '<a>');
                    });
                }
            } else {
                console.log(data.error.text);
            }
        }
    });
}
//Paginas script fim

//Dados da Empresa
function EmpresaDados() {
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
                    var Empresa = data.empresa;
                    $(".ProvedorNome").append("<span>" + Empresa.nome + "</span>");
                    $("#ProvedorFone, .ProvedorFone").append("<span>" + Empresa.fone + "</span>");
                    $("#ProvedorCelular").append("<span>" + Empresa.celular + "</span>");
                    $("#ProvedorEmail, .ProvedorEmail").append("<span>" + Empresa.email + "</span>");
                    $("#ProvedorEndereco, .ProvedorEndereco").append("<span> Endereço:<br/>" + Empresa.endereco + "   - Bairro: " + Empresa.bairro + "<br/> Cep:  " + Empresa.cep + "</span>");
                    $("#Logo").append('<img  style="width: 50px; border-radius: 10px;" src="data:image/jpg;base64,' + Empresa.logomarca + '"/>');
                    $("#Fav").append('<link rel="icon" type="image/png" sizes="16x16" href="data:image/png;base64, ' + Empresa.logomarca + '" />')
                    document.title = Empresa.nome;
                }
            } else {
                console.log(data.error.text);
            }
        }
    });
}
//Dados da Empresa fim

//ANO
const AnoP = $("#Ano");
if (AnoP !== undefined) {
    AnoAtual();
}

function AnoAtual() {
    anoAtual = new Date().getFullYear();
    $("#Ano").append(anoAtual);
}

const socialShare = $("#socialShare");
if (socialShare.length) {
    $("#socialShare").floatingSocialShare({
        buttons: [
          "facebook", "linkedin", "pinterest", "reddit",
          "telegram", "viber", "twitter", "vk", "whatsapp"
        ]
    });
}

//Buscador engine
var Consulta = document.querySelector('.consulta');
var searchBtn = document.querySelector('.searchBtn');
var SelecionarBuscador = document.getElementsByTagName('select');
var Buscador = "google";

SelecionarBuscador[0].addEventListener("change", function () {
    Buscador = this.value;
});
var Pesquisar = searchBtn.onclick = function () {
    if (Consulta.value == "") {
        // console.log("vazio")
    } else { Buscadores(); }

    function Buscadores() {
        switch (Buscador) {
            case 'google':
                let googleUrl = 'https://www.google.com/search?q=' + Consulta.value;
                window.open(googleUrl);
                break;
            case 'yahoo':
                let yahooUrl = 'https://br.search.yahoo.com/search?p=' + Consulta.value;
                window.open(yahooUrl);
                break;
            case 'big':
                let big = 'https://www.bing.com/search?q=' + Consulta.value;
                window.open(big);
                break;
            case 'duckgo':
                let duck = 'https://duckduckgo.com/?q=' + Consulta.value;
                window.open(duck);
                break;
            case 'ask':
                let ask = 'https://www.ask.com/web?q=' + Consulta.value;
                window.open(ask);
                break;
            case 'you':
                let you = 'https://you.com/search?q=' + Consulta.value;
                window.open(you);
                // location.replace(you)
                break;
            default:
                console.log("Escolha um buscado");
        }
    }
}
    document.addEventListener("keypress", function (e) {
        if (e.key === 'Enter') {
            Pesquisar();
        }
    });
//Buscador engine fim

function EmpresaDadosPagina() {
    $.ajax({
        type: "GET",
        url: "empresa.json.hhvm",
        headers: {
            Authorization: 'Bearer ' + sessionStorage.getItem("token")
        },
        dataType: "json",
        success: function (data) {
            if (data.error == undefined) {
                if (data.paginas != undefined) {
                    var Paginas = data.paginas;
                    $("#paginaEmpresa").append(Paginas.pg_empresa);
                    $("#PaginaTecnologia").append(Paginas.pg_tecnologia);
                    $("#PaginaCobertura").append(Paginas.pg_cobertura);
                    $("#paginaFaq").append(Paginas.pg_faq);
                    $("#paginaSuporte").append(Paginas.pg_suporte);
                    $("#paginaConfirmacao").append(Paginas.pg_confirmacao);

                }
            } else {
                console.log(data.error.text);
            }
        }
    });
}
function FaleConosco() {
    $("input").blur(function () {
        if ($(this).val() == "") {
            $(this).addClass("is-invalid");
        } else {
            $(this).removeClass("is-invalid");
        }
    });
    $("#enviar").click(function () {
        var contagem_erros = 0;
        $("#form input, textarea").each(function () {
            if ($(this).val() == "") {
                $(this).addClass("is-invalid");
                contagem_erros++;
            }
        });
        if (contagem_erros == 0) {
            dados_assunto = JSON.stringify({
                nome: $("#nome").val(),
                telefone: $("#telefone").val(),
                assunto: $("#assunto").val(),
                msg: $("#msg").val(),
                email: $("#email").val(),
            });
            $.ajax({
                type: "POST",
                url: "fale.json.hhvm",
                headers: {
                    Authorization: 'Bearer ' + sessionStorage.getItem("token")
                },
                dataType: "json",
                data: dados_assunto,
                success: function (data) {
                    if (data.error == undefined) {
                        alert('Contato enviado com sucesso...');
                        $("#nome").val('');
                        $("#telefone").val('');
                        $("#assunto").val('');
                        $("#msg").val('');
                        $("#email").val('');

                    } else {
                        console.log(data.error.text);
                    }
                }
            });
        } else {
            alert("Preencha todos os campos");
        }
    });
}

//Pagina Noticia
function noticia(){
    $("#socialshare").floatingSocialShare({
        buttons: [
            "facebook", "linkedin", "pinterest", "reddit",
            "telegram", "twitter", "vk", "whatsapp"
        ]
    });
    var uuid_noticia = Urluuid();
    $.ajax({
        type: "GET",
        url: "noticias.json.hhvm",
        headers: {
            Authorization: 'Bearer ' + sessionStorage.getItem("token")
        },
        dataType: "json",
        success: function (data) {
            if (data.error == undefined) {
                if (data.noticias != undefined) {
                    data.noticias.forEach(function (noticias) {

                        if (uuid_noticia == noticias.uuid) {
                            $("#noticiasT").append("<h3>" + decodeURIComponent(escape(atob(noticias.titulo_base64))) + "</h3> <p>" + decodeURIComponent(escape(atob(noticias.noticia_base64))))
                            $("#Nocanto").append('</p> <strong> <p class="mt-5 position-absolute bottom-0 end-0">' + noticias.autor + "</p> </strong>")
                            $(".NoticiaT").append("<span>" + decodeURIComponent(escape(atob(noticias.titulo_base64))) + "</span>")
                        }

                    });
                }
            } else {
                console.log(data.error.text);
            }
        }
    });
}

//Pagina Noticias!
function noticiaS(){
    $.ajax({
        type: "GET",
        url: "noticias.json.hhvm",
        headers: {
            Authorization: 'Bearer ' + sessionStorage.getItem("token")
        },
        dataType: "json",
        success: function (data) {
            const ordenar = data.noticias.sort((a, b) => b.data.localeCompare(a.data));
            if (data.error == undefined) {
                if (data.noticias != undefined) {
                    ordenar.forEach(function (noticias) {
                            // let removerHora = noticias.data.replace("00:00:00", "");
                            let dataNoticia = new Date(noticias.data);
                            let dataFormatada = ((dataNoticia.getDate())) + "/" + ((dataNoticia.getMonth() + 1).toString().padStart(2, "0")) + "/" + dataNoticia.getFullYear();
                        $("#noticiasT").append('<span class="bi bi-newspaper pt-2">  '
                                + "<a href=noticia?uuid=" + noticias.uuid + '>' + decodeURIComponent(escape(atob(noticias.titulo_base64))) +
                                '</a><p style="right; font-size: 10px; padding-top: 5px;">' + dataFormatada + '</p>')
                    });
                }
            } else {
                console.log(data.error.text);
            }
        }
    });
}

//Pagina
function Pagina(){
    var Id_Page = UrlId();
    $.ajax({
        type: "GET",
        url: "paginas.json.hhvm",
        headers: {
            Authorization: 'Bearer ' + sessionStorage.getItem("token")
        },
        dataType: "json",
        success: function (data) {
            if (data.error == undefined) {
                if (data.paginas != undefined) {
                    data.paginas.forEach(function (paginas) {

                        if (Id_Page == paginas.id) {
                            $("#paginasP").append("<h4>" + paginas.nome + "</h4> <p>" + paginas.conteudo + '</p>');
                            $(".TituloP").append("<span>"+ paginas.nome +"</span>");
                        }

                    });
                }
            } else {
                console.log(data.error.text);
            }
        }
    });
}

function mascara_telefone(){
    numero = document.getElementById('telefone');
    if (numero.value.length == 0) {
        numero.value += '('
    } else if (numero.value.length == 3) {
        numero.value += ') '
    } else if (numero.value.length == 9) {
        numero.value += '-'
    }
}

function mascara_celular(){
    numero = document.getElementById('celular');
    if (numero.value.length == 0) {
        numero.value += '('
    } else if (numero.value.length == 3) {
        numero.value += ') '
    } else if (numero.value.length == 10) {
        numero.value += '-'
    }
}

function mascara_cep(){
    numero = document.getElementById('cep');
    if (numero.value.length == 5) {
        numero.value += '-';
    } 
}

function mascara_data() {
    data = document.getElementById('cli_data_nasc');
    if (data.value.length == 2) {
        data.value += '/';
    } else if (data.value.length == 5) {
        data.value += '/';
    }
        
}

const variavel = document.getElementById('variavel').children;
if (variavel.length >= 1) {
    $('#footerAnuncio').append(`<div id='fixedban' style='width:100%;margin:auto;text-align:center;float:none;overflow:hidden;display:scroll;position:fixed;bottom:0;z-index:999;-webkit-transform:translateZ(0);'>
    <div><a id='close-fixedban' onclick='document.getElementById("fixedban").style.display = "none";' style='cursor:pointer;'><img alt='close' src='data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADQAAAAPCAYAAACrxeyFAAABbmlDQ1BpY2MAACiRdZG7S8NQFMZ/rZWKVjroIOLQwdegIIriKBV0UYdawapLkr6EtA1Ji4ir4OIgOIguvgb/A10FVwVBUAQRN3dfi5R4blNoEb3h5vz47v0OJ1/AP2MaOScwAbl80Y5NRyOLiaVI8JUA7bTQx6hmONbs/FScf9fXPT5V7wZVr//v/blakinHAF+T8Jhh2UVhmYaZtaKleFu43chqSeEj4QFbBhS+Vrru8YvijMcfiu14bBL8qmckU8d6HRtZOyfcL9ydM0tGdR71JaFUfmFeaqfsLhxiTBMlgk6JVUyKDErNS2Z/+4YqvjkK4jHkbbGOLY4MWfEOiFqSrimpadFT8pisq9x/5+mkR4a97qEoND677nsPBHehvOO638euWz6Bhie4zNf8Bclp/FP0nZrWfQjhTTi/qmn6HlxsQcejpdlaRWqQ7U+n4e0MWhPQdgvNy15W1XNOHyC+Ib/oBvYPoFfuh1d+AGJ3aDfBUizlAAAACXBIWXMAAAsSAAALEgHS3X78AAADHUlEQVRIS92WTSilYRTHf5eRkY+JBUIoJVM+shAlJWEnko+SRGoMsTALZmFlgzRlJ8rKDDXTYDE2YqFJMwtSbIyvpJkxinzn28x77jPvve97Xwa3xsKp0317nuc85/mf8z//ru0N/MYNe+VGzEOEeDxEkofM8bgBPQ0MJKO93VLQlOZmxE3m4wMvX5q9oMC9ZhQVwdoa1Na6F2+IemK8QX+4twZsvKbGviVrAvJkZ4f53l77r918faG72/yAqSkYGbn/o/z8ICoKnj27f6xLhAnQ59evETCJL17Yj+2trjrAfMzJcYIxXrKwAHl5auXkxLljs0FICEgBTk/Nab29QcvD5qYmSS6a5KFNgcTJ3tWVM05AC+Bfv+Dy0grc3x+OjrDMkHRmTuuEgNI7I2A2Z2aur97ZGSwvK//+XZ1JTYWlJdjYgMND0OkqD3r3zp7Yvjc3Z74zKQl+/ICfP0G67eWl9icn4eBA3S/76elq/etXVRAZEylcZKQVkN4ZPdP6+PjNYORQbCxMTytvaFBUHBpSj8nIgOFhlTA+Hjo7oawMBgagsBDevzcDkvMtLfDtG6SlQVaW2p+Y0LifApmZEBQEbW3muNxc6OiwF8pEOTllnBkBE1tcTHZPj2OmLG2S9u/uquXjY0hOhrAwECpWVkJwsNqTBwmI7W2oqlK0EbBG6++Hvj6IjlbAIiJAqCsAm5ogLg6EkjEx5rjGRtVFzSyi4EozAaPPlC4UptuEatnZziX9+/wctraUCzUWF0GUUejmOjd69N6e+pIzYgKmtBQGB5UA1derb09PMyADdU2ApCMiBJ9KShw0M4IQWXeonKVVfxdmZ9XchIfD/DysrEBiopqJsTEQaddmlNFRSEiA1tabblLrz5+rX+mS0Fa6L4JhNEOBTKIgg9+ntdNVAASU+LVgXKstlCovBxGLt2/hyxeoqFDp6+pAKxrV1WrOhIK32YcPauC7uiA/H9bX/xlh+2//5YQuoaFKsuVBRuABASAuEnxxcRskRVU579qZayItonD77Xc8IQBEmq+z/X0Qv6uJ2IjfwR7df7k/tVJD6tgwbrIAAAAASUVORK5CYII=' title='close button' style='vertical-align:middle;'/></a></div>
    <div style='text-align:center;display:block;max-width:728px;height:auto;overflow:hidden;margin:auto'> 
    <div id="anuncio">
    
    <!-- O ANUNCIO ENTRA AQUI -->
    
  </div>`);
    $('#variavel').insertAfter('#anuncio');

}

const ativarRedes = $(".redes-sociais");
if (ativarRedes !== undefined) {
    setTimeout(socialShareP, 500)
}

function socialShareP() {
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
                    var redesSociais = data.empresa;
                    var { twitter, facebook, instagram, whatsapp, tiktok, linkedin, youtube, telegram, skype, kwai } = redesSociais;

                    var redesArray = [ twitter, facebook, instagram, whatsapp, tiktok, linkedin, youtube, telegram, skype, kwai ];

                    
                    redesArray.forEach(function (valor, índice) {
                        if (valor === undefined || valor === null) {
                          redesArray[índice] = "";
                        }
                    });
                    var [ twitter, facebook, instagram, whatsapp, tiktok, linkedin, youtube, telegram, skype, kwai ] = redesArray;

                    $("#skype").attr('href', `${skype}`);
                    var tik = tiktok.startsWith('@') ? tiktok : '@' + tiktok;
                    var you = youtube.startsWith('@') ? youtube : '@' + youtube;
                    var kwa = kwai.startsWith('@') ? kwai : '@' + kwai;
                                        
                    var numero = telegram.match(/\d+/g);
                    numero = numero && numero.length > 0 ? numero.join("") : "";
                    if (!numero.startsWith('55') && numero.length >= 10) { numero = '55' + numero; }

                    if (whatsapp.length === 0) {
                        $("#whatsapp").attr('href', `${whatsapp}`);
                    } else { $("#whatsapp").attr('href', `https://wa.me/${whatsapp}`); }

                    if (twitter.includes('https') || twitter.length === 0) {
                        $("#twitter").attr('href', `${twitter}`);
                    } else { $("#twitter").attr('href', `https://twitter.com/${twitter}`); }

                    if (facebook.includes('https') || facebook.length === 0) {
                        $("#facebook").attr('href', `${facebook}`);
                    } else { $("#facebook").attr('href', `https://www.facebook.com/${facebook}`); }

                    if (instagram.includes('https') || instagram.length === 0) {
                        $("#instagram").attr('href', `${instagram}`);
                    } else { $("#instagram").attr('href', `https://instagram.com/${instagram.replace("@", "")}`); }

                    if (tiktok.includes('https') || tiktok.length === 0) {
                        $("#tiktok").attr('href', `${tiktok}`.replace("@", ""));
                    } else { $("#tiktok").attr('href', `https://www.tiktok.com/${tik}`); }

                    if (linkedin.includes('https') || linkedin.length === 0) {
                        $("#linkedin").attr('href', `${linkedin}`);
                    } else { $("#linkedin").attr('href', `https://www.linkedin.com/in/${linkedin}`); }

                    if (youtube.includes('https') || youtube.length === 0) {
                        $("#youtube").attr('href', `${youtube}`);
                    } else { $("#youtube").attr('href', `https://youtube.com/${you}`); }
                    
                    if (numero.length === 0) {
                        $("#telegram").attr('href', `${telegram}`);
                    } else if (numero.length >= 10) {
                        $("#telegram").attr('href', `tg://resolve?phone=${numero}`);
                    } else { $("#telegram").attr('href', `tg://resolve?domain=${telegram.replace("@", "")}`); }

                    if (kwai.includes('https') || kwai.length === 0) {
                        $("#kwai").attr('href', `${kwai}`);
                    } else { $("#kwai").attr('href', `https://m.kwai.com/user/${kwa}`); }
                    
                    $("a[href='']").remove();
                }
            } else {
                console.log(data.error.text);
            }
        }
    });
}
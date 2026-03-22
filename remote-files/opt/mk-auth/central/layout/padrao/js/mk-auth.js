var linkElement = document.getElementById("theme");
var temaAtual = localStorage.getItem('tema');

$(".tema").click(function () {
  var temaAtual = localStorage.getItem('tema');

  if (temaAtual === "1") {
    temaEscuro();
    localStorage.setItem('tema', '0');
    $(".iconT").addClass('bi bi-moon-stars-fill')
    $(".iconT").removeClass('bi bi-brightness-high-fill')
  } else {
    temaClaro()
    localStorage.setItem('tema', '1');
    $(".iconT").addClass('bi bi-brightness-high-fill')
    $(".iconT").removeClass('bi bi-moon-stars-fill')
  }
});

$(document).ready(function () {
  var temaLocal = localStorage.getItem('tema');
  if (temaLocal === "0") {
    $(".iconT").addClass('bi bi-moon-stars-fill')
    temaEscuro();
  } else {
    $(".iconT").addClass('bi bi-brightness-high-fill');
    localStorage.setItem('tema', '1');
    temaClaro();
  }
});

 function temaEscuro() {
   linkElement.setAttribute('href', './layout/padrao/css/dark_mode.css');
 }
 function temaClaro() {
   linkElement.setAttribute('href', './layout/padrao/css/light_mode.css');
 }

var redes = document.getElementsByClassName('redes-sociais')
if(redes.length === 1){
  
  var instagram = $("#instagram").attr('href');
  var whatsapp = $("#whatsapp").attr('href');
  var tiktok = $("#tiktok").attr('href');
  var twitter = $("#twitter").attr('href');
  var facebook = $("#facebook").attr('href');
  var linkedin = $("#linkedin").attr('href');
  var youtube = $("#youtube").attr('href');
  var telegram = $("#telegram").attr('href');
  var skype = $("#skype").attr('href');
  var kwai = $("#kwai").attr('href');
  
  $("#skype").attr('href', `${skype}`);
  
  var numero = telegram.match(/\d+/g);
  numero = numero && numero.length > 0 ? numero.join("") : "";
  if (!numero.startsWith('55') && numero.length >= 10) { numero = '55' + numero; }
  
  var tik = tiktok.startsWith('@') ? tiktok : '@' + tiktok;
  var you = youtube.startsWith('@') ? youtube : '@' + youtube;
  var kwa = kwai.startsWith('@') ? kwai : '@' + kwai;
  
  if (whatsapp.length === 0) {
    $("#whatsapp").attr('href', `${whatsapp}`);
  } else { $("#whatsapp").attr('href', `https://wa.me/${whatsapp}`); }
  
  if (instagram.includes('https') || instagram.length === 0) {
    $("#instagram").attr('href', `${instagram}`);
  } else { $("#instagram").attr('href', `https://instagram.com/${instagram.replace("@", "")}`); }
  
  if (facebook.includes('https') || facebook.length === 0) {
    $("#facebook").attr('href', `${facebook}`);
  } else { $("#facebook").attr('href', `https://www.facebook.com/${facebook}`); }
  
  if (twitter.includes('https') || twitter.length === 0) {
    $("#twitter").attr('href', `${twitter}`);
  } else { $("#twitter").attr('href', `https://twitter.com/${twitter}`); }
  
  if (tiktok.includes('https') || tiktok.length === 0) {
    $("#tiktok").attr('href', `${tiktok}`);
  } else { $("#tiktok").attr('href', `https://www.tiktok.com/${tik}`); }
  
  if (linkedin.includes('https') || linkedin.length === 0) {
    $("#linkedin").attr('href', `${linkedin}`);
  } else { $("#linkedin").attr('href', `https://www.linkedin.com/in/${linkedin.replace("@", "")}`); }
  
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

var topo = $(".card-table tbody")[0];

if (topo != undefined) {
  var vencido = $(".card-table td:contains('vencido')").parent();
  if (vencido.length != 0) {
    $(vencido[vencido.length - 1]).addClass("vencido");
    topo.prepend(vencido[vencido.length -1]);
  }
}

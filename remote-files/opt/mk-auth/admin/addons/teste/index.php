<?php
// INCLUE FUNCOES DE ADDONS -----------------------------------------------------------------------
include('addons.class.php');
?>
<!DOCTYPE html>
<html lang="pt-BR" class="has-navbar-fixed-top">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="iso-8859-1">
<title>MK-AUTH :: <?php echo $Manifest->{'name'}; ?></title>

<link href="../../estilos/mk-auth.css" rel="stylesheet" type="text/css" />
<link href="../../estilos/font-awesome.css" rel="stylesheet" type="text/css" />
<link href="../../estilos/bi-icons.css" rel="stylesheet" type="text/css" />

<script src="../../scripts/jquery.js"></script>
<script src="../../scripts/mk-auth.js"></script>

</head>
<body>

<?php include('../../topo.php'); ?>

<nav class="breadcrumb has-bullet-separator is-centered" aria-label="breadcrumbs">
<ul>
<li><a href="#"> ADDON</a></li>
<li class="is-active"><a href="#" aria-current="page"> <?php echo strtoupper($Manifest->{'name'} . ' # ' . $Manifest->{'version'} . ' # ' . $Manifest->{'author'}); ?> </a></li>
</ul>
</nav>

<div class="columns">
<div class="column">
<p>Sistema:</p>
<p class="has-text-weight-bold is-size-3"><?php echo @php_uname()?></p>
</div>

<div class="column">
<p>PHP versao:</p>
<p class="has-text-weight-bold is-size-3"><?php echo phpversion() ?></p>
</div>

<div class="column">
<p>Server API:</p>
<p class="has-text-weight-bold is-size-3"><?php echo @php_sapi_name() ?></p>
</div>

<div class="column">
<p>Extensoes:</p>
<p class="has-text-weight-bold is-size-3"><?php $extensions = @get_loaded_extensions(); echo count($extensions); ?></p>
</div>
</div>

<?php include('../../baixo.php'); ?>

<script src="../../menu.js.hhvm"></script>

</body>
</html>
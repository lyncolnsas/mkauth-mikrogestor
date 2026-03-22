-- MySQL dump 10.18  Distrib 10.3.27-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: mkradius
-- ------------------------------------------------------
-- Server version	10.3.27-MariaDB-0+deb10u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `nas`
--

DROP TABLE IF EXISTS `nas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nas` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uuid_nas` varchar(64) DEFAULT NULL,
  `nasname` varchar(128) DEFAULT NULL,
  `shortname` varchar(32) DEFAULT NULL,
  `type` varchar(30) DEFAULT 'other',
  `ports` int(5) DEFAULT NULL,
  `secret` varchar(60) NOT NULL DEFAULT 'secret',
  `server` varchar(64) DEFAULT NULL,
  `community` varchar(50) DEFAULT NULL,
  `description` varchar(200) DEFAULT 'RADIUS Client',
  `tipo` varchar(2) DEFAULT 'pc',
  `maxclientes` int(11) DEFAULT 1000,
  `sshativo` enum('sim','nao') NOT NULL DEFAULT 'sim',
  `portassh` varchar(5) NOT NULL DEFAULT '22',
  `senha` varchar(255) DEFAULT NULL,
  `ftpativo` enum('sim','nao') DEFAULT 'nao',
  `endereco` varchar(255) DEFAULT NULL,
  `numero` varchar(20) DEFAULT NULL,
  `bairro` varchar(255) DEFAULT NULL,
  `cidade` varchar(255) DEFAULT NULL,
  `cep` varchar(9) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  `complemento` varchar(255) DEFAULT NULL,
  `idplaca` int(11) DEFAULT 1,
  `cidade_ibge` varchar(16) DEFAULT NULL,
  `mb_instalados` int(11) DEFAULT 99,
  `coordenadas` varchar(50) DEFAULT NULL,
  `ipfall` varchar(32) DEFAULT NULL,
  `id_cgnat` int(3) DEFAULT 0,
  `ip_inicial_valido` varchar(32) DEFAULT NULL,
  `ip_final_valido` varchar(32) DEFAULT NULL,
  `barra53` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nasname` (`nasname`)
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nas`
--

LOCK TABLES `nas` WRITE;
/*!40000 ALTER TABLE `nas` DISABLE KEYS */;
INSERT INTO `nas` VALUES (1,'bde45d0f-7b63-11f0-9115-00e04cab3b86','172.31.255.1','MikroTik','other',NULL,'123456',NULL,'public','RADIUS Client','pc',1000,'nao','22','123456','nao','Rua 121','194','Planalto Caucaia','Caucaia','61605-450','CE','(Cj Pedro Filho)',1,'2303709',99,'-3.7438693,-38.6661726',NULL,0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `nas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `radacct`
--

DROP TABLE IF EXISTS `radacct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `radacct` (
  `radacctid` bigint(21) NOT NULL AUTO_INCREMENT,
  `acctsessionid` varchar(64) DEFAULT NULL,
  `acctuniqueid` varchar(32) DEFAULT NULL,
  `username` varchar(64) DEFAULT NULL,
  `groupname` varchar(64) DEFAULT NULL,
  `realm` varchar(64) DEFAULT NULL,
  `nasipaddress` varchar(15) DEFAULT NULL,
  `nasportid` varchar(15) DEFAULT NULL,
  `nasporttype` varchar(32) DEFAULT NULL,
  `acctstarttime` datetime DEFAULT NULL,
  `acctupdatetime` datetime DEFAULT NULL,
  `acctstoptime` datetime DEFAULT NULL,
  `acctinterval` int(12) DEFAULT NULL,
  `acctsessiontime` int(12) DEFAULT NULL,
  `acctauthentic` varchar(32) DEFAULT NULL,
  `connectinfo_start` varchar(50) DEFAULT NULL,
  `connectinfo_stop` varchar(50) DEFAULT NULL,
  `acctinputoctets` bigint(20) DEFAULT NULL,
  `acctoutputoctets` bigint(20) DEFAULT NULL,
  `calledstationid` varchar(50) DEFAULT NULL,
  `callingstationid` varchar(50) DEFAULT NULL,
  `acctterminatecause` varchar(32) DEFAULT NULL,
  `servicetype` varchar(32) DEFAULT NULL,
  `framedprotocol` varchar(32) DEFAULT NULL,
  `framedipaddress` varchar(15) DEFAULT NULL,
  `acctstartdelay` int(12) DEFAULT NULL,
  `acctstopdelay` int(12) DEFAULT NULL,
  `xascendsessionsvrkey` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`radacctid`),
  UNIQUE KEY `acctuniqueid` (`acctuniqueid`),
  KEY `username` (`username`),
  KEY `framedipaddress` (`framedipaddress`),
  KEY `acctsessionid` (`acctsessionid`),
  KEY `acctsessiontime` (`acctsessiontime`),
  KEY `acctstarttime` (`acctstarttime`),
  KEY `acctinterval` (`acctinterval`),
  KEY `acctstoptime` (`acctstoptime`),
  KEY `nasipaddress` (`nasipaddress`)
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC DEFAULT CHARSET=latin1 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `radacct`
--

LOCK TABLES `radacct` WRITE;
/*!40000 ALTER TABLE `radacct` DISABLE KEYS */;
/*!40000 ALTER TABLE `radacct` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`127.0.0.1`*/ /*!50003 TRIGGER tig_acct AFTER INSERT ON radacct FOR EACH ROW BEGIN
	DECLARE var_id_radacct, var_port_start, var_port_end INT(11);
	DECLARE var_ip_interno, var_ip_valido VARCHAR(32);
	DECLARE var_pool6 VARCHAR(48);

	SELECT framedipaddress, ip_valid, port_start, port_end
	INTO var_ip_interno, var_ip_valido, var_port_start, var_port_end
	FROM radippool
	WHERE username = new.username AND framedipaddress = new.framedipaddress
	LIMIT 1;

	SELECT value
	INTO var_pool6
	FROM radreply
	WHERE username = new.username AND attribute = 'Delegated-IPv6-Prefix'
	LIMIT 1;

	SET var_id_radacct = new.radacctid;

	IF (new.username <> '') THEN
		IF (var_ip_interno <> '' AND var_ip_valido <> '' AND var_port_start <> '' AND var_port_end <> '') THEN
			INSERT INTO sis_logcgnat (id_radacct, login, ip_interno, ip_valido, port_start, port_end, daata)
			VALUES (var_id_radacct, new.username, var_ip_interno, var_ip_valido, var_port_start, var_port_end, now());
		END IF;

		IF (var_pool6 <> '') THEN
			INSERT INTO sis_logpd6 (id_radacct, login, pool6, daata)
			VALUES (var_id_radacct, new.username, var_pool6, now());
		END IF;
	END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `radcheck`
--

DROP TABLE IF EXISTS `radcheck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `radcheck` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) DEFAULT NULL,
  `attribute` varchar(64) DEFAULT NULL,
  `op` char(2) NOT NULL DEFAULT '==',
  `value` varchar(253) DEFAULT NULL,
  `ativo` enum('s','n') DEFAULT 's',
  `login` varchar(64) DEFAULT NULL,
  `tipo` enum('log','mac') NOT NULL DEFAULT 'log',
  PRIMARY KEY (`id`),
  KEY `username` (`username`(32)),
  KEY `login` (`login`)
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC DEFAULT CHARSET=latin1 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `radcheck`
--

LOCK TABLES `radcheck` WRITE;
/*!40000 ALTER TABLE `radcheck` DISABLE KEYS */;
/*!40000 ALTER TABLE `radcheck` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `radgroupcheck`
--

DROP TABLE IF EXISTS `radgroupcheck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `radgroupcheck` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupname` varchar(64) DEFAULT NULL,
  `attribute` varchar(64) DEFAULT NULL,
  `op` char(2) NOT NULL DEFAULT '==',
  `value` varchar(253) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `groupname` (`groupname`(32))
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC DEFAULT CHARSET=latin1 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `radgroupcheck`
--

LOCK TABLES `radgroupcheck` WRITE;
/*!40000 ALTER TABLE `radgroupcheck` DISABLE KEYS */;
/*!40000 ALTER TABLE `radgroupcheck` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `radgroupreply`
--

DROP TABLE IF EXISTS `radgroupreply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `radgroupreply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupname` varchar(64) DEFAULT NULL,
  `attribute` varchar(64) DEFAULT NULL,
  `op` char(2) NOT NULL DEFAULT '=',
  `value` varchar(253) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `groupname` (`groupname`(32))
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC DEFAULT CHARSET=latin1 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `radgroupreply`
--

LOCK TABLES `radgroupreply` WRITE;
/*!40000 ALTER TABLE `radgroupreply` DISABLE KEYS */;
/*!40000 ALTER TABLE `radgroupreply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `radippool`
--

DROP TABLE IF EXISTS `radippool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `radippool` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pool_name` varchar(30) DEFAULT NULL,
  `framedipaddress` varchar(15) DEFAULT NULL,
  `nasipaddress` varchar(15) DEFAULT NULL,
  `calledstationid` varchar(30) DEFAULT NULL,
  `callingstationid` varchar(30) DEFAULT NULL,
  `expiry_time` datetime DEFAULT NULL,
  `username` varchar(64) DEFAULT NULL,
  `pool_key` varchar(30) DEFAULT NULL,
  `ip_valid` varchar(16) DEFAULT NULL,
  `port_start` varchar(8) DEFAULT NULL,
  `port_end` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `radippool_poolname_expire` (`pool_name`,`expiry_time`),
  KEY `framedipaddress` (`framedipaddress`),
  KEY `radippool_nasip_poolkey_ipaddress` (`nasipaddress`,`pool_key`,`framedipaddress`)
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC DEFAULT CHARSET=latin1 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `radippool`
--

LOCK TABLES `radippool` WRITE;
/*!40000 ALTER TABLE `radippool` DISABLE KEYS */;
/*!40000 ALTER TABLE `radippool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `radpostauth`
--

DROP TABLE IF EXISTS `radpostauth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `radpostauth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) DEFAULT NULL,
  `pass` varchar(64) DEFAULT NULL,
  `reply` varchar(32) DEFAULT NULL,
  `authdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ip` varchar(50) DEFAULT NULL,
  `mac` varchar(50) DEFAULT NULL,
  `ramal` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`username`)
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC DEFAULT CHARSET=latin1 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `radpostauth`
--

LOCK TABLES `radpostauth` WRITE;
/*!40000 ALTER TABLE `radpostauth` DISABLE KEYS */;
/*!40000 ALTER TABLE `radpostauth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `radreply`
--

DROP TABLE IF EXISTS `radreply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `radreply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) DEFAULT NULL,
  `attribute` varchar(64) DEFAULT NULL,
  `op` char(2) NOT NULL DEFAULT '=',
  `value` varchar(253) DEFAULT NULL,
  `login` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`username`(32)),
  KEY `login` (`login`)
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC DEFAULT CHARSET=latin1 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `radreply`
--

LOCK TABLES `radreply` WRITE;
/*!40000 ALTER TABLE `radreply` DISABLE KEYS */;
/*!40000 ALTER TABLE `radreply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `radusergroup`
--

DROP TABLE IF EXISTS `radusergroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `radusergroup` (
  `username` varchar(64) DEFAULT NULL,
  `groupname` varchar(64) DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT 1,
  `login` varchar(64) DEFAULT NULL,
  KEY `username` (`username`(32)),
  KEY `login` (`login`)
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC DEFAULT CHARSET=latin1 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `radusergroup`
--

LOCK TABLES `radusergroup` WRITE;
/*!40000 ALTER TABLE `radusergroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `radusergroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_acesso`
--

DROP TABLE IF EXISTS `sis_acesso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_acesso` (
  `idacesso` int(11) NOT NULL AUTO_INCREMENT,
  `uuid_acesso` varchar(48) DEFAULT NULL,
  `validade` datetime DEFAULT '2050-12-31 00:00:00',
  `login` varchar(255) DEFAULT NULL,
  `sha` varchar(255) DEFAULT NULL,
  `ultacesso` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nivel` varchar(255) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `horario` enum('sim','nao') DEFAULT 'nao',
  `tempoil` varchar(5) DEFAULT NULL,
  `tempofl` varchar(5) DEFAULT NULL,
  `ativo` enum('sim','nao') DEFAULT 'sim',
  `key_onetime` varchar(32) DEFAULT NULL,
  `ga` enum('1','0') DEFAULT '0',
  `cli_grupos` varchar(255) DEFAULT 'full_clientes',
  `sesid` varchar(64) DEFAULT '5k0ahkfa9d9r0i6mucm0khlcdralfnf1',
  `func` int(11) DEFAULT 0,
  `avatar` varchar(64) DEFAULT 'user.gif',
  PRIMARY KEY (`idacesso`),
  KEY `login` (`login`),
  KEY `uuid_acesso` (`uuid_acesso`)
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_acesso`
--

LOCK TABLES `sis_acesso` WRITE;
/*!40000 ALTER TABLE `sis_acesso` DISABLE KEYS */;
INSERT INTO `sis_acesso` VALUES (3,'6d1181f2-a78a-11e9-a384-9c8e99c30a7c','2050-12-31 00:00:00','admin','$2y$10$b9f6ed7a601d7a798ca67ehkRUc.vp0URUa5ruT6Kv7rcMgM2mMaC','21/08 15:15','admin@mk-auth.com.br','21232f297a57a5a743894a0e4a801fc3','sistema','nao',NULL,NULL,'sim',NULL,'0','full_clientes','nl7i8o7drtqg0hej7o4jb4p3sj',0,'user.gif');
/*!40000 ALTER TABLE `sis_acesso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_adicional`
--

DROP TABLE IF EXISTS `sis_adicional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_adicional` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` enum('hotspot','pppoe') NOT NULL DEFAULT 'hotspot',
  `username` varchar(64) DEFAULT NULL,
  `senha` varchar(32) DEFAULT NULL,
  `ip` varchar(15) DEFAULT NULL,
  `mac` varchar(17) DEFAULT NULL,
  `ramal` varchar(15) DEFAULT NULL,
  `chavetipo` varchar(10) DEFAULT NULL,
  `chave` varchar(255) DEFAULT NULL,
  `login` varchar(64) DEFAULT NULL,
  `plano` varchar(253) DEFAULT NULL,
  `simultaneo` enum('sim','nao') NOT NULL DEFAULT 'nao',
  `accesslist` enum('sim','nao') NOT NULL DEFAULT 'sim',
  `bloqueado` enum('sim','nao') DEFAULT 'nao',
  `telefone` varchar(23) DEFAULT NULL,
  `celular` varchar(32) DEFAULT NULL,
  `end_endereco` varchar(255) DEFAULT NULL,
  `end_numero` varchar(15) DEFAULT NULL,
  `end_complemento` varchar(127) DEFAULT NULL,
  `end_bairro` varchar(127) DEFAULT NULL,
  `end_cidade` varchar(63) DEFAULT NULL,
  `end_estado` varchar(8) DEFAULT NULL,
  `interface` varchar(128) DEFAULT NULL,
  `nome` varchar(128) DEFAULT NULL,
  `nome_res` varchar(255) DEFAULT NULL,
  `pool_name` varchar(30) DEFAULT 'nenhum',
  `pool6` varchar(48) DEFAULT NULL,
  `night` enum('sim','nao') DEFAULT 'nao',
  `coordenadas` varchar(64) DEFAULT NULL,
  `plano_bloqa` varchar(64) DEFAULT 'nenhum',
  `armario_olt` varchar(96) DEFAULT NULL,
  `porta_olt` varchar(32) DEFAULT NULL,
  `caixa_herm` varchar(128) DEFAULT NULL,
  `porta_splitter` varchar(32) DEFAULT NULL,
  `onu_ont` varchar(64) DEFAULT NULL,
  `switch` varchar(128) DEFAULT NULL,
  `uuid_adicional` varchar(48) DEFAULT NULL,
  `ipfall` varchar(32) DEFAULT NULL,
  `end_cep` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `login` (`login`),
  KEY `ip` (`ip`),
  KEY `mac` (`mac`),
  KEY `accesslist` (`accesslist`),
  KEY `tipo` (`tipo`),
  KEY `senha` (`senha`),
  KEY `plano` (`plano`),
  KEY `interface` (`interface`),
  KEY `plano_bloqa` (`plano_bloqa`),
  KEY `uuid_adicional` (`uuid_adicional`)
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC DEFAULT CHARSET=latin1 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_adicional`
--

LOCK TABLES `sis_adicional` WRITE;
/*!40000 ALTER TABLE `sis_adicional` DISABLE KEYS */;
/*!40000 ALTER TABLE `sis_adicional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_ativ`
--

DROP TABLE IF EXISTS `sis_ativ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_ativ` (
  `id` varchar(64) NOT NULL,
  `registro` longtext DEFAULT NULL,
  `data` datetime DEFAULT NULL,
  `login` varchar(64) DEFAULT NULL,
  `ip` varchar(64) DEFAULT NULL,
  `tipo` varchar(16) DEFAULT 'admin',
  `operacao` varchar(64) DEFAULT 'OPERNULL',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_ativ`
--

LOCK TABLES `sis_ativ` WRITE;
/*!40000 ALTER TABLE `sis_ativ` DISABLE KEYS */;
INSERT INTO `sis_ativ` VALUES ('019d07d0-71bc-7116-a009-92ae30c9c418','tentativa de login no webadmin com senha invalida','2026-03-19 17:36:34','admin','10.11.84.174','admin','OPERFALL');
/*!40000 ALTER TABLE `sis_ativ` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_boleto`
--

DROP TABLE IF EXISTS `sis_boleto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_boleto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid_boleto` varchar(48) DEFAULT NULL,
  `utilizar` varchar(10) DEFAULT NULL,
  `banco` varchar(32) DEFAULT NULL,
  `codigo_cedente` varchar(255) DEFAULT NULL,
  `agencia` varchar(32) DEFAULT NULL,
  `ag_digito` varchar(8) DEFAULT NULL,
  `conta` varchar(32) DEFAULT NULL,
  `ct_digito` varchar(8) DEFAULT NULL,
  `carteira` varchar(16) DEFAULT NULL,
  `convenio` varchar(64) DEFAULT NULL,
  `cedente` varchar(255) DEFAULT NULL,
  `contrato` varchar(255) DEFAULT NULL,
  `obs_linha1` text DEFAULT NULL,
  `obs_linha2` text DEFAULT NULL,
  `obs_linha3` text DEFAULT NULL,
  `obs_linha4` text DEFAULT NULL,
  `instr_linha1` text DEFAULT NULL,
  `instr_linha2` text DEFAULT NULL,
  `instr_linha3` text DEFAULT NULL,
  `instr_linha4` text DEFAULT NULL,
  `instr_linha5` text DEFAULT NULL,
  `taxa` varchar(20) DEFAULT NULL,
  `add_taxa` enum('s','n','t') DEFAULT 't',
  `nosso` varchar(255) DEFAULT NULL,
  `multa` varchar(20) DEFAULT NULL,
  `juros` varchar(20) DEFAULT NULL,
  `codigo_cliente` varchar(255) DEFAULT NULL,
  `ponto_venda` varchar(255) DEFAULT NULL,
  `nosso1` varchar(3) DEFAULT NULL,
  `nosso2` varchar(3) DEFAULT NULL,
  `nosso3` varchar(9) DEFAULT NULL,
  `constante1` varchar(1) DEFAULT NULL,
  `constante2` varchar(1) DEFAULT NULL,
  `byte` varchar(1) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `gateway` varchar(5) DEFAULT 'f2b',
  `pagseguro` varchar(255) DEFAULT NULL,
  `pagdigital` varchar(255) DEFAULT NULL,
  `modalidade` varchar(2) DEFAULT '02',
  `paypalconta` varchar(255) DEFAULT NULL,
  `diasatraso` int(11) DEFAULT 90,
  `layout` varchar(255) DEFAULT 'detalhado',
  `logosva` varchar(3) DEFAULT 'nao',
  `instauto` varchar(3) DEFAULT 'sim',
  `nossonumfinal` varchar(255) DEFAULT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  `variacao` varchar(5) DEFAULT '-019',
  `localpag` varchar(255) DEFAULT 'ANTES DO VENCIMENTO EM TODOS OS BANCOS',
  `titulo_inicial` int(11) DEFAULT NULL,
  `avalista` varchar(255) DEFAULT NULL,
  `desconto` decimal(12,2) DEFAULT 0.00,
  `tipodesc` enum('fixo','perc') DEFAULT 'fixo',
  `cpf_cnpj` varchar(50) DEFAULT NULL,
  `esp_doc` varchar(12) DEFAULT NULL,
  `token_gnet` varchar(32) DEFAULT NULL,
  `nome` varchar(50) DEFAULT 'conta corrente',
  `varalfa` varchar(2) DEFAULT 'aa',
  `token_bcash` varchar(70) DEFAULT NULL,
  `token_pagseguro` varchar(128) DEFAULT NULL,
  `calc_boleto` enum('sim','nao') DEFAULT 'sim',
  `last_update` datetime DEFAULT NULL,
  `referencia` enum('sim','nao') DEFAULT 'sim',
  `transmissao` varchar(64) DEFAULT NULL,
  `layout_pdf` varchar(255) DEFAULT 'pdf',
  `complemento` varchar(2) DEFAULT '00',
  `contra` enum('sim','nao') DEFAULT 'nao',
  `cnab` enum('240','400') DEFAULT '400',
  `num_remessa` int(11) DEFAULT NULL,
  `id_conta_gnet` varchar(32) DEFAULT NULL,
  `cliente_id_gnet` varchar(64) DEFAULT NULL,
  `cliente_secret_gnet` varchar(64) DEFAULT NULL,
  `cliente_id_teste_gnet` varchar(64) DEFAULT NULL,
  `cliente_secret_teste_gnet` varchar(64) DEFAULT NULL,
  `ocorrencia` varchar(128) DEFAULT NULL,
  `codbanco` varchar(3) DEFAULT NULL,
  `tipo_desc` enum('perc','fixo') DEFAULT 'fixo',
  `transmissao240` varchar(15) DEFAULT NULL,
  `transmissao400` varchar(20) DEFAULT NULL,
  `url_gnet` varchar(128) DEFAULT NULL,
  `email_gnet` tinyint(1) DEFAULT 0,
  `token_juno` text DEFAULT NULL,
  `token_sjuno` text DEFAULT NULL,
  `email_juno` tinyint(1) DEFAULT 0,
  `dias_baixa` varchar(3) DEFAULT NULL,
  `galax_id` varchar(32) DEFAULT NULL,
  `galax_hash` varchar(128) DEFAULT NULL,
  `galax_tokenwebhook` varchar(64) DEFAULT NULL,
  `iugu_token` varchar(128) DEFAULT NULL,
  `iugu_url` varchar(255) DEFAULT NULL,
  `layout_carne` varchar(96) DEFAULT '3folhas',
  `delconta` enum('s','n') DEFAULT 'n',
  PRIMARY KEY (`id`),
  KEY `uuid_boleto` (`uuid_boleto`)
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC DEFAULT CHARSET=latin1 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_boleto`
--

LOCK TABLES `sis_boleto` WRITE;
/*!40000 ALTER TABLE `sis_boleto` DISABLE KEYS */;
/*!40000 ALTER TABLE `sis_boleto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_caixa`
--

DROP TABLE IF EXISTS `sis_caixa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_caixa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid_caixa` varchar(48) DEFAULT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  `data` datetime DEFAULT NULL,
  `historico` varchar(255) DEFAULT NULL,
  `complemento` longtext DEFAULT NULL,
  `entrada` decimal(12,2) DEFAULT NULL,
  `saida` decimal(12,2) DEFAULT NULL,
  `tipomov` enum('aut','man') DEFAULT 'aut',
  `planodecontas` varchar(50) DEFAULT 'Outros',
  PRIMARY KEY (`id`),
  KEY `data` (`data`),
  KEY `uuid_caixa` (`uuid_caixa`)
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC DEFAULT CHARSET=latin1 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_caixa`
--

LOCK TABLES `sis_caixa` WRITE;
/*!40000 ALTER TABLE `sis_caixa` DISABLE KEYS */;
/*!40000 ALTER TABLE `sis_caixa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_carne`
--

DROP TABLE IF EXISTS `sis_carne`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_carne` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente` varchar(255) DEFAULT NULL,
  `login` varchar(100) DEFAULT NULL,
  `codigo` varchar(32) DEFAULT NULL,
  `emissao` datetime DEFAULT NULL,
  `parcelas` int(11) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `impresso` enum('sim','nao') DEFAULT 'nao',
  `banco` varchar(100) DEFAULT NULL,
  `urlcarne` varchar(255) DEFAULT NULL,
  `urlcapa` varchar(255) DEFAULT NULL,
  `delcarne` tinyint(1) DEFAULT 0,
  `uuid_carne` varchar(48) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `login` (`login`),
  KEY `codigo` (`codigo`),
  KEY `delcarne` (`delcarne`),
  KEY `uuid_carne` (`uuid_carne`)
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC DEFAULT CHARSET=latin1 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_carne`
--

LOCK TABLES `sis_carne` WRITE;
/*!40000 ALTER TABLE `sis_carne` DISABLE KEYS */;
/*!40000 ALTER TABLE `sis_carne` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_cliente`
--

DROP TABLE IF EXISTS `sis_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_cliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `bairro` varchar(255) DEFAULT NULL,
  `cidade` varchar(255) DEFAULT NULL,
  `cep` varchar(9) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  `cpf_cnpj` varchar(20) DEFAULT NULL,
  `fone` varchar(50) DEFAULT NULL,
  `obs` text DEFAULT NULL,
  `nascimento` varchar(32) DEFAULT NULL,
  `estado_civil` enum('S','C','D','V') DEFAULT 'S',
  `cadastro` varchar(32) DEFAULT NULL,
  `login` varchar(64) DEFAULT NULL,
  `tipo` varchar(10) DEFAULT NULL,
  `night` varchar(3) DEFAULT 'nao',
  `aviso` text DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `venc` varchar(2) DEFAULT '01',
  `mac` varchar(17) DEFAULT NULL,
  `complemento` varchar(255) DEFAULT NULL,
  `ip` varchar(20) DEFAULT NULL,
  `ramal` varchar(32) DEFAULT NULL,
  `rg` varchar(32) DEFAULT NULL,
  `isento` varchar(3) DEFAULT 'nao',
  `celular` varchar(32) DEFAULT NULL,
  `bloqueado` enum('sim','nao') DEFAULT 'nao',
  `autoip` enum('sim','nao') DEFAULT 'nao',
  `automac` enum('sim','nao') DEFAULT 'nao',
  `conta` varchar(11) DEFAULT '1',
  `ipvsix` varchar(255) DEFAULT NULL,
  `plano` varchar(64) DEFAULT NULL,
  `send` varchar(3) DEFAULT 'nao',
  `cli_ativado` enum('s','n') DEFAULT 's',
  `simultaneo` varchar(3) DEFAULT 'nao',
  `turbo` varchar(64) DEFAULT NULL,
  `comodato` varchar(3) DEFAULT 'nao',
  `observacao` enum('sim','nao') DEFAULT 'nao',
  `chavetipo` varchar(10) DEFAULT NULL,
  `chave` varchar(255) DEFAULT NULL,
  `contrato` varchar(32) NOT NULL,
  `ssid` varchar(64) DEFAULT NULL,
  `senha` varchar(32) DEFAULT NULL,
  `numero` varchar(20) DEFAULT NULL,
  `responsavel` varchar(255) DEFAULT NULL,
  `nome_pai` varchar(255) DEFAULT NULL,
  `nome_mae` varchar(255) DEFAULT NULL,
  `expedicao_rg` varchar(20) DEFAULT NULL,
  `naturalidade` varchar(50) DEFAULT NULL,
  `acessacen` varchar(50) DEFAULT 'sim',
  `pessoa` varchar(10) DEFAULT 'fisica',
  `endereco_res` varchar(255) DEFAULT NULL,
  `numero_res` varchar(20) DEFAULT NULL,
  `bairro_res` varchar(255) DEFAULT NULL,
  `cidade_res` varchar(255) DEFAULT NULL,
  `cep_res` varchar(9) DEFAULT NULL,
  `estado_res` varchar(2) DEFAULT NULL,
  `complemento_res` varchar(255) DEFAULT NULL,
  `desconto` decimal(12,2) DEFAULT 0.00,
  `acrescimo` decimal(12,2) DEFAULT 0.00,
  `equipamento` varchar(20) DEFAULT 'nenhum',
  `vendedor` varchar(255) DEFAULT NULL,
  `nextel` varchar(50) DEFAULT NULL,
  `accesslist` enum('sim','nao') NOT NULL DEFAULT 'nao',
  `resumo` varchar(6) DEFAULT '032011',
  `grupo` varchar(50) DEFAULT NULL,
  `codigo` varchar(50) DEFAULT NULL,
  `prilanc` enum('pro','tot') NOT NULL DEFAULT 'pro',
  `tipobloq` enum('aut','man') NOT NULL DEFAULT 'aut',
  `adesao` decimal(12,2) DEFAULT 0.00,
  `mbdisco` int(12) NOT NULL DEFAULT 100,
  `sms` enum('sim','nao') DEFAULT 'sim',
  `zap` enum('sim','nao') DEFAULT 'sim',
  `ltrafego` bigint(11) DEFAULT 0,
  `planodown` varchar(255) DEFAULT 'nenhum',
  `ligoudown` varchar(6) DEFAULT '012011',
  `statusdown` enum('on','off') NOT NULL DEFAULT 'off',
  `statusturbo` enum('on','off') NOT NULL DEFAULT 'off',
  `opcelular` varchar(100) DEFAULT 'nenhuma',
  `nome_res` varchar(255) DEFAULT NULL,
  `coordenadas` varchar(64) DEFAULT NULL,
  `rem_obs` datetime DEFAULT NULL,
  `valor_sva` decimal(12,2) DEFAULT 0.00,
  `dias_corte` int(3) DEFAULT 999,
  `user_ip` varchar(100) DEFAULT NULL,
  `user_mac` varchar(100) DEFAULT NULL,
  `data_ip` datetime DEFAULT NULL,
  `data_mac` datetime DEFAULT NULL,
  `last_update` datetime DEFAULT NULL,
  `data_bloq` datetime DEFAULT NULL,
  `tags` longtext DEFAULT NULL,
  `tecnico` varchar(255) DEFAULT NULL,
  `data_ins` datetime DEFAULT NULL,
  `altsenha` enum('sim','nao') DEFAULT NULL,
  `geranfe` enum('sim','nao') DEFAULT 'sim',
  `mesref` enum('now','ant') DEFAULT 'ant',
  `ipfall` varchar(32) DEFAULT NULL,
  `tit_abertos` int(12) DEFAULT NULL,
  `parc_abertas` int(12) DEFAULT NULL,
  `tipo_pessoa` int(1) DEFAULT NULL,
  `celular2` varchar(32) DEFAULT NULL,
  `mac_serial` varchar(255) DEFAULT NULL,
  `status_corte` enum('full','down','bloq') DEFAULT 'full',
  `plano15` varchar(255) DEFAULT 'nenhum',
  `pgaviso` enum('sim','nao') DEFAULT 'sim',
  `porta_olt` varchar(32) DEFAULT NULL,
  `caixa_herm` varchar(128) DEFAULT NULL,
  `porta_splitter` varchar(32) DEFAULT NULL,
  `onu_ont` varchar(64) DEFAULT NULL,
  `switch` varchar(128) DEFAULT NULL,
  `tit_vencidos` int(12) DEFAULT NULL,
  `pgcorte` enum('sim','nao') DEFAULT 'sim',
  `interface` varchar(128) DEFAULT NULL,
  `login_atend` varchar(63) DEFAULT 'full_users',
  `cidade_ibge` varchar(16) DEFAULT NULL,
  `estado_ibge` varchar(8) DEFAULT NULL,
  `data_desbloq` datetime DEFAULT '2015-01-01 00:00:00',
  `pool_name` varchar(30) DEFAULT 'nenhum',
  `pool6` varchar(48) DEFAULT NULL,
  `rec_email` enum('sim','nao') DEFAULT 'sim',
  `termo` varchar(16) DEFAULT NULL,
  `opcelular2` varchar(32) DEFAULT 'nenhuma',
  `dot_ref` varchar(128) DEFAULT NULL,
  `tipo_cliente` int(2) DEFAULT 99,
  `armario_olt` varchar(96) DEFAULT NULL,
  `conta_cartao` int(11) DEFAULT 0,
  `plano_bloqc` varchar(64) DEFAULT 'nenhum',
  `uuid_cliente` varchar(48) DEFAULT NULL,
  `data_desativacao` datetime DEFAULT NULL,
  `tipo_cob` enum('titulo','carne') DEFAULT NULL,
  `fortunus` tinyint(1) DEFAULT 0,
  `gsici` tinyint(1) DEFAULT 1,
  `local_dici` enum('u','r') DEFAULT 'u',
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`),
  KEY `nome` (`nome`),
  KEY `rg` (`rg`),
  KEY `ip` (`ip`),
  KEY `mac` (`mac`),
  KEY `accesslist` (`accesslist`),
  KEY `tipo` (`tipo`),
  KEY `senha` (`senha`),
  KEY `plano` (`plano`),
  KEY `ativo2` (`cli_ativado`),
  KEY `bloqueado` (`bloqueado`),
  KEY `observacao` (`observacao`),
  KEY `ramal` (`ramal`),
  KEY `desconto` (`desconto`),
  KEY `acrescimo` (`acrescimo`),
  KEY `pgaviso` (`pgaviso`),
  KEY `pgcorte` (`pgcorte`),
  KEY `interface` (`interface`),
  KEY `tit_abertos` (`tit_abertos`),
  KEY `parc_abertas` (`parc_abertas`),
  KEY `tit_vencidos` (`tit_vencidos`),
  KEY `login_atend` (`login_atend`),
  KEY `rec_email` (`rec_email`),
  KEY `plano_bloqc` (`plano_bloqc`),
  KEY `dot_ref` (`dot_ref`),
  KEY `uuid_cliente` (`uuid_cliente`)
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC DEFAULT CHARSET=latin1 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_cliente`
--

LOCK TABLES `sis_cliente` WRITE;
/*!40000 ALTER TABLE `sis_cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `sis_cliente` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`127.0.0.1`*/ /*!50003 TRIGGER tig_cliente AFTER UPDATE ON sis_cliente FOR EACH ROW BEGIN
	DECLARE senha_anterior, senha_atual, var_pgcorte, var_bloqueado varchar(64);

	SELECT value INTO senha_anterior FROM radcheck WHERE attribute = 'Password' AND username = new.login LIMIT 1;
	SET senha_atual = new.senha;

	SELECT valor INTO var_pgcorte FROM sis_opcao WHERE nome = 'pgcorte' LIMIT 1;
	SET var_bloqueado = new.bloqueado;

	IF (var_pgcorte = 'nao' AND var_bloqueado = 'sim') THEN
		UPDATE radcheck SET ativo = 'n' WHERE username = new.login;
	END IF;
	IF (BINARY(senha_atual) <> BINARY(senha_anterior)) THEN
		UPDATE radcheck SET value = senha_atual WHERE attribute = 'Password' AND username = new.login;
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `sis_configmsg`
--

DROP TABLE IF EXISTS `sis_configmsg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_configmsg` (
  `item` varchar(32) NOT NULL,
  `valor` longtext NOT NULL
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_configmsg`
--

LOCK TABLES `sis_configmsg` WRITE;
/*!40000 ALTER TABLE `sis_configmsg` DISABLE KEYS */;
/*!40000 ALTER TABLE `sis_configmsg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_contaspagar`
--

DROP TABLE IF EXISTS `sis_contaspagar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_contaspagar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid_contaspagar` varchar(48) DEFAULT NULL,
  `fornecedor` varchar(255) DEFAULT NULL,
  `zap` enum('sim','nao') DEFAULT 'nao',
  `celular` varchar(32) DEFAULT NULL,
  `vencimento` datetime DEFAULT NULL,
  `valor` decimal(12,2) DEFAULT NULL,
  `valorpago` decimal(12,2) DEFAULT 0.00,
  `emissao` datetime DEFAULT NULL,
  `nrdocumento` varchar(50) DEFAULT NULL,
  `usergerou` varchar(50) DEFAULT NULL,
  `historico` varchar(255) DEFAULT NULL,
  `planodecontas` varchar(255) DEFAULT NULL,
  `numparcelas` int(11) DEFAULT NULL,
  `observacao` text DEFAULT NULL,
  `parcatual` int(11) DEFAULT 1,
  `status` varchar(50) DEFAULT 'aberto',
  `datapg` datetime DEFAULT NULL,
  `tipodiv` enum('for','fun') DEFAULT 'for',
  `linhapgdig` varchar(64) DEFAULT NULL,
  `qrcode` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fornecedor` (`fornecedor`),
  KEY `nrdocumento` (`nrdocumento`),
  KEY `status` (`status`),
  KEY `uuid_contaspagar` (`uuid_contaspagar`)
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC DEFAULT CHARSET=latin1 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_contaspagar`
--

LOCK TABLES `sis_contaspagar` WRITE;
/*!40000 ALTER TABLE `sis_contaspagar` DISABLE KEYS */;
/*!40000 ALTER TABLE `sis_contaspagar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_contato`
--

DROP TABLE IF EXISTS `sis_contato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_contato` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid_contato` varchar(48) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `login` varchar(255) DEFAULT NULL,
  `telefone` varchar(255) DEFAULT NULL,
  `assunto` varchar(255) DEFAULT NULL,
  `msg` longtext DEFAULT NULL,
  `data` datetime DEFAULT NULL,
  `ip` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `arquivo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `login` (`login`),
  KEY `uuid_contato` (`uuid_contato`)
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC DEFAULT CHARSET=latin1 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_contato`
--

LOCK TABLES `sis_contato` WRITE;
/*!40000 ALTER TABLE `sis_contato` DISABLE KEYS */;
/*!40000 ALTER TABLE `sis_contato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_contrato`
--

DROP TABLE IF EXISTS `sis_contrato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_contrato` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(32) NOT NULL,
  `texto` longtext DEFAULT NULL,
  `data` datetime DEFAULT NULL,
  `ativo` varchar(3) DEFAULT 'sim',
  `nome` varchar(255) DEFAULT NULL,
  `padrao` enum('sim','nao') NOT NULL DEFAULT 'nao',
  PRIMARY KEY (`id`),
  KEY `codigo` (`codigo`)
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC AUTO_INCREMENT=22 DEFAULT CHARSET=latin1 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_contrato`
--

LOCK TABLES `sis_contrato` WRITE;
/*!40000 ALTER TABLE `sis_contrato` DISABLE KEYS */;
INSERT INTO `sis_contrato` VALUES (21,'FE1A6C51','<div class=\"quebrapagina\">\r\n<div style=\"border-right: medium none; padding-right: 0cm; border-top: medium none; padding-left: 0cm; padding-bottom: 1pt; border-left: medium none; padding-top: 0cm; border-bottom: 1pt solid\">\r\n<p align=\"center\" class=\"MsoNormal\" style=\"border-right: medium none; padding-right: 0cm; border-top: medium none; padding-left: 0cm; padding-bottom: 0cm; border-left: medium none; padding-top: 0cm; border-bottom: medium none; text-align: center\"><b><span style=\"font-size: 14pt; font-family: Verdana\">Contrato de Presta&ccedil;&atilde;o de Servi&ccedil;os de Conex&atilde;o &agrave; Internet</span></b><b><span style=\"font-size: 8pt; font-family: Verdana\"> </span></b></p>\r\n</div>\r\n<p align=\"center\" style=\"text-align: center\"><b><span style=\"font-size: 8pt; font-family: Verdana\">TERMO DE&nbsp;USO %termo%</span></b><strong><br />\r\n</strong></p>\r\n<p style=\"text-align: justify\"><b><span style=\"font-size: 9pt; font-family: Verdana\">%provedornome%</span></b><span style=\"font-size: 9pt; font-family: Verdana\">, inscrita no C.N.P.J. sob n&ordm; <b>%provedorcnpj%</b>, com sede a <b>%provedorendereco%</b> - </span><span style=\"font-size: 9pt; font-family: Verdana\"><b>%provedorbairro%</b></span><span style=\"font-size: 9pt; font-family: Verdana\"> - </span><span style=\"font-size: 9pt; font-family: Verdana\"><b>%provedorcidade%</b></span><span style=\"font-size: 9pt; font-family: Verdana\"> - </span><span style=\"font-size: 9pt; font-family: Verdana\"><b>%provedorestado%</b></span><span style=\"font-size: 9pt; font-family: Verdana\">, doravante designada simplesmente CONTRATADA e <b>%nomecliente%</b>, residente &agrave; <b>%enderecocliente%</b> - </span><span style=\"font-size: 9pt; font-family: Verdana\"><b>%bairrocliente%</b></span><span style=\"font-size: 9pt; font-family: Verdana\"> - </span><span style=\"font-size: 9pt; font-family: Verdana\"><b>%cidadecliente%</b></span><span style=\"font-size: 9pt; font-family: Verdana\"> - </span><span style=\"font-size: 9pt; font-family: Verdana\"><b>%estadocliente%</b></span><span style=\"font-size: 9pt; font-family: Verdana\">, CPF <b>%cpfcliente%</b>, doravante denominado simplesmente CONTRATANTE, celebram o presente contrato de presta&ccedil;&atilde;o de servi&ccedil;os que se reger&aacute; pelas seguintes cl&aacute;usulas e condi&ccedil;&otilde;es:</span></p>\r\n<p style=\"text-align: justify\">&nbsp;<b><span style=\"font-size: 9pt; font-family: Verdana\">1. OBJETO</span></b><strong><br />\r\n</strong></p>\r\n<p style=\"text-align: justify\"><span style=\"font-size: 9pt; font-family: Verdana\">O objeto do </span><span style=\"font-size: 9pt; font-family: Verdana\">presente contrato &eacute;</span><strong> </strong><span style=\"font-size: 9pt; font-family: Verdana\">a presta&ccedil;&atilde;o, pela CONTRATADA ao CONTRATANTE, os servi&ccedil;os de conex&atilde;o &agrave; rede mundial de computadores (INTERNET), atrav&eacute;s de rede Wireless.</span></p>\r\n<p style=\"text-align: justify\"><b><span style=\"font-size: 9pt; font-family: Verdana\">2. DISPONIBILIDADE DO SERVI&Ccedil;O</span></b></p>\r\n<p style=\"text-align: justify\"><span style=\"font-size: 9pt; font-family: Verdana\">2.1 - O servi&ccedil;o estar&aacute; dispon&iacute;vel 24 (vinte e quatro) horas por dia, 7 (sete) dias por semana, ressalvada a ocorr&ecirc;ncia de interrup&ccedil;&otilde;es devido a:</span></p>\r\n<p class=\"MsoNormal\" style=\"text-align: justify\"><span class=\"conteudointerno\"><span style=\"font-size: 9pt; font-family: Verdana\">a) falta de fornecimento de energia el&eacute;trica para a CONTRATADA;</span></span></p>\r\n<p class=\"MsoNormal\" style=\"text-align: justify\"><span style=\"font-size: 9pt; font-family: Verdana\"><br />\r\n<span class=\"conteudointerno\">b) falha dos servi&ccedil;os de responsabilidade da operadora de servi&ccedil;os telef&ocirc;nicos;</span></span></p>\r\n<p class=\"MsoNormal\" style=\"text-align: justify\"><span style=\"font-size: 9pt; font-family: Verdana\"><br />\r\n<span class=\"conteudointerno\">c) ocorr&ecirc;ncias de falhas no sistema de transmiss&atilde;o no acesso &agrave; Internet;</span></span></p>\r\n<p class=\"MsoNormal\" style=\"text-align: justify\"><span style=\"font-size: 9pt; font-family: Verdana\"><br />\r\n<span class=\"conteudointerno\">d) manuten&ccedil;&atilde;o t&eacute;cnica dos equipamentos e/ ou operacionais que exijam o desligamento tempor&aacute;rio do sistema de transmiss&atilde;o de dados;</span></span></p>\r\n<p class=\"MsoNormal\" style=\"text-align: justify\"><span style=\"font-size: 9pt; font-family: Verdana\"><br />\r\n<span class=\"conteudointerno\">e) a&ccedil;&atilde;o de terceiros que impe&ccedil;a a presta&ccedil;&atilde;o dos servi&ccedil;os e</span></span></p>\r\n<p class=\"MsoNormal\" style=\"text-align: justify\"><span style=\"font-size: 9pt; font-family: Verdana\"><br />\r\n<span class=\"conteudointerno\">f) casos fortuitos ou for&ccedil;a maior.</span></span></p>\r\n<p class=\"MsoNormal\" style=\"text-align: justify\"><span style=\"font-size: 9pt; font-family: Verdana\"><br />\r\n<span class=\"conteudointerno\">g) A interrup&ccedil;&atilde;o na presta&ccedil;&atilde;o dos servi&ccedil;os, pelos motivos relacionados acima, que ultrapassarem tempo superior a 72 (setenta e duas) horas consecutivas, ser&aacute; descontado proporcionalmente os valores referentes a esse per&iacute;odo de paralisa&ccedil;&atilde;o.</span></span></p>\r\n<p class=\"MsoNormal\" style=\"text-align: justify\"><span style=\"font-size: 9pt; font-family: Verdana\"><br />\r\n<span class=\"conteudointerno\"><b>3 &ndash; LOGIN E SENHA DO CONTRATANTE</b></span></span></p>\r\n<p style=\"text-align: justify\"><span style=\"font-size: 9pt; font-family: Verdana\">3.1 - Ao contratar os servi&ccedil;os da <span class=\"conteudointerno\">CONTRATADA</span> o CONTRATANTE receber&aacute; um login e uma senha privativa que constituem sua identifica&ccedil;&atilde;o para uso do servi&ccedil;o.</span></p>\r\n<p style=\"text-align: justify\"><span style=\"font-size: 9pt; font-family: Verdana\">3.2 - O CONTRATANTE ter&aacute; apenas um login e uma senha privativa, que s&atilde;o pessoais e intransfer&iacute;veis.</span></p>\r\n<p style=\"text-align: justify\"><span style=\"font-size: 9pt; font-family: Verdana\">3.3 - O CONTRATANTE assume integral responsabilidade por quaisquer preju&iacute;zos que cause a terceiros ou venha sofrer pela utiliza&ccedil;&atilde;o indevida de seu c&oacute;digo ou de sua senha privativa.</span></p>\r\n<p style=\"text-align: justify\"><span style=\"font-size: 9pt; font-family: Verdana\">3.4 - N&atilde;o ser&atilde;o permitidas conex&otilde;es simult&acirc;neas utilizando o mesmo login de CONTRATANTE e a mesma senha privativa de acesso aos servi&ccedil;os.</span></p>\r\n<p class=\"MsoNormal\"><b><span style=\"font-size: 9pt; font-family: Verdana\">4 - TAXA DE INSTALA&Ccedil;&Atilde;O E PRAZO DE VIG&Ecirc;NCIA <br />\r\n</span></b><b><span style=\"font-size: 9pt; font-family: Verdana\"><br />\r\n</span></b><span style=\"font-size: 9pt; font-family: Verdana\">A instala&ccedil;&atilde;o do servi&ccedil;o denominado internet tem um custo de inscri&ccedil;&atilde;o declarado depois de feita viabilidade para levar o acesso a Internet at&eacute; o computador do CONTRATANTE. </span></p>\r\n<p class=\"MsoNormal\"><span style=\"font-size: 9pt; font-family: Verdana\"><br />\r\n</span><span style=\"font-size: 9pt; font-family: Verdana\">4.1&nbsp;N&atilde;o h&aacute;&nbsp;prazo m&iacute;nimo de vig&ecirc;ncia do presente CONTRATO&nbsp;.</span></p>\r\n<p class=\"MsoNormal\"><span style=\"font-size: 9pt; font-family: Verdana\"><br />\r\n</span><span style=\"font-size: 9pt; font-family: Verdana\">4.2 O cliente poder&aacute; bloquear a assinatura por at&eacute; 30 dias. Caso ultrapasse esse limite para desbloque&aacute;-lo, o cliente pagar&aacute; uma taxa de ades&atilde;o acordada com a CONTRATADA.</span></p>\r\n<p class=\"MsoNormal\"><span style=\"font-size: 9pt; font-family: Verdana\"><br />\r\n</span><b><span style=\"font-size: 9pt; font-family: Verdana\">5 - PAGAMENTO E REAJUSTE</span></b></p>\r\n<p style=\"text-align: justify\"><span style=\"font-size: 9pt; font-family: Verdana\">5.1 - O pagamento pela utiliza&ccedil;&atilde;o do servi&ccedil;o ser&aacute; realizado mensalmente &agrave; vencer, o dia do vencimento ser&aacute; o que consta no objeto de cobran&ccedil;a, incluindo tributos e demais encargos conforme a legisla&ccedil;&atilde;o em vigor.</span></p>\r\n<p style=\"text-align: justify\"><span style=\"font-size: 9pt; font-family: Verdana\">5.2 - O n&atilde;o pagamento no vencimento sujeitar&aacute; o usu&aacute;rio, a exclusivo crit&eacute;rio da <span class=\"conteudointerno\">CONTRATADA</span>, independentemente de notifica&ccedil;&atilde;o judicial ou extrajudicial, na suspens&atilde;o da presta&ccedil;&atilde;o dos servi&ccedil;os.</span></p>\r\n<p style=\"text-align: justify\"><span style=\"font-size: 9pt; font-family: Verdana\">* A suspens&atilde;o dos servi&ccedil;os por falta de pagamento, n&atilde;o implica no cancelamento ou suspens&atilde;o do respectivo contrato.</span></p>\r\n<p style=\"text-align: justify\"><span style=\"font-size: 9pt; font-family: Verdana\">5.3 - O pre&ccedil;o contratado ser&aacute; reajustado anualmente, ou em prazo inferior que vier a ser admitido pela legisla&ccedil;&atilde;o aplic&aacute;vel, pela varia&ccedil;&atilde;o do I.G.P.-M, ou por outro &iacute;ndice que venha a substitu&iacute;-lo.</span></p>\r\n<p style=\"text-align: justify\"><span style=\"font-size: 9pt; font-family: Verdana\">5.4 - Estes valores tamb&eacute;m poder&atilde;o ser revistos, a qualquer tempo, para o resgate do inicial equil&iacute;brio econ&ocirc;mico-financeiro necess&aacute;rio &agrave; presta&ccedil;&atilde;o dos Servi&ccedil;os ou em caso de modifica&ccedil;&otilde;es do regime tribut&aacute;rio vigente.</span></p>\r\n<p style=\"text-align: justify\"><span style=\"font-size: 9pt; font-family: Verdana\">5.5 - O atraso no pagamento da mensalidade nos prazos e pelos valores ajustados, ser&aacute; cobrado juros de mora de 1% (um por cento) ao m&ecirc;s, corre&ccedil;&atilde;o monet&aacute;ria pela varia&ccedil;&atilde;o do I.G.P.-M e multa de 2% (dois por cento) sobre os valores devidos e n&atilde;o pagos.</span></p>\r\n<p style=\"text-align: justify\"><span style=\"font-size: 9pt; font-family: Verdana\">5.6 - O n&atilde;o pagamento de qualquer parcela devida pela contratante dar&aacute; a <span class=\"conteudointerno\">CONTRATADA</span> o direito de interromper a presta&ccedil;&atilde;o do servi&ccedil;o de acesso do usu&aacute;rio, at&eacute; a efetiva&ccedil;&atilde;o do pagamento, independente de aviso pr&eacute;vio.</span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 12pt; text-align: justify\"><span class=\"conteudointerno\"><b><span style=\"font-size: 9pt; font-family: Verdana\">6. FORMA DE UTILIZA&Ccedil;&Atilde;O DOS SERVI&Ccedil;OS</span></b></span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 12pt; text-align: justify\"><span style=\"font-size: 9pt; font-family: Verdana\">6<span class=\"conteudointerno\">.1 - Ao contratar os servi&ccedil;os o CONTRATANTE se obriga a respeitar a legisla&ccedil;&atilde;o em vigor de utiliza&ccedil;&atilde;o da rede Internet, devendo abster-se de:</span></span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 12pt; text-align: justify\"><span class=\"conteudointerno\"><span style=\"font-size: 9pt; font-family: Verdana\">a) acessar senhas, modificar dados privativos, arquivos ou assumir identidade de terceiros;</span></span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 12pt; text-align: justify\"><span class=\"conteudointerno\"><span style=\"font-size: 9pt; font-family: Verdana\">b) desrespeitar leis de direito autoral e de propriedade intelectual;</span></span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 12pt; text-align: justify\"><span class=\"conteudointerno\"><span style=\"font-size: 9pt; font-family: Verdana\">c) transmitir ou armazenar qualquer tipo de material cujo conte&uacute;do infrinja a Lei em vigor, relacionado com drogas, crian&ccedil;as e adolescentes em cena de sexo expl&iacute;cito ou pornografia;</span></span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 12pt; text-align: justify\"><span class=\"conteudointerno\"><span style=\"font-size: 9pt; font-family: Verdana\">d) divulgar informa&ccedil;&otilde;es falsas ou incompletas de car&aacute;ter sigiloso;</span></span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 12pt; text-align: justify\"><span class=\"conteudointerno\"><span style=\"font-size: 9pt; font-family: Verdana\">e) prejudicar usu&aacute;rios da INTERNET, atrav&eacute;s do uso de programas, acessando computadores, alterando arquivos, programas e dados existentes na rede;</span></span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 12pt; text-align: justify\"><span class=\"conteudointerno\"><span style=\"font-size: 9pt; font-family: Verdana\">f) estimular a pr&aacute;tica de condutas il&iacute;citas ou contr&aacute;rias &agrave; moral e aos bons costumes, bem como, atos discriminat&oacute;rios de cunho sexual, racial, religioso ou qualquer outra condi&ccedil;&atilde;o.</span></span></p>\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 12pt; text-align: justify\"><span class=\"conteudointerno\"><span style=\"font-size: 9pt; font-family: Verdana\">g) Divulgar ou anunciar produtos e servi&ccedil;os atrav&eacute;s de correio eletr&ocirc;nico, salvo nos acasos de expressa do destinat&aacute;rio a CONTRATADA.</span></span></p>\r\n<p style=\"text-align: justify\"><span style=\"font-size: 9pt; font-family: Verdana\">6.2 - A <span class=\"conteudointerno\">CONTRATADA</span> poder&aacute;, sem qualquer aviso pr&eacute;vio, suspender ou impedir a divulga&ccedil;&atilde;o de material, quando for considerado ilegal, impr&oacute;prio ou determinado por autoridade Federal, Estadual ou Municipal, comunicando o fato imediatamente ao CONTRATANTE.</span></p>\r\n<p style=\"text-align: justify\"><span style=\"font-size: 9pt; font-family: Verdana\">6.3 - Cabe exclusivamente ao usu&aacute;rio a aquisi&ccedil;&atilde;o dos equipamentos, e manuten&ccedil;&atilde;o&sup1;, terminais e suas interfaces com as redes de telecomunica&ccedil;&atilde;o, necess&aacute;rios &agrave; utiliza&ccedil;&atilde;o dos servi&ccedil;os.</span></p>\r\n<p style=\"text-align: justify\"><span style=\"font-size: 9pt; font-family: Verdana\">6.4 - Quaisquer altera&ccedil;&otilde;es nas condi&ccedil;&otilde;es da presta&ccedil;&atilde;o dos servi&ccedil;os ser&atilde;o previamente comunicadas ao CONTRATANTE, sempre que for poss&iacute;vel.</span></p>\r\n<p align=\"right\" style=\"text-align: right\"><b><sup><span style=\"font-size: 9pt; font-family: Verdana\">(1)</span></sup></b><b><i><span style=\"font-size: 7pt; font-family: Verdana\"> Apenas para equipamentos adquiridos por terceiros.</span></i></b></p>\r\n<p style=\"text-align: justify\"><b><span style=\"font-size: 9pt; font-family: Verdana\">7. RISCOS NA UTILIZA&Ccedil;&Atilde;O DA INTERNET</span></b></p>\r\n<p style=\"text-align: justify\"><span style=\"font-size: 9pt; font-family: Verdana\">7.1 - A <span class=\"conteudointerno\">CONTRATADA</span> n&atilde;o se responsabilizar&aacute; por qualquer dano ou preju&iacute;zo direto ou indireto que o CONTRATANTE venha a sofrer, ou que cause a terceiros, como conseq&uuml;&ecirc;ncia da utiliza&ccedil;&atilde;o da INTERNET. Perda total ou parcial de informa&ccedil;&otilde;es, arquivos ou de programas contaminados por v&iacute;rus, clonagem ou c&oacute;pia do n&uacute;mero de cart&atilde;o de cr&eacute;dito, contas banc&aacute;rias e suas respectivas senhas, fraude na compra de produtos e servi&ccedil;os pela Internet, como n&atilde;o entrega ou n&atilde;o presta&ccedil;&atilde;o de servi&ccedil;os contratados.</span></p>\r\n<p style=\"text-align: justify\"><span style=\"font-size: 9pt; font-family: Verdana\">7.2 - &Eacute; de exclusiva responsabilidade do CONTRATANTE prevenir-se dos riscos mencionados e de outros advindos da INTERNET.</span></p>\r\n<p style=\"text-align: justify\"><b><span style=\"font-size: 9pt; font-family: Verdana\">8. PRAZO E DA EXTIN&Ccedil;&Atilde;O DO PRESENTE CONTRATO</span></b></p>\r\n<p style=\"text-align: justify\"><span style=\"font-size: 9pt; font-family: Verdana\">8.1 - O presente contrato &eacute; celebrado por prazo indeterminado, podendo quaisquer das partes promover a sua extin&ccedil;&atilde;o mediante aviso pr&eacute;vio com anteced&ecirc;ncia m&iacute;nima de 30 (trinta) dias durante os quais as partes se comprometem a cumprir integralmente as obriga&ccedil;&otilde;es contratuais.</span></p>\r\n<p style=\"text-align: justify\"><span style=\"font-size: 9pt; font-family: Verdana\">8.2 - O presente contrato poder&aacute; ser rescindido, de forma imediata e sem qualquer aviso pr&eacute;vio, sempre que uma das partes violar quaisquer dispositivos constantes neste instrumento ou contr&aacute;ria &agrave; legisla&ccedil;&atilde;o vigente.</span></p>\r\n<p style=\"text-align: justify\"><b><span style=\"font-size: 9pt; font-family: Verdana\">9. NORMAS APLIC&Aacute;VEIS, FORO E DISPOSI&Ccedil;&Otilde;ES GERAIS.</span></b></p>\r\n<p style=\"text-align: justify\"><span style=\"font-size: 9pt; font-family: Verdana\">9.1 - O presente Contrato ser&aacute; regido pelas leis brasileiras,</span></p>\r\n<p style=\"text-align: justify\"><span style=\"font-size: 9pt; font-family: Verdana\">9.2 - O CONTRATANTE reconhece e declara que leu e que est&aacute; ciente e de pleno acordo com todos os termos e condi&ccedil;&otilde;es deste contrato.</span></p>\r\n<p style=\"text-align: justify\"><span style=\"font-size: 9pt; font-family: Verdana\">9.3 - Para dirimir toda e qualquer demandam envolvendo o presente contrato e seu objeto, fica eleito o foro da Comarca de </span><span style=\"font-size: 9pt; font-family: Verdana\">%provedorcidade%, </span><span style=\"font-size: 9pt; font-family: Verdana\">com expressa ren&uacute;ncia de qualquer outro, por mais especial que seja.</span></p>\r\n<p style=\"text-align: justify\"><span style=\"font-size: 9pt; font-family: Verdana\">&nbsp;</span></p>\r\n<p style=\"text-align: justify\"><span style=\"font-size: 9pt; font-family: Verdana\">Por estarem assim justos e contratados, firmam o presente instrumento, em duas vias de igual teor.</span></p>\r\n<p style=\"text-align: justify\"><span style=\"font-size: 9pt; font-family: Verdana\">&nbsp;</span></p>\r\n<p style=\"text-align: justify\"><span style=\"font-size: 9pt; font-family: Verdana\">&nbsp;</span></p>\r\n<p align=\"right\" style=\"text-align: right\"><span style=\"font-size: 9pt; font-family: Verdana\">%provedorcidade%, %data%</span></p>\r\n<p style=\"text-align: justify\"><span style=\"font-size: 9pt; font-family: Verdana\">&nbsp;</span></p>\r\n<p style=\"text-align: justify\"><span style=\"font-size: 9pt; font-family: Verdana\">&nbsp;</span></p>\r\n<div align=\"center\">\r\n<table cellspacing=\"0\" cellpadding=\"0\" border=\"0\" class=\"MsoNormalTable\" style=\"border-collapse: collapse\">\r\n    <tbody>\r\n        <tr>\r\n            <td width=\"353\" valign=\"top\" style=\"padding-right: 5.4pt; padding-left: 5.4pt; padding-bottom: 0cm; width: 264.5pt; padding-top: 0cm\">\r\n            <p align=\"center\" class=\"MsoNormal\" style=\"text-align: center\"><span style=\"font-size: 9pt; font-family: Verdana\">_____________________________________</span></p>\r\n            </td>\r\n            <td width=\"353\" valign=\"top\" style=\"padding-right: 5.4pt; padding-left: 5.4pt; padding-bottom: 0cm; width: 264.5pt; padding-top: 0cm\">\r\n            <p align=\"center\" class=\"MsoNormal\" style=\"text-align: center\"><span style=\"font-size: 9pt; font-family: Verdana\">_____________________________________</span></p>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"353\" valign=\"top\" style=\"padding-right: 5.4pt; padding-left: 5.4pt; padding-bottom: 0cm; width: 264.5pt; padding-top: 0cm\">\r\n            <p align=\"center\" class=\"MsoNormal\" style=\"text-align: center\"><span style=\"font-size: 9pt; font-family: Verdana\">Contratante</span></p>\r\n            </td>\r\n            <td width=\"353\" valign=\"top\" style=\"padding-right: 5.4pt; padding-left: 5.4pt; padding-bottom: 0cm; width: 264.5pt; padding-top: 0cm\">\r\n            <p align=\"center\" class=\"MsoNormal\" style=\"text-align: center\"><span style=\"font-size: 9pt; font-family: Verdana\">Contratada</span></p>\r\n            </td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n</div>\r\n</div>\r\n<div class=\"Section1\">&nbsp;</div>\r\n<p>&nbsp;</p>','2011-03-06 20:41:57','sim','contrato padrao','sim');
/*!40000 ALTER TABLE `sis_contrato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_documentos`
--

DROP TABLE IF EXISTS `sis_documentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_documentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(32) NOT NULL,
  `texto` longtext DEFAULT NULL,
  `data` datetime DEFAULT NULL,
  `ativo` varchar(3) DEFAULT 'sim',
  `nome` varchar(255) DEFAULT NULL,
  `tipo` varchar(32) DEFAULT 'clientes',
  PRIMARY KEY (`id`),
  KEY `codigo` (`codigo`)
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC DEFAULT CHARSET=latin1 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_documentos`
--

LOCK TABLES `sis_documentos` WRITE;
/*!40000 ALTER TABLE `sis_documentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `sis_documentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_enviadas`
--

DROP TABLE IF EXISTS `sis_enviadas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_enviadas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) DEFAULT NULL,
  `data` datetime DEFAULT NULL,
  `tipo` enum('sms','web','app') DEFAULT 'web',
  `mensagem` longtext DEFAULT NULL,
  `uuid` varchar(50) DEFAULT NULL,
  `xto` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `login` (`login`),
  KEY `uuid` (`uuid`)
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC DEFAULT CHARSET=latin1 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_enviadas`
--

LOCK TABLES `sis_enviadas` WRITE;
/*!40000 ALTER TABLE `sis_enviadas` DISABLE KEYS */;
/*!40000 ALTER TABLE `sis_enviadas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_estoque`
--

DROP TABLE IF EXISTS `sis_estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_estoque` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idprod` int(11) DEFAULT NULL,
  `qtdmin` int(11) DEFAULT NULL,
  `estoque` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC DEFAULT CHARSET=latin1 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_estoque`
--

LOCK TABLES `sis_estoque` WRITE;
/*!40000 ALTER TABLE `sis_estoque` DISABLE KEYS */;
/*!40000 ALTER TABLE `sis_estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_fornecedor`
--

DROP TABLE IF EXISTS `sis_fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_fornecedor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid_fornecedor` varchar(64) DEFAULT NULL,
  `razaosoc` varchar(255) DEFAULT NULL,
  `nomefan` varchar(255) DEFAULT NULL,
  `contato` varchar(255) DEFAULT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `numero` varchar(50) DEFAULT NULL,
  `bairro` varchar(255) DEFAULT NULL,
  `cidade` varchar(255) DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL,
  `complemento` varchar(255) DEFAULT NULL,
  `telefone` varchar(50) DEFAULT NULL,
  `celular` varchar(50) DEFAULT NULL,
  `nextel` varchar(50) DEFAULT NULL,
  `fax` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `cpf_cnpj` varchar(30) DEFAULT NULL,
  `rg_ie` varchar(30) DEFAULT NULL,
  `tipo` enum('fisica','juridica') DEFAULT NULL,
  `cep` varchar(11) DEFAULT NULL,
  `obs` text DEFAULT NULL,
  `crc` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `razaosoc` (`razaosoc`),
  KEY `nomefan` (`nomefan`),
  KEY `contato` (`contato`),
  KEY `email` (`email`),
  KEY `cpf_cnpj` (`cpf_cnpj`),
  KEY `rg_ie` (`rg_ie`)
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC DEFAULT CHARSET=latin1 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_fornecedor`
--

LOCK TABLES `sis_fornecedor` WRITE;
/*!40000 ALTER TABLE `sis_fornecedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `sis_fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_func`
--

DROP TABLE IF EXISTS `sis_func`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_func` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid_func` varchar(48) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `sexo` enum('m','f') DEFAULT NULL,
  `nascimento` varchar(20) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `celular` varchar(20) DEFAULT NULL,
  `nextel` varchar(20) DEFAULT NULL,
  `cpf` varchar(20) DEFAULT NULL,
  `rg` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `cep` varchar(11) DEFAULT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `numero` varchar(20) DEFAULT NULL,
  `complemento` varchar(255) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  `cidade` varchar(255) DEFAULT NULL,
  `data_adm` varchar(11) DEFAULT NULL,
  `salario` decimal(12,2) DEFAULT NULL,
  `cargo` varchar(50) DEFAULT NULL,
  `comissao` decimal(12,2) DEFAULT NULL,
  `bairro` varchar(255) DEFAULT NULL,
  `tipo` enum('i','t') DEFAULT 'i',
  `crc` varchar(30) DEFAULT NULL,
  `cidade_ibge` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nome` (`nome`),
  KEY `uuid_func` (`uuid_func`)
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC DEFAULT CHARSET=latin1 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_func`
--

LOCK TABLES `sis_func` WRITE;
/*!40000 ALTER TABLE `sis_func` DISABLE KEYS */;
/*!40000 ALTER TABLE `sis_func` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_gneterros`
--

DROP TABLE IF EXISTS `sis_gneterros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_gneterros` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(16) DEFAULT NULL,
  `dma` datetime DEFAULT NULL,
  `mensagem` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC DEFAULT CHARSET=latin1 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_gneterros`
--

LOCK TABLES `sis_gneterros` WRITE;
/*!40000 ALTER TABLE `sis_gneterros` DISABLE KEYS */;
/*!40000 ALTER TABLE `sis_gneterros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_gnettits`
--

DROP TABLE IF EXISTS `sis_gnettits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_gnettits` (
  `titulo` varchar(64) NOT NULL,
  `dados` text DEFAULT NULL,
  `full` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`titulo`)
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC DEFAULT CHARSET=latin1 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_gnettits`
--

LOCK TABLES `sis_gnettits` WRITE;
/*!40000 ALTER TABLE `sis_gnettits` DISABLE KEYS */;
/*!40000 ALTER TABLE `sis_gnettits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_hotsite`
--

DROP TABLE IF EXISTS `sis_hotsite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_hotsite` (
  `fundo` varchar(10) DEFAULT NULL,
  `pg_empresa` text DEFAULT NULL,
  `pg_tecnologia` text DEFAULT NULL,
  `pg_cobertura` text DEFAULT NULL,
  `pg_faq` text DEFAULT NULL,
  `pg_suporte` text DEFAULT NULL,
  `google` text DEFAULT NULL,
  `twitter` varchar(255) DEFAULT 'pedrovigia',
  `tipotopo` varchar(3) DEFAULT 'img',
  `arqtopo` varchar(255) DEFAULT 'topo.jpg',
  `pg_confirmacao` text DEFAULT NULL,
  `anuncios` text DEFAULT NULL,
  `layout` varchar(255) DEFAULT 'padrao',
  `preco` varchar(3) DEFAULT 'sim',
  `anatel` varchar(3) DEFAULT 'sim',
  `captcha` varchar(3) DEFAULT 'sim',
  `batepapo` enum('sim','nao') DEFAULT 'sim'
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC DEFAULT CHARSET=latin1 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_hotsite`
--

LOCK TABLES `sis_hotsite` WRITE;
/*!40000 ALTER TABLE `sis_hotsite` DISABLE KEYS */;
INSERT INTO `sis_hotsite` VALUES ('bg15.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'swf','42F34C3C_banner-flash.swf',NULL,NULL,'padrao','sim','sim','sim','sim');
/*!40000 ALTER TABLE `sis_hotsite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_lanc`
--

DROP TABLE IF EXISTS `sis_lanc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_lanc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datavenc` datetime DEFAULT NULL,
  `nossonum` varchar(64) DEFAULT NULL,
  `datapag` datetime DEFAULT NULL,
  `nome` varchar(16) DEFAULT NULL,
  `recibo` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT 'aberto',
  `login` varchar(255) DEFAULT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  `cfop_lanc` varchar(8) DEFAULT '5307',
  `obs` varchar(255) DEFAULT NULL,
  `processamento` datetime DEFAULT NULL,
  `aviso` varchar(3) DEFAULT 'nao',
  `url` longtext DEFAULT NULL,
  `usergerou` varchar(20) DEFAULT NULL,
  `valorger` varchar(20) DEFAULT 'completo',
  `coletor` varchar(20) DEFAULT NULL,
  `linhadig` varchar(255) DEFAULT NULL,
  `valor` varchar(50) DEFAULT NULL,
  `valorpag` varchar(50) DEFAULT NULL,
  `gwt_numero` varchar(32) DEFAULT NULL,
  `imp` enum('sim','nao') NOT NULL DEFAULT 'nao',
  `referencia` varchar(8) DEFAULT NULL,
  `tipocob` enum('fat','car') NOT NULL DEFAULT 'fat',
  `codigo_carne` varchar(32) DEFAULT NULL,
  `chave_gnet` varchar(32) DEFAULT NULL,
  `chave_gnet2` varchar(32) DEFAULT NULL,
  `chave_juno` varchar(32) DEFAULT NULL,
  `chave_galaxpay` varchar(32) DEFAULT NULL,
  `chave_iugu` varchar(96) DEFAULT NULL,
  `numconta` int(11) DEFAULT NULL,
  `gerourem` tinyint(1) DEFAULT 0,
  `remvalor` decimal(12,2) DEFAULT 0.00,
  `remdata` datetime DEFAULT NULL,
  `formapag` varchar(100) DEFAULT NULL,
  `fcartaobandeira` varchar(100) DEFAULT NULL,
  `fcartaonumero` varchar(32) DEFAULT NULL,
  `fchequenumero` varchar(100) DEFAULT NULL,
  `fchequebanco` varchar(100) DEFAULT NULL,
  `fchequeagcc` varchar(100) DEFAULT NULL,
  `percmulta` decimal(4,2) DEFAULT 0.00,
  `valormulta` decimal(12,2) DEFAULT 0.00,
  `percmora` decimal(4,2) DEFAULT 0.00,
  `valormora` decimal(12,2) DEFAULT 0.00,
  `percdesc` decimal(4,2) DEFAULT 0.00,
  `valordesc` decimal(12,2) DEFAULT 0.00,
  `deltitulo` tinyint(1) DEFAULT 0,
  `datadel` datetime DEFAULT NULL,
  `num_recibos` int(11) DEFAULT 0,
  `num_retornos` int(11) DEFAULT 0,
  `alt_venc` tinyint(1) DEFAULT 0,
  `uuid_lanc` varchar(48) DEFAULT NULL,
  `tarifa_paga` decimal(12,2) DEFAULT 0.00,
  `id_empresa` varchar(16) DEFAULT NULL,
  `oco01` tinyint(1) DEFAULT 0,
  `oco02` tinyint(1) DEFAULT 0,
  `oco06` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `recibo` (`recibo`),
  KEY `datavenc` (`datavenc`),
  KEY `nossonum` (`nossonum`),
  KEY `login` (`login`),
  KEY `usergerou` (`usergerou`),
  KEY `codigo_carne` (`codigo_carne`),
  KEY `remvalor` (`remvalor`),
  KEY `status` (`status`),
  KEY `deltitulo` (`deltitulo`),
  KEY `nome` (`nome`),
  KEY `uuid_lanc` (`uuid_lanc`),
  KEY `remdata` (`remdata`),
  KEY `id_empresa` (`id_empresa`),
  KEY `alt_venc` (`alt_venc`),
  KEY `oco01` (`oco01`),
  KEY `oco02` (`oco02`),
  KEY `oco06` (`oco06`)
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC DEFAULT CHARSET=latin1 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_lanc`
--

LOCK TABLES `sis_lanc` WRITE;
/*!40000 ALTER TABLE `sis_lanc` DISABLE KEYS */;
/*!40000 ALTER TABLE `sis_lanc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_logcgnat`
--

DROP TABLE IF EXISTS `sis_logcgnat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_logcgnat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_radacct` int(11) DEFAULT 0,
  `login` varchar(64) DEFAULT NULL,
  `ip_interno` varchar(64) DEFAULT NULL,
  `ip_valido` varchar(64) DEFAULT NULL,
  `port_start` int(11) DEFAULT NULL,
  `port_end` int(11) DEFAULT NULL,
  `daata` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_radacct` (`id_radacct`)
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_logcgnat`
--

LOCK TABLES `sis_logcgnat` WRITE;
/*!40000 ALTER TABLE `sis_logcgnat` DISABLE KEYS */;
/*!40000 ALTER TABLE `sis_logcgnat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_logpd6`
--

DROP TABLE IF EXISTS `sis_logpd6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_logpd6` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_radacct` int(11) DEFAULT 0,
  `login` varchar(64) DEFAULT NULL,
  `pool6` varchar(48) DEFAULT NULL,
  `daata` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_logpd6`
--

LOCK TABLES `sis_logpd6` WRITE;
/*!40000 ALTER TABLE `sis_logpd6` DISABLE KEYS */;
/*!40000 ALTER TABLE `sis_logpd6` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_logs`
--

DROP TABLE IF EXISTS `sis_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `registro` longtext DEFAULT NULL,
  `data` varchar(255) DEFAULT NULL,
  `login` varchar(64) DEFAULT NULL,
  `tipo` varchar(20) DEFAULT 'admin',
  `operacao` varchar(8) DEFAULT 'OPERNULL',
  PRIMARY KEY (`id`),
  KEY `login` (`login`)
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC DEFAULT CHARSET=latin1 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_logs`
--

LOCK TABLES `sis_logs` WRITE;
/*!40000 ALTER TABLE `sis_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `sis_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_mlanc`
--

DROP TABLE IF EXISTS `sis_mlanc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_mlanc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idlanc` int(11) DEFAULT NULL,
  `valor` decimal(12,2) DEFAULT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `cfop_mlanc` varchar(8) DEFAULT '5949',
  `desc` varchar(255) DEFAULT NULL,
  `deltitulo` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idlanc` (`idlanc`),
  KEY `deltitulo` (`deltitulo`)
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC DEFAULT CHARSET=latin1 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_mlanc`
--

LOCK TABLES `sis_mlanc` WRITE;
/*!40000 ALTER TABLE `sis_mlanc` DISABLE KEYS */;
/*!40000 ALTER TABLE `sis_mlanc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_msg`
--

DROP TABLE IF EXISTS `sis_msg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_msg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chamado` varchar(255) DEFAULT NULL,
  `msg` text DEFAULT NULL,
  `tipo` varchar(10) NOT NULL DEFAULT 'F5F5F5',
  `login` varchar(255) DEFAULT NULL,
  `atendente` varchar(255) DEFAULT NULL,
  `msg_data` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `login` (`login`),
  KEY `chamado` (`chamado`)
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC DEFAULT CHARSET=latin1 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_msg`
--

LOCK TABLES `sis_msg` WRITE;
/*!40000 ALTER TABLE `sis_msg` DISABLE KEYS */;
/*!40000 ALTER TABLE `sis_msg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_nfe`
--

DROP TABLE IF EXISTS `sis_nfe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_nfe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid_nfe` varchar(64) DEFAULT NULL,
  `modelo` varchar(32) DEFAULT NULL,
  `numero` int(9) DEFAULT NULL,
  `serie` varchar(8) DEFAULT NULL,
  `referencia` varchar(8) DEFAULT NULL,
  `emissao` datetime DEFAULT NULL,
  `cfop` varchar(4) DEFAULT NULL,
  `login` varchar(64) DEFAULT NULL,
  `id_titulo` int(11) DEFAULT NULL,
  `base_calculo` decimal(10,2) NOT NULL DEFAULT 0.00,
  `aliquota` decimal(4,2) NOT NULL DEFAULT 0.00,
  `valor_icms` decimal(10,2) NOT NULL DEFAULT 0.00,
  `isentas` decimal(10,2) NOT NULL DEFAULT 0.00,
  `outros` decimal(10,2) NOT NULL DEFAULT 0.00,
  `valor_total` decimal(10,2) NOT NULL DEFAULT 0.00,
  `chave` varchar(32) DEFAULT NULL,
  `arquivo` varchar(36) DEFAULT NULL,
  `obs` varchar(255) DEFAULT NULL,
  `perc_ibpt` decimal(4,2) DEFAULT 0.00,
  `perc_ibpt_m` decimal(4,2) DEFAULT 0.00,
  `perc_ibpt_e` decimal(4,2) DEFAULT 0.00,
  `perc_ibpt_f` decimal(4,2) DEFAULT 0.00,
  `regime` enum('simples','lucro') DEFAULT NULL,
  `situacao` enum('S','R','C','N') DEFAULT 'N',
  `info_del` varchar(32) DEFAULT NULL,
  `pis` decimal(12,2) DEFAULT 0.00,
  `valor_pis` decimal(12,2) DEFAULT 0.00,
  `cofins` decimal(12,2) DEFAULT 0.00,
  `valor_cofins` decimal(12,2) DEFAULT 0.00,
  `tipo` tinyint(1) DEFAULT 4,
  PRIMARY KEY (`id`),
  KEY `id_titulo` (`id_titulo`),
  KEY `chave` (`chave`)
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC DEFAULT CHARSET=latin1 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_nfe`
--

LOCK TABLES `sis_nfe` WRITE;
/*!40000 ALTER TABLE `sis_nfe` DISABLE KEYS */;
/*!40000 ALTER TABLE `sis_nfe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_nfefiles`
--

DROP TABLE IF EXISTS `sis_nfefiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_nfefiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid_nfefiles` varchar(48) DEFAULT NULL,
  `data` datetime DEFAULT NULL,
  `mestre` varchar(128) DEFAULT NULL,
  `arquivo` varchar(128) DEFAULT NULL,
  `referencia` varchar(8) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `uuid_nfefiles` (`uuid_nfefiles`)
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_nfefiles`
--

LOCK TABLES `sis_nfefiles` WRITE;
/*!40000 ALTER TABLE `sis_nfefiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `sis_nfefiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_nfeitens`
--

DROP TABLE IF EXISTS `sis_nfeitens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_nfeitens` (
  `chave_item` varchar(32) DEFAULT NULL,
  `desc_item` varchar(40) DEFAULT NULL,
  `icms_item` decimal(9,2) NOT NULL DEFAULT 0.00,
  `aliq_item` decimal(4,2) NOT NULL DEFAULT 0.00,
  `outros_item` decimal(10,2) NOT NULL DEFAULT 0.00,
  `valor_item` decimal(9,2) NOT NULL DEFAULT 0.00,
  `cod_item` varchar(4) NOT NULL DEFAULT '0104',
  `megas` varchar(16) DEFAULT NULL,
  `pis_item` decimal(12,2) DEFAULT 0.00,
  `valor_itempis` decimal(12,2) DEFAULT 0.00,
  `cofins_item` decimal(12,2) DEFAULT 0.00,
  `valor_itemcofins` decimal(12,2) DEFAULT 0.00,
  `cfop_item` varchar(8) DEFAULT 'X307',
  KEY `chave_item` (`chave_item`)
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC DEFAULT CHARSET=latin1 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_nfeitens`
--

LOCK TABLES `sis_nfeitens` WRITE;
/*!40000 ALTER TABLE `sis_nfeitens` DISABLE KEYS */;
/*!40000 ALTER TABLE `sis_nfeitens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_nossonumero`
--

DROP TABLE IF EXISTS `sis_nossonumero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_nossonumero` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `nossonumero` varchar(32) DEFAULT NULL,
  `titulo` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC DEFAULT CHARSET=latin1 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_nossonumero`
--

LOCK TABLES `sis_nossonumero` WRITE;
/*!40000 ALTER TABLE `sis_nossonumero` DISABLE KEYS */;
/*!40000 ALTER TABLE `sis_nossonumero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_notas`
--

DROP TABLE IF EXISTS `sis_notas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_notas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `texto` longtext DEFAULT NULL,
  `data` datetime DEFAULT NULL,
  `token` varchar(32) DEFAULT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  `pub` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `token` (`token`)
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC DEFAULT CHARSET=latin1 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_notas`
--

LOCK TABLES `sis_notas` WRITE;
/*!40000 ALTER TABLE `sis_notas` DISABLE KEYS */;
/*!40000 ALTER TABLE `sis_notas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_notificacoes`
--

DROP TABLE IF EXISTS `sis_notificacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_notificacoes` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `data` datetime DEFAULT NULL,
  `dados` text DEFAULT NULL,
  `servico` varchar(32) DEFAULT NULL,
  `resposta` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC DEFAULT CHARSET=latin1 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_notificacoes`
--

LOCK TABLES `sis_notificacoes` WRITE;
/*!40000 ALTER TABLE `sis_notificacoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `sis_notificacoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_nottitulo`
--

DROP TABLE IF EXISTS `sis_nottitulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_nottitulo` (
  `id` varchar(48) NOT NULL,
  `notificacao` int(11) DEFAULT NULL,
  `titulo` varchar(48) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_nottitulo`
--

LOCK TABLES `sis_nottitulo` WRITE;
/*!40000 ALTER TABLE `sis_nottitulo` DISABLE KEYS */;
/*!40000 ALTER TABLE `sis_nottitulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_opcao`
--

DROP TABLE IF EXISTS `sis_opcao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_opcao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(64) DEFAULT NULL,
  `valor` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nome` (`nome`)
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC AUTO_INCREMENT=8499 DEFAULT CHARSET=latin1 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_opcao`
--

LOCK TABLES `sis_opcao` WRITE;
/*!40000 ALTER TABLE `sis_opcao` DISABLE KEYS */;
INSERT INTO `sis_opcao` VALUES (1,'dia01','sim'),(2,'dia02',NULL),(3,'dia03',NULL),(4,'dia04',NULL),(5,'dia05',NULL),(6,'dia06',NULL),(7,'dia07','sim'),(8,'dia08',NULL),(9,'dia09',NULL),(10,'dia10',NULL),(11,'dia11',NULL),(12,'dia12',NULL),(13,'dia13','sim'),(14,'dia14',NULL),(15,'dia15',NULL),(16,'dia16',NULL),(17,'dia17',NULL),(18,'dia18',NULL),(19,'dia19','sim'),(20,'dia20',NULL),(21,'dia21',NULL),(22,'dia22',NULL),(23,'dia23',NULL),(24,'dia24',NULL),(25,'dia25','sim'),(26,'dia26',NULL),(27,'dia27',NULL),(28,'dia28',NULL),(29,'dia29',NULL),(30,'dia30',NULL),(31,'dia31',NULL),(32,'regpagina','100'),(34,'maskmoeda','sim'),(35,'timelogout','600'),(37,'submenu','sim'),(41,'bopenchamados','nao'),(42,'renew_nfe','sim'),(43,'next_nfe','1'),(44,'desbl_comprovante','nao'),(45,'bloq_mac','nao'),(46,'auto_corte','sim'),(47,'sms_corte','nao'),(48,'key_mandrill',''),(49,'end_email','pedrovigia@gmail.com'),(50,'porta_email','587'),(51,'servidor_email','smtp.gmail.com'),(52,'usuario_email','pedrovigia'),(53,'senha_email','123'),(54,'tls_email','yes'),(55,'ddns_ativo','nao'),(56,'ddns_user','pedrovigia'),(57,'ddns_pass','123'),(58,'ddns_host','pedrofilho.25u.com'),(59,'sms_gtw','desativado'),(60,'sms_conta','qqq'),(61,'sms_idlogin','qqq'),(62,'sms_senha','123'),(63,'sms_servidor','torpedus.com.br'),(64,'wapp_servidor',NULL),(65,'wapp_login',NULL),(66,'wapp_senha',NULL),(67,'mais_cpf','sim'),(68,'validar_cpf','sim'),(69,'baixar_f2b','nao'),(70,'baixar_gnet','nao'),(71,'remessa_f2b','nao'),(72,'remessa_gnet','nao'),(73,'case_sensitive','nao'),(74,'senha_boleto','sim'),(75,'bck_pendriver','nao'),(76,'bckftp','nao'),(77,'bckftphost','ftp.pedrofilho.com.br'),(78,'bckftpuser','pedrofilho'),(79,'bckftpsenha','a79445d4'),(87,'dias_de_corte','Mon,Tue,Wed,Thu,Fri,Ped'),(88,'dias_desativa','45'),(89,'turbo_horai','00'),(90,'turbo_mini','00'),(91,'turbo_horaf','00'),(92,'turbo_minf','00'),(93,'turbo_sab','nao'),(94,'turbo_dom','nao'),(95,'night_horai','00'),(96,'night_mini','00'),(97,'night_horaf','00'),(98,'night_minf','00'),(99,'night_sab','sim'),(100,'night_dom','sim'),(101,'show_senhas','sim'),(121,'bck_ftp','nao'),(122,'bck_ftphost','ftp.bck.kkk'),(123,'bck_ftpuser','login'),(124,'bck_ftpsenha','235544e4a79445d4'),(139,'lgravar_senha','nao'),(140,'auto_desbloqueio','sim'),(141,'desbloq_atrasados','nao'),(183,'megatools_ativo','nao'),(184,'email_aniv','nao'),(185,'sms_aniv','nao'),(186,'segundavia','sim'),(187,'sms_rhelpdesk','nao'),(188,'sms_newcli','nao'),(189,'auto_titulos','3'),(190,'manter_titulos','nao'),(191,'sms_validacao','nao'),(192,'auto_update','nao'),(193,'send_emailhelp','nao'),(236,'email_gnet','nao'),(238,'central_bolnrem','sim'),(240,'central_showtraf','sim'),(241,'client_smtp','desativado'),(242,'realname','Provedor de Internet'),(243,'sms_idDispositivo','{\"Vivo\":\"\",\"Oi\":\"\",\"Tim\":\"\",\"Claro\":\"\"}'),(244,'dias_down15','15'),(246,'server_maps','osm'),(247,'ips_api','172.31.255.2'),(248,'clientes_desativados_suporte','nao'),(249,'bck_email_opt','nao'),(250,'bck_email_end','sistema@programador.ti'),(251,'send_emailsolic','nao'),(285,'auto_carnes','10'),(287,'manter_carnes','nao'),(300,'central_altcpf','nao'),(301,'titulos_tipo_clientes','s'),(302,'venc_sabados','0'),(303,'guias_clientes','1'),(1025,'google_auth','nao'),(1666,'key_googlemaps',''),(2485,'force_ssl','N'),(4010,'tbloqradius','list'),(4011,'pbloqradius','list'),(4012,'pgcorte','rad'),(4013,'tipoficha','int'),(4014,'laycentral','padrao'),(4015,'smssenha','sim'),(4016,'envsenha','sim'),(4017,'multihelp','nao'),(4018,'discovirtual','nao'),(4019,'fsenha','senha'),(4020,'helpdesk','sim'),(4021,'altdados','sim'),(4022,'altlogin','nao'),(4023,'vercontrato','sim'),(4024,'vercontato','sim'),(4025,'central_bloq_open_chamados','nao'),(4572,'key_postmark',''),(4573,'from_postmark',''),(4649,'cache_mapas','1'),(4652,'sms_token',''),(4653,'sms_numero',''),(4657,'sms_api_key',''),(4806,'cor_menu','black'),(7882,'camada_mapa','satelite'),(7883,'tempo_obs','4'),(7884,'tunnel_opt','nao'),(7885,'check_humano','N'),(7886,'desloga','S'),(7887,'tunnel_cloudflare','nao'),(7888,'pool_split','2001:db8:1::/52'),(7889,'hotsite_captcha','nao'),(7890,'hotsite_preco','sim'),(7891,'hotsite_anatel','sim'),(7892,'auto_coordenadas','n'),(7893,'bloq6','sim'),(7894,'tunnel_dev','nao'),(7895,'use_hotspot','nao'),(7896,'webhook_ativo','nao'),(7897,'webhook_servidor','https://teste.bin/'),(7898,'webhook_secret','minha_secret_key');
/*!40000 ALTER TABLE `sis_opcao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_paginas`
--

DROP TABLE IF EXISTS `sis_paginas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_paginas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `conteudo` longtext DEFAULT NULL,
  `cadastro` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC DEFAULT CHARSET=latin1 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_paginas`
--

LOCK TABLES `sis_paginas` WRITE;
/*!40000 ALTER TABLE `sis_paginas` DISABLE KEYS */;
/*!40000 ALTER TABLE `sis_paginas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_perm`
--

DROP TABLE IF EXISTS `sis_perm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_perm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  `data` datetime DEFAULT NULL,
  `permissao` enum('sim','nao') DEFAULT 'sim',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC DEFAULT CHARSET=latin1 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_perm`
--

LOCK TABLES `sis_perm` WRITE;
/*!40000 ALTER TABLE `sis_perm` DISABLE KEYS */;
/*!40000 ALTER TABLE `sis_perm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_pilhadupla`
--

DROP TABLE IF EXISTS `sis_pilhadupla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_pilhadupla` (
  `id` varchar(32) NOT NULL,
  `login` varchar(96) DEFAULT NULL,
  `ramal` varchar(32) NOT NULL,
  `barra_64` varchar(96) NOT NULL,
  `ip_rede` varchar(32) NOT NULL,
  `ip_valido` varchar(32) NOT NULL,
  `porta_inicial` int(11) NOT NULL,
  `porta_final` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_pilhadupla`
--

LOCK TABLES `sis_pilhadupla` WRITE;
/*!40000 ALTER TABLE `sis_pilhadupla` DISABLE KEYS */;
/*!40000 ALTER TABLE `sis_pilhadupla` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_plano`
--

DROP TABLE IF EXISTS `sis_plano`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_plano` (
  `nome` varchar(255) NOT NULL DEFAULT '',
  `uuid_plano` varchar(64) DEFAULT NULL,
  `valor` varchar(255) DEFAULT NULL,
  `velup` varchar(50) DEFAULT NULL,
  `veldown` varchar(50) DEFAULT NULL,
  `garup` varchar(50) DEFAULT NULL,
  `gardown` varchar(50) DEFAULT NULL,
  `tempoup` varchar(50) DEFAULT NULL,
  `tempodown` varchar(50) DEFAULT NULL,
  `prioridade` varchar(50) DEFAULT NULL,
  `maxup` varchar(50) DEFAULT NULL,
  `maxdown` varchar(50) DEFAULT NULL,
  `desaup` varchar(50) DEFAULT NULL,
  `desadown` varchar(50) DEFAULT NULL,
  `burst` varchar(50) DEFAULT NULL,
  `descricao` text DEFAULT NULL,
  `oculto` varchar(3) DEFAULT 'nao',
  `valor_scm` decimal(12,2) DEFAULT 0.00,
  `valor_sva` decimal(12,2) DEFAULT 0.00,
  `pool` varchar(50) DEFAULT NULL,
  `valor_desc` decimal(12,2) DEFAULT 0.00,
  `list` varchar(50) DEFAULT NULL,
  `aliquota` decimal(12,2) DEFAULT 19.25,
  `cfop_plano` varchar(8) DEFAULT NULL,
  `desc_titulo` varchar(255) DEFAULT NULL,
  `perc_ibpt` decimal(4,2) DEFAULT 0.00,
  `tipo` varchar(31) DEFAULT 'semi-dedicado',
  `ipv6a` varchar(128) DEFAULT NULL,
  `ipv6b` varchar(128) DEFAULT NULL,
  `vpm` decimal(12,2) DEFAULT 0.00,
  `faixa` int(11) DEFAULT 99,
  `tecnologia` varchar(8) DEFAULT 'I',
  `pis_pasep` decimal(12,2) DEFAULT 0.00,
  `cofins` decimal(12,2) DEFAULT 0.00,
  `perc_ibpt_m` decimal(4,2) DEFAULT 0.00,
  `perc_ibpt_e` decimal(4,2) DEFAULT 0.00,
  `perc_ibpt_f` decimal(4,2) DEFAULT 0.00,
  PRIMARY KEY (`nome`),
  KEY `valor` (`valor`),
  KEY `uuid_plano` (`uuid_plano`)
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC DEFAULT CHARSET=latin1 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_plano`
--

LOCK TABLES `sis_plano` WRITE;
/*!40000 ALTER TABLE `sis_plano` DISABLE KEYS */;
/*!40000 ALTER TABLE `sis_plano` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_pool`
--

DROP TABLE IF EXISTS `sis_pool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_pool` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(32) DEFAULT NULL,
  `chave` varchar(40) DEFAULT NULL,
  `ip_inicial` varchar(255) NOT NULL,
  `ip_final` varchar(255) NOT NULL,
  `data_uso` datetime DEFAULT NULL,
  `total_ips` int(11) DEFAULT NULL,
  `usuario` varchar(64) NOT NULL,
  `tipo` enum('cgnat','valid') DEFAULT 'valid',
  `ip_valido` varchar(16) DEFAULT NULL,
  `mask_valido` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nome` (`nome`),
  KEY `chave` (`chave`)
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC DEFAULT CHARSET=latin1 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_pool`
--

LOCK TABLES `sis_pool` WRITE;
/*!40000 ALTER TABLE `sis_pool` DISABLE KEYS */;
/*!40000 ALTER TABLE `sis_pool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_prodcliente`
--

DROP TABLE IF EXISTS `sis_prodcliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_prodcliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idprod` int(11) DEFAULT NULL,
  `qtdcli` int(11) DEFAULT NULL,
  `datains` datetime DEFAULT NULL,
  `usuario` varchar(32) DEFAULT NULL,
  `cliente` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cliente` (`cliente`)
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC DEFAULT CHARSET=latin1 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_prodcliente`
--

LOCK TABLES `sis_prodcliente` WRITE;
/*!40000 ALTER TABLE `sis_prodcliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `sis_prodcliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_prodhistorico`
--

DROP TABLE IF EXISTS `sis_prodhistorico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_prodhistorico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idprod` int(11) DEFAULT NULL,
  `usuario` varchar(32) DEFAULT NULL,
  `historico` varchar(255) DEFAULT NULL,
  `data` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idprod` (`idprod`)
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC DEFAULT CHARSET=latin1 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_prodhistorico`
--

LOCK TABLES `sis_prodhistorico` WRITE;
/*!40000 ALTER TABLE `sis_prodhistorico` DISABLE KEYS */;
/*!40000 ALTER TABLE `sis_prodhistorico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_produto`
--

DROP TABLE IF EXISTS `sis_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_produto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid_produto` varchar(48) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `idforn` int(11) DEFAULT NULL,
  `descricao` longtext DEFAULT NULL,
  `precoatual` decimal(12,2) DEFAULT NULL,
  `precovelho` decimal(12,2) DEFAULT NULL,
  `precocusto` decimal(12,2) DEFAULT NULL,
  `datacad` datetime DEFAULT NULL,
  `ultcompra` datetime DEFAULT NULL,
  `ultalteracao` datetime DEFAULT NULL,
  `peso` decimal(12,2) DEFAULT NULL,
  `ativo` enum('sim','nao') DEFAULT NULL,
  `codbarras` varchar(255) DEFAULT NULL,
  `grupo` varchar(128) DEFAULT NULL,
  `med` varchar(3) DEFAULT NULL,
  `aplicacao` longtext DEFAULT NULL,
  `ipi` int(11) DEFAULT NULL,
  `icms` int(11) DEFAULT NULL,
  `codigo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nome` (`nome`),
  KEY `uuid_produto` (`uuid_produto`)
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC DEFAULT CHARSET=latin1 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_produto`
--

LOCK TABLES `sis_produto` WRITE;
/*!40000 ALTER TABLE `sis_produto` DISABLE KEYS */;
/*!40000 ALTER TABLE `sis_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_provedor`
--

DROP TABLE IF EXISTS `sis_provedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_provedor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid_provedor` varchar(64) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `bairro` varchar(255) DEFAULT NULL,
  `cidade` varchar(255) DEFAULT NULL,
  `cidade_ibge` varchar(16) DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL,
  `fone` varchar(255) DEFAULT NULL,
  `site` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `cep` varchar(255) DEFAULT NULL,
  `cnpj` varchar(255) DEFAULT NULL,
  `responsavel` varchar(255) DEFAULT NULL,
  `token` varchar(32) NOT NULL,
  `celular` varchar(255) DEFAULT NULL,
  `razao` varchar(255) DEFAULT NULL,
  `fax` varchar(50) DEFAULT NULL,
  `nextel` varchar(50) DEFAULT NULL,
  `zero_oito` varchar(31) DEFAULT NULL,
  `ie` varchar(32) DEFAULT 'isento',
  `cargo` varchar(64) DEFAULT 'gerente',
  `fistel` varchar(32) DEFAULT NULL,
  `codigo_receita` varchar(16) DEFAULT NULL,
  `coordenadas` varchar(64) DEFAULT '-10.00,-50.00',
  `idforn` int(11) DEFAULT 0,
  `im` varchar(48) DEFAULT NULL,
  `twitter` varchar(64) DEFAULT NULL,
  `facebook` varchar(64) DEFAULT NULL,
  `instagram` varchar(64) DEFAULT NULL,
  `whatsapp` varchar(64) DEFAULT NULL,
  `tiktok` varchar(64) DEFAULT NULL,
  `linkedin` varchar(64) DEFAULT NULL,
  `youtube` varchar(64) DEFAULT NULL,
  `telegram` varchar(64) DEFAULT NULL,
  `skype` varchar(64) DEFAULT NULL,
  `kwai` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uuid_provedor` (`uuid_provedor`)
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_provedor`
--

LOCK TABLES `sis_provedor` WRITE;
/*!40000 ALTER TABLE `sis_provedor` DISABLE KEYS */;
INSERT INTO `sis_provedor` VALUES (3,'DC4DCD42-ACC3-4ACF-9BE8-819201269694','F PEDRO FILHO TELECOM','Rua 121','Planalto Caucaia','Caucaia','2303709','CE','(11)1111-1111','http://www.mk-auth.com.br','sistema@programador.ti','61605-450','00012345678978','Pedro Filho','44399','(33)3333-3333','F. PEDRO DA COSTA FILHO MICROEMPRESA','(22)2222-2222','666','789 456-0123','isento','CEO','123','1015','-3.7437783,-38.6661887',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sis_provedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_qrpix`
--

DROP TABLE IF EXISTS `sis_qrpix`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_qrpix` (
  `titulo` varchar(64) NOT NULL,
  `qrcode` longtext NOT NULL,
  UNIQUE KEY `titulo` (`titulo`)
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_qrpix`
--

LOCK TABLES `sis_qrpix` WRITE;
/*!40000 ALTER TABLE `sis_qrpix` DISABLE KEYS */;
/*!40000 ALTER TABLE `sis_qrpix` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_remessa`
--

DROP TABLE IF EXISTS `sis_remessa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_remessa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `conta` int(10) DEFAULT NULL,
  `md5sum` varchar(32) DEFAULT NULL,
  `dataproc` datetime DEFAULT NULL,
  `usuario` varchar(255) DEFAULT NULL,
  `token` varchar(32) NOT NULL,
  `cnab` varchar(3) DEFAULT NULL,
  `dataenv` datetime DEFAULT NULL,
  `nomearq` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `token` (`token`),
  KEY `conta` (`conta`),
  KEY `cnab` (`cnab`)
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC DEFAULT CHARSET=latin1 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_remessa`
--

LOCK TABLES `sis_remessa` WRITE;
/*!40000 ALTER TABLE `sis_remessa` DISABLE KEYS */;
/*!40000 ALTER TABLE `sis_remessa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_remtitulos`
--

DROP TABLE IF EXISTS `sis_remtitulos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_remtitulos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `remessa` varchar(32) DEFAULT NULL,
  `titulo` int(11) DEFAULT NULL,
  `valor` decimal(12,2) DEFAULT NULL,
  `cliente` varchar(64) DEFAULT NULL,
  `ocorrencia` varchar(2) DEFAULT NULL,
  `vencimento` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `remessa` (`remessa`),
  KEY `titulo` (`titulo`)
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC DEFAULT CHARSET=latin1 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_remtitulos`
--

LOCK TABLES `sis_remtitulos` WRITE;
/*!40000 ALTER TABLE `sis_remtitulos` DISABLE KEYS */;
/*!40000 ALTER TABLE `sis_remtitulos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_resumo`
--

DROP TABLE IF EXISTS `sis_resumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_resumo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dados` varchar(20) DEFAULT 'x',
  `tempo` varchar(20) DEFAULT 'x',
  `conexoes` varchar(20) DEFAULT 'x',
  `chamados` varchar(20) DEFAULT 'x',
  `contas` varchar(20) DEFAULT 'x',
  `mes` varchar(2) DEFAULT 'x',
  `ano` varchar(4) DEFAULT 'x',
  `resumo` varchar(6) DEFAULT '032011',
  `login` varchar(50) DEFAULT NULL,
  `data` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `login` (`login`)
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC DEFAULT CHARSET=latin1 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_resumo`
--

LOCK TABLES `sis_resumo` WRITE;
/*!40000 ALTER TABLE `sis_resumo` DISABLE KEYS */;
/*!40000 ALTER TABLE `sis_resumo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_retorno`
--

DROP TABLE IF EXISTS `sis_retorno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_retorno` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `conta` int(10) DEFAULT NULL,
  `md5sum` varchar(32) DEFAULT NULL,
  `dataarq` datetime DEFAULT NULL,
  `dataproc` datetime DEFAULT NULL,
  `usuario` varchar(255) DEFAULT NULL,
  `token` varchar(32) NOT NULL,
  `cnab` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `token` (`token`),
  KEY `conta` (`conta`),
  KEY `cnab` (`cnab`)
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC DEFAULT CHARSET=latin1 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_retorno`
--

LOCK TABLES `sis_retorno` WRITE;
/*!40000 ALTER TABLE `sis_retorno` DISABLE KEYS */;
/*!40000 ALTER TABLE `sis_retorno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_rettitulos`
--

DROP TABLE IF EXISTS `sis_rettitulos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_rettitulos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `retorno` varchar(32) DEFAULT NULL,
  `titulo` int(11) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  `datta` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `retorno` (`retorno`),
  KEY `titulo` (`titulo`)
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC DEFAULT CHARSET=latin1 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_rettitulos`
--

LOCK TABLES `sis_rettitulos` WRITE;
/*!40000 ALTER TABLE `sis_rettitulos` DISABLE KEYS */;
/*!40000 ALTER TABLE `sis_rettitulos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_sercontratos`
--

DROP TABLE IF EXISTS `sis_sercontratos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_sercontratos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cfop_serc` varchar(8) DEFAULT '5949',
  `nome` varchar(255) DEFAULT NULL,
  `valor` decimal(12,2) NOT NULL DEFAULT 0.00,
  `incluir` enum('sim','nao') NOT NULL DEFAULT 'sim',
  `data` datetime DEFAULT NULL,
  `insuser` varchar(50) DEFAULT NULL,
  `login` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC DEFAULT CHARSET=latin1 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_sercontratos`
--

LOCK TABLES `sis_sercontratos` WRITE;
/*!40000 ALTER TABLE `sis_sercontratos` DISABLE KEYS */;
/*!40000 ALTER TABLE `sis_sercontratos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_sici`
--

DROP TABLE IF EXISTS `sis_sici`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_sici` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `referencia` varchar(16) DEFAULT NULL,
  `arquivo` varchar(64) DEFAULT NULL,
  `data` datetime DEFAULT NULL,
  `user_gerou` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC DEFAULT CHARSET=latin1 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_sici`
--

LOCK TABLES `sis_sici` WRITE;
/*!40000 ALTER TABLE `sis_sici` DISABLE KEYS */;
/*!40000 ALTER TABLE `sis_sici` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_sinal`
--

DROP TABLE IF EXISTS `sis_sinal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_sinal` (
  `id` int(11) NOT NULL DEFAULT 0,
  `idapi` varchar(10) DEFAULT NULL,
  `sinal` varchar(50) DEFAULT NULL,
  `mac` varchar(50) DEFAULT NULL,
  `cartao` varchar(50) DEFAULT NULL,
  `rate` varchar(50) DEFAULT NULL,
  `data` datetime DEFAULT NULL,
  KEY `mac` (`mac`)
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_sinal`
--

LOCK TABLES `sis_sinal` WRITE;
/*!40000 ALTER TABLE `sis_sinal` DISABLE KEYS */;
/*!40000 ALTER TABLE `sis_sinal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_solic`
--

DROP TABLE IF EXISTS `sis_solic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_solic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid_solic` varchar(48) DEFAULT NULL,
  `login` varchar(64) DEFAULT NULL,
  `senha` varchar(32) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `data_nasc` varchar(20) DEFAULT NULL,
  `cpf` varchar(20) DEFAULT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `bairro` varchar(255) DEFAULT NULL,
  `cidade` varchar(255) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  `cep` varchar(20) DEFAULT NULL,
  `telefone` varchar(255) DEFAULT NULL,
  `vencimento` varchar(255) DEFAULT NULL,
  `plano` varchar(255) DEFAULT NULL,
  `complemento` varchar(255) DEFAULT NULL,
  `rg` varchar(255) DEFAULT NULL,
  `celular` varchar(50) DEFAULT NULL,
  `comodato` varchar(3) DEFAULT 'nao',
  `datainst` varchar(100) DEFAULT NULL,
  `visitado` varchar(3) DEFAULT 'nao',
  `instalado` varchar(3) DEFAULT 'nao',
  `tecnico` varchar(255) DEFAULT NULL,
  `obs` text DEFAULT NULL,
  `tipo` varchar(20) DEFAULT 'assinatura',
  `ip` varchar(20) DEFAULT NULL,
  `pool6` varchar(64) DEFAULT NULL,
  `mac` varchar(17) DEFAULT NULL,
  `valor` varchar(50) DEFAULT NULL,
  `concluido` varchar(3) DEFAULT 'nao',
  `promocod` varchar(50) DEFAULT 'nao',
  `numero` varchar(20) DEFAULT NULL,
  `endereco_res` varchar(255) DEFAULT NULL,
  `numero_res` varchar(20) DEFAULT NULL,
  `bairro_res` varchar(255) DEFAULT NULL,
  `cidade_res` varchar(255) DEFAULT NULL,
  `cep_res` varchar(9) DEFAULT NULL,
  `estado_res` varchar(2) DEFAULT NULL,
  `complemento_res` varchar(255) DEFAULT NULL,
  `vendedor` varchar(255) DEFAULT NULL,
  `nextel` varchar(50) DEFAULT NULL,
  `disp` enum('sim','nao') NOT NULL DEFAULT 'sim',
  `contrato` varchar(32) NOT NULL,
  `adesao` decimal(12,2) DEFAULT 0.00,
  `visita` datetime DEFAULT NULL,
  `equipamento` varchar(20) DEFAULT 'nenhum',
  `codigo` varchar(255) DEFAULT NULL,
  `ipcadastro` varchar(150) DEFAULT NULL,
  `processamento` datetime DEFAULT NULL,
  `opcelular` varchar(100) DEFAULT 'nenhuma',
  `status` enum('aberto','concluido','pendente','atrasado') DEFAULT 'aberto',
  `coordenadas` varchar(127) DEFAULT NULL,
  `login_atend` varchar(63) DEFAULT 'full_users',
  `ramal` varchar(255) DEFAULT NULL,
  `termo` varchar(16) DEFAULT NULL,
  `opcelular2` varchar(32) DEFAULT 'nenhuma',
  `celular2` varchar(32) DEFAULT NULL,
  `naturalidade` varchar(50) DEFAULT NULL,
  `dot_ref` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `login` (`login`),
  KEY `cpf` (`cpf`),
  KEY `tecnico` (`tecnico`),
  KEY `login_atend` (`login_atend`),
  KEY `uuid_solic` (`uuid_solic`)
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC DEFAULT CHARSET=latin1 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_solic`
--

LOCK TABLES `sis_solic` WRITE;
/*!40000 ALTER TABLE `sis_solic` DISABLE KEYS */;
/*!40000 ALTER TABLE `sis_solic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_spedfiles`
--

DROP TABLE IF EXISTS `sis_spedfiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_spedfiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid_nfefiles` varchar(48) DEFAULT NULL,
  `data` datetime DEFAULT NULL,
  `arquivo` varchar(128) DEFAULT NULL,
  `referencia` varchar(8) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `uuid_nfefiles` (`uuid_nfefiles`)
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_spedfiles`
--

LOCK TABLES `sis_spedfiles` WRITE;
/*!40000 ALTER TABLE `sis_spedfiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `sis_spedfiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_suporte`
--

DROP TABLE IF EXISTS `sis_suporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_suporte` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid_suporte` varchar(48) DEFAULT NULL,
  `assunto` varchar(255) DEFAULT NULL,
  `abertura` datetime DEFAULT NULL,
  `fechamento` datetime DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT 'aberto',
  `chamado` varchar(255) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `login` varchar(255) DEFAULT NULL,
  `atendente` varchar(255) DEFAULT NULL,
  `visita` datetime DEFAULT NULL,
  `prioridade` varchar(20) DEFAULT 'normal',
  `ramal` varchar(20) DEFAULT 'todos',
  `reply` enum('sim','nao') DEFAULT 'nao',
  `tecnico` int(11) DEFAULT NULL,
  `login_atend` varchar(63) DEFAULT 'full_users',
  `motivo_fechar` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `chamado` (`chamado`),
  KEY `login` (`login`),
  KEY `login_atend` (`login_atend`),
  KEY `visita` (`visita`),
  KEY `uuid_suporte` (`uuid_suporte`)
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC DEFAULT CHARSET=latin1 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_suporte`
--

LOCK TABLES `sis_suporte` WRITE;
/*!40000 ALTER TABLE `sis_suporte` DISABLE KEYS */;
/*!40000 ALTER TABLE `sis_suporte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `vtab_ativ`
--

DROP TABLE IF EXISTS `vtab_ativ`;
/*!50001 DROP VIEW IF EXISTS `vtab_ativ`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vtab_ativ` (
  `id` tinyint NOT NULL,
  `registro` tinyint NOT NULL,
  `data` tinyint NOT NULL,
  `login` tinyint NOT NULL,
  `ip` tinyint NOT NULL,
  `tipo` tinyint NOT NULL,
  `operacao` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vtab_car_noimpress`
--

DROP TABLE IF EXISTS `vtab_car_noimpress`;
/*!50001 DROP VIEW IF EXISTS `vtab_car_noimpress`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vtab_car_noimpress` (
  `id` tinyint NOT NULL,
  `nome` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `endereco` tinyint NOT NULL,
  `bairro` tinyint NOT NULL,
  `cidade` tinyint NOT NULL,
  `cep` tinyint NOT NULL,
  `estado` tinyint NOT NULL,
  `cpf_cnpj` tinyint NOT NULL,
  `fone` tinyint NOT NULL,
  `obs` tinyint NOT NULL,
  `nascimento` tinyint NOT NULL,
  `estado_civil` tinyint NOT NULL,
  `cadastro` tinyint NOT NULL,
  `login` tinyint NOT NULL,
  `tipo` tinyint NOT NULL,
  `night` tinyint NOT NULL,
  `aviso` tinyint NOT NULL,
  `foto` tinyint NOT NULL,
  `venc` tinyint NOT NULL,
  `mac` tinyint NOT NULL,
  `complemento` tinyint NOT NULL,
  `ip` tinyint NOT NULL,
  `ramal` tinyint NOT NULL,
  `rg` tinyint NOT NULL,
  `isento` tinyint NOT NULL,
  `celular` tinyint NOT NULL,
  `bloqueado` tinyint NOT NULL,
  `autoip` tinyint NOT NULL,
  `automac` tinyint NOT NULL,
  `conta` tinyint NOT NULL,
  `ipvsix` tinyint NOT NULL,
  `plano` tinyint NOT NULL,
  `send` tinyint NOT NULL,
  `cli_ativado` tinyint NOT NULL,
  `simultaneo` tinyint NOT NULL,
  `turbo` tinyint NOT NULL,
  `comodato` tinyint NOT NULL,
  `observacao` tinyint NOT NULL,
  `chavetipo` tinyint NOT NULL,
  `chave` tinyint NOT NULL,
  `contrato` tinyint NOT NULL,
  `ssid` tinyint NOT NULL,
  `senha` tinyint NOT NULL,
  `numero` tinyint NOT NULL,
  `responsavel` tinyint NOT NULL,
  `nome_pai` tinyint NOT NULL,
  `nome_mae` tinyint NOT NULL,
  `expedicao_rg` tinyint NOT NULL,
  `naturalidade` tinyint NOT NULL,
  `acessacen` tinyint NOT NULL,
  `pessoa` tinyint NOT NULL,
  `endereco_res` tinyint NOT NULL,
  `numero_res` tinyint NOT NULL,
  `bairro_res` tinyint NOT NULL,
  `cidade_res` tinyint NOT NULL,
  `cep_res` tinyint NOT NULL,
  `estado_res` tinyint NOT NULL,
  `complemento_res` tinyint NOT NULL,
  `desconto` tinyint NOT NULL,
  `acrescimo` tinyint NOT NULL,
  `equipamento` tinyint NOT NULL,
  `vendedor` tinyint NOT NULL,
  `nextel` tinyint NOT NULL,
  `accesslist` tinyint NOT NULL,
  `resumo` tinyint NOT NULL,
  `grupo` tinyint NOT NULL,
  `codigo` tinyint NOT NULL,
  `prilanc` tinyint NOT NULL,
  `tipobloq` tinyint NOT NULL,
  `adesao` tinyint NOT NULL,
  `mbdisco` tinyint NOT NULL,
  `sms` tinyint NOT NULL,
  `zap` tinyint NOT NULL,
  `ltrafego` tinyint NOT NULL,
  `planodown` tinyint NOT NULL,
  `ligoudown` tinyint NOT NULL,
  `statusdown` tinyint NOT NULL,
  `statusturbo` tinyint NOT NULL,
  `opcelular` tinyint NOT NULL,
  `nome_res` tinyint NOT NULL,
  `coordenadas` tinyint NOT NULL,
  `rem_obs` tinyint NOT NULL,
  `valor_sva` tinyint NOT NULL,
  `dias_corte` tinyint NOT NULL,
  `user_ip` tinyint NOT NULL,
  `user_mac` tinyint NOT NULL,
  `data_ip` tinyint NOT NULL,
  `data_mac` tinyint NOT NULL,
  `last_update` tinyint NOT NULL,
  `data_bloq` tinyint NOT NULL,
  `tags` tinyint NOT NULL,
  `tecnico` tinyint NOT NULL,
  `data_ins` tinyint NOT NULL,
  `altsenha` tinyint NOT NULL,
  `geranfe` tinyint NOT NULL,
  `mesref` tinyint NOT NULL,
  `ipfall` tinyint NOT NULL,
  `tit_abertos` tinyint NOT NULL,
  `parc_abertas` tinyint NOT NULL,
  `tipo_pessoa` tinyint NOT NULL,
  `celular2` tinyint NOT NULL,
  `mac_serial` tinyint NOT NULL,
  `status_corte` tinyint NOT NULL,
  `plano15` tinyint NOT NULL,
  `pgaviso` tinyint NOT NULL,
  `porta_olt` tinyint NOT NULL,
  `caixa_herm` tinyint NOT NULL,
  `porta_splitter` tinyint NOT NULL,
  `onu_ont` tinyint NOT NULL,
  `switch` tinyint NOT NULL,
  `tit_vencidos` tinyint NOT NULL,
  `pgcorte` tinyint NOT NULL,
  `interface` tinyint NOT NULL,
  `login_atend` tinyint NOT NULL,
  `cidade_ibge` tinyint NOT NULL,
  `estado_ibge` tinyint NOT NULL,
  `data_desbloq` tinyint NOT NULL,
  `pool_name` tinyint NOT NULL,
  `pool6` tinyint NOT NULL,
  `rec_email` tinyint NOT NULL,
  `termo` tinyint NOT NULL,
  `opcelular2` tinyint NOT NULL,
  `dot_ref` tinyint NOT NULL,
  `tipo_cliente` tinyint NOT NULL,
  `armario_olt` tinyint NOT NULL,
  `conta_cartao` tinyint NOT NULL,
  `plano_bloqc` tinyint NOT NULL,
  `uuid_cliente` tinyint NOT NULL,
  `data_desativacao` tinyint NOT NULL,
  `tipo_cob` tinyint NOT NULL,
  `fortunus` tinyint NOT NULL,
  `gsici` tinyint NOT NULL,
  `local_dici` tinyint NOT NULL,
  `parcelas` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vtab_comerros`
--

DROP TABLE IF EXISTS `vtab_comerros`;
/*!50001 DROP VIEW IF EXISTS `vtab_comerros`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vtab_comerros` (
  `tentativas` tinyint NOT NULL,
  `id` tinyint NOT NULL,
  `nome` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `endereco` tinyint NOT NULL,
  `bairro` tinyint NOT NULL,
  `cidade` tinyint NOT NULL,
  `cep` tinyint NOT NULL,
  `estado` tinyint NOT NULL,
  `cpf_cnpj` tinyint NOT NULL,
  `fone` tinyint NOT NULL,
  `obs` tinyint NOT NULL,
  `nascimento` tinyint NOT NULL,
  `estado_civil` tinyint NOT NULL,
  `cadastro` tinyint NOT NULL,
  `login` tinyint NOT NULL,
  `tipo` tinyint NOT NULL,
  `night` tinyint NOT NULL,
  `aviso` tinyint NOT NULL,
  `foto` tinyint NOT NULL,
  `venc` tinyint NOT NULL,
  `mac` tinyint NOT NULL,
  `complemento` tinyint NOT NULL,
  `ip` tinyint NOT NULL,
  `ramal` tinyint NOT NULL,
  `rg` tinyint NOT NULL,
  `isento` tinyint NOT NULL,
  `celular` tinyint NOT NULL,
  `bloqueado` tinyint NOT NULL,
  `autoip` tinyint NOT NULL,
  `automac` tinyint NOT NULL,
  `conta` tinyint NOT NULL,
  `ipvsix` tinyint NOT NULL,
  `plano` tinyint NOT NULL,
  `send` tinyint NOT NULL,
  `cli_ativado` tinyint NOT NULL,
  `simultaneo` tinyint NOT NULL,
  `turbo` tinyint NOT NULL,
  `comodato` tinyint NOT NULL,
  `observacao` tinyint NOT NULL,
  `chavetipo` tinyint NOT NULL,
  `chave` tinyint NOT NULL,
  `contrato` tinyint NOT NULL,
  `ssid` tinyint NOT NULL,
  `senha` tinyint NOT NULL,
  `numero` tinyint NOT NULL,
  `responsavel` tinyint NOT NULL,
  `nome_pai` tinyint NOT NULL,
  `nome_mae` tinyint NOT NULL,
  `expedicao_rg` tinyint NOT NULL,
  `naturalidade` tinyint NOT NULL,
  `acessacen` tinyint NOT NULL,
  `pessoa` tinyint NOT NULL,
  `endereco_res` tinyint NOT NULL,
  `numero_res` tinyint NOT NULL,
  `bairro_res` tinyint NOT NULL,
  `cidade_res` tinyint NOT NULL,
  `cep_res` tinyint NOT NULL,
  `estado_res` tinyint NOT NULL,
  `complemento_res` tinyint NOT NULL,
  `desconto` tinyint NOT NULL,
  `acrescimo` tinyint NOT NULL,
  `equipamento` tinyint NOT NULL,
  `vendedor` tinyint NOT NULL,
  `nextel` tinyint NOT NULL,
  `accesslist` tinyint NOT NULL,
  `resumo` tinyint NOT NULL,
  `grupo` tinyint NOT NULL,
  `codigo` tinyint NOT NULL,
  `prilanc` tinyint NOT NULL,
  `tipobloq` tinyint NOT NULL,
  `adesao` tinyint NOT NULL,
  `mbdisco` tinyint NOT NULL,
  `sms` tinyint NOT NULL,
  `zap` tinyint NOT NULL,
  `ltrafego` tinyint NOT NULL,
  `planodown` tinyint NOT NULL,
  `ligoudown` tinyint NOT NULL,
  `statusdown` tinyint NOT NULL,
  `statusturbo` tinyint NOT NULL,
  `opcelular` tinyint NOT NULL,
  `nome_res` tinyint NOT NULL,
  `coordenadas` tinyint NOT NULL,
  `rem_obs` tinyint NOT NULL,
  `valor_sva` tinyint NOT NULL,
  `dias_corte` tinyint NOT NULL,
  `user_ip` tinyint NOT NULL,
  `user_mac` tinyint NOT NULL,
  `data_ip` tinyint NOT NULL,
  `data_mac` tinyint NOT NULL,
  `last_update` tinyint NOT NULL,
  `data_bloq` tinyint NOT NULL,
  `tags` tinyint NOT NULL,
  `tecnico` tinyint NOT NULL,
  `data_ins` tinyint NOT NULL,
  `altsenha` tinyint NOT NULL,
  `geranfe` tinyint NOT NULL,
  `mesref` tinyint NOT NULL,
  `ipfall` tinyint NOT NULL,
  `tit_abertos` tinyint NOT NULL,
  `parc_abertas` tinyint NOT NULL,
  `tipo_pessoa` tinyint NOT NULL,
  `celular2` tinyint NOT NULL,
  `mac_serial` tinyint NOT NULL,
  `status_corte` tinyint NOT NULL,
  `plano15` tinyint NOT NULL,
  `pgaviso` tinyint NOT NULL,
  `porta_olt` tinyint NOT NULL,
  `caixa_herm` tinyint NOT NULL,
  `porta_splitter` tinyint NOT NULL,
  `onu_ont` tinyint NOT NULL,
  `switch` tinyint NOT NULL,
  `tit_vencidos` tinyint NOT NULL,
  `pgcorte` tinyint NOT NULL,
  `interface` tinyint NOT NULL,
  `login_atend` tinyint NOT NULL,
  `cidade_ibge` tinyint NOT NULL,
  `estado_ibge` tinyint NOT NULL,
  `data_desbloq` tinyint NOT NULL,
  `pool_name` tinyint NOT NULL,
  `pool6` tinyint NOT NULL,
  `rec_email` tinyint NOT NULL,
  `termo` tinyint NOT NULL,
  `opcelular2` tinyint NOT NULL,
  `dot_ref` tinyint NOT NULL,
  `tipo_cliente` tinyint NOT NULL,
  `armario_olt` tinyint NOT NULL,
  `conta_cartao` tinyint NOT NULL,
  `plano_bloqc` tinyint NOT NULL,
  `uuid_cliente` tinyint NOT NULL,
  `data_desativacao` tinyint NOT NULL,
  `tipo_cob` tinyint NOT NULL,
  `fortunus` tinyint NOT NULL,
  `gsici` tinyint NOT NULL,
  `local_dici` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vtab_conectados`
--

DROP TABLE IF EXISTS `vtab_conectados`;
/*!50001 DROP VIEW IF EXISTS `vtab_conectados`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vtab_conectados` (
  `id` tinyint NOT NULL,
  `nome` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `endereco` tinyint NOT NULL,
  `bairro` tinyint NOT NULL,
  `cidade` tinyint NOT NULL,
  `cep` tinyint NOT NULL,
  `estado` tinyint NOT NULL,
  `cpf_cnpj` tinyint NOT NULL,
  `fone` tinyint NOT NULL,
  `obs` tinyint NOT NULL,
  `nascimento` tinyint NOT NULL,
  `estado_civil` tinyint NOT NULL,
  `cadastro` tinyint NOT NULL,
  `login` tinyint NOT NULL,
  `tipo` tinyint NOT NULL,
  `night` tinyint NOT NULL,
  `aviso` tinyint NOT NULL,
  `foto` tinyint NOT NULL,
  `venc` tinyint NOT NULL,
  `mac` tinyint NOT NULL,
  `complemento` tinyint NOT NULL,
  `ip` tinyint NOT NULL,
  `ramal` tinyint NOT NULL,
  `rg` tinyint NOT NULL,
  `isento` tinyint NOT NULL,
  `celular` tinyint NOT NULL,
  `bloqueado` tinyint NOT NULL,
  `autoip` tinyint NOT NULL,
  `automac` tinyint NOT NULL,
  `conta` tinyint NOT NULL,
  `ipvsix` tinyint NOT NULL,
  `plano` tinyint NOT NULL,
  `send` tinyint NOT NULL,
  `cli_ativado` tinyint NOT NULL,
  `simultaneo` tinyint NOT NULL,
  `turbo` tinyint NOT NULL,
  `comodato` tinyint NOT NULL,
  `observacao` tinyint NOT NULL,
  `chavetipo` tinyint NOT NULL,
  `chave` tinyint NOT NULL,
  `contrato` tinyint NOT NULL,
  `ssid` tinyint NOT NULL,
  `senha` tinyint NOT NULL,
  `numero` tinyint NOT NULL,
  `responsavel` tinyint NOT NULL,
  `nome_pai` tinyint NOT NULL,
  `nome_mae` tinyint NOT NULL,
  `expedicao_rg` tinyint NOT NULL,
  `naturalidade` tinyint NOT NULL,
  `acessacen` tinyint NOT NULL,
  `pessoa` tinyint NOT NULL,
  `endereco_res` tinyint NOT NULL,
  `numero_res` tinyint NOT NULL,
  `bairro_res` tinyint NOT NULL,
  `cidade_res` tinyint NOT NULL,
  `cep_res` tinyint NOT NULL,
  `estado_res` tinyint NOT NULL,
  `complemento_res` tinyint NOT NULL,
  `desconto` tinyint NOT NULL,
  `acrescimo` tinyint NOT NULL,
  `equipamento` tinyint NOT NULL,
  `vendedor` tinyint NOT NULL,
  `nextel` tinyint NOT NULL,
  `accesslist` tinyint NOT NULL,
  `resumo` tinyint NOT NULL,
  `grupo` tinyint NOT NULL,
  `codigo` tinyint NOT NULL,
  `prilanc` tinyint NOT NULL,
  `tipobloq` tinyint NOT NULL,
  `adesao` tinyint NOT NULL,
  `mbdisco` tinyint NOT NULL,
  `sms` tinyint NOT NULL,
  `zap` tinyint NOT NULL,
  `ltrafego` tinyint NOT NULL,
  `planodown` tinyint NOT NULL,
  `ligoudown` tinyint NOT NULL,
  `statusdown` tinyint NOT NULL,
  `statusturbo` tinyint NOT NULL,
  `opcelular` tinyint NOT NULL,
  `nome_res` tinyint NOT NULL,
  `coordenadas` tinyint NOT NULL,
  `rem_obs` tinyint NOT NULL,
  `valor_sva` tinyint NOT NULL,
  `dias_corte` tinyint NOT NULL,
  `user_ip` tinyint NOT NULL,
  `user_mac` tinyint NOT NULL,
  `data_ip` tinyint NOT NULL,
  `data_mac` tinyint NOT NULL,
  `last_update` tinyint NOT NULL,
  `data_bloq` tinyint NOT NULL,
  `tags` tinyint NOT NULL,
  `tecnico` tinyint NOT NULL,
  `data_ins` tinyint NOT NULL,
  `altsenha` tinyint NOT NULL,
  `geranfe` tinyint NOT NULL,
  `mesref` tinyint NOT NULL,
  `ipfall` tinyint NOT NULL,
  `tit_abertos` tinyint NOT NULL,
  `parc_abertas` tinyint NOT NULL,
  `tipo_pessoa` tinyint NOT NULL,
  `celular2` tinyint NOT NULL,
  `mac_serial` tinyint NOT NULL,
  `status_corte` tinyint NOT NULL,
  `plano15` tinyint NOT NULL,
  `pgaviso` tinyint NOT NULL,
  `porta_olt` tinyint NOT NULL,
  `caixa_herm` tinyint NOT NULL,
  `porta_splitter` tinyint NOT NULL,
  `onu_ont` tinyint NOT NULL,
  `switch` tinyint NOT NULL,
  `tit_vencidos` tinyint NOT NULL,
  `pgcorte` tinyint NOT NULL,
  `interface` tinyint NOT NULL,
  `login_atend` tinyint NOT NULL,
  `cidade_ibge` tinyint NOT NULL,
  `estado_ibge` tinyint NOT NULL,
  `data_desbloq` tinyint NOT NULL,
  `pool_name` tinyint NOT NULL,
  `pool6` tinyint NOT NULL,
  `rec_email` tinyint NOT NULL,
  `termo` tinyint NOT NULL,
  `opcelular2` tinyint NOT NULL,
  `dot_ref` tinyint NOT NULL,
  `tipo_cliente` tinyint NOT NULL,
  `armario_olt` tinyint NOT NULL,
  `conta_cartao` tinyint NOT NULL,
  `plano_bloqc` tinyint NOT NULL,
  `uuid_cliente` tinyint NOT NULL,
  `data_desativacao` tinyint NOT NULL,
  `tipo_cob` tinyint NOT NULL,
  `fortunus` tinyint NOT NULL,
  `gsici` tinyint NOT NULL,
  `local_dici` tinyint NOT NULL,
  `acctuniqueid` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vtab_desbloqueio`
--

DROP TABLE IF EXISTS `vtab_desbloqueio`;
/*!50001 DROP VIEW IF EXISTS `vtab_desbloqueio`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vtab_desbloqueio` (
  `login` tinyint NOT NULL,
  `id` tinyint NOT NULL,
  `celular` tinyint NOT NULL,
  `nome_res` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `dias_corte` tinyint NOT NULL,
  `tipo_cob` tinyint NOT NULL,
  `tit_abertos` tinyint NOT NULL,
  `parc_abertas` tinyint NOT NULL,
  `datavenc` tinyint NOT NULL,
  `titulo` tinyint NOT NULL,
  `deltitulo` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vtab_ematraso`
--

DROP TABLE IF EXISTS `vtab_ematraso`;
/*!50001 DROP VIEW IF EXISTS `vtab_ematraso`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vtab_ematraso` (
  `id` tinyint NOT NULL,
  `nome` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `endereco` tinyint NOT NULL,
  `bairro` tinyint NOT NULL,
  `cidade` tinyint NOT NULL,
  `cep` tinyint NOT NULL,
  `estado` tinyint NOT NULL,
  `cpf_cnpj` tinyint NOT NULL,
  `fone` tinyint NOT NULL,
  `obs` tinyint NOT NULL,
  `nascimento` tinyint NOT NULL,
  `estado_civil` tinyint NOT NULL,
  `cadastro` tinyint NOT NULL,
  `login` tinyint NOT NULL,
  `tipo` tinyint NOT NULL,
  `night` tinyint NOT NULL,
  `aviso` tinyint NOT NULL,
  `foto` tinyint NOT NULL,
  `venc` tinyint NOT NULL,
  `mac` tinyint NOT NULL,
  `complemento` tinyint NOT NULL,
  `ip` tinyint NOT NULL,
  `ramal` tinyint NOT NULL,
  `rg` tinyint NOT NULL,
  `isento` tinyint NOT NULL,
  `celular` tinyint NOT NULL,
  `bloqueado` tinyint NOT NULL,
  `autoip` tinyint NOT NULL,
  `automac` tinyint NOT NULL,
  `conta` tinyint NOT NULL,
  `ipvsix` tinyint NOT NULL,
  `plano` tinyint NOT NULL,
  `send` tinyint NOT NULL,
  `cli_ativado` tinyint NOT NULL,
  `simultaneo` tinyint NOT NULL,
  `turbo` tinyint NOT NULL,
  `comodato` tinyint NOT NULL,
  `observacao` tinyint NOT NULL,
  `chavetipo` tinyint NOT NULL,
  `chave` tinyint NOT NULL,
  `contrato` tinyint NOT NULL,
  `ssid` tinyint NOT NULL,
  `senha` tinyint NOT NULL,
  `numero` tinyint NOT NULL,
  `responsavel` tinyint NOT NULL,
  `nome_pai` tinyint NOT NULL,
  `nome_mae` tinyint NOT NULL,
  `expedicao_rg` tinyint NOT NULL,
  `naturalidade` tinyint NOT NULL,
  `acessacen` tinyint NOT NULL,
  `pessoa` tinyint NOT NULL,
  `endereco_res` tinyint NOT NULL,
  `numero_res` tinyint NOT NULL,
  `bairro_res` tinyint NOT NULL,
  `cidade_res` tinyint NOT NULL,
  `cep_res` tinyint NOT NULL,
  `estado_res` tinyint NOT NULL,
  `complemento_res` tinyint NOT NULL,
  `desconto` tinyint NOT NULL,
  `acrescimo` tinyint NOT NULL,
  `equipamento` tinyint NOT NULL,
  `vendedor` tinyint NOT NULL,
  `nextel` tinyint NOT NULL,
  `accesslist` tinyint NOT NULL,
  `resumo` tinyint NOT NULL,
  `grupo` tinyint NOT NULL,
  `codigo` tinyint NOT NULL,
  `prilanc` tinyint NOT NULL,
  `tipobloq` tinyint NOT NULL,
  `adesao` tinyint NOT NULL,
  `mbdisco` tinyint NOT NULL,
  `sms` tinyint NOT NULL,
  `zap` tinyint NOT NULL,
  `ltrafego` tinyint NOT NULL,
  `planodown` tinyint NOT NULL,
  `ligoudown` tinyint NOT NULL,
  `statusdown` tinyint NOT NULL,
  `statusturbo` tinyint NOT NULL,
  `opcelular` tinyint NOT NULL,
  `nome_res` tinyint NOT NULL,
  `coordenadas` tinyint NOT NULL,
  `rem_obs` tinyint NOT NULL,
  `valor_sva` tinyint NOT NULL,
  `dias_corte` tinyint NOT NULL,
  `user_ip` tinyint NOT NULL,
  `user_mac` tinyint NOT NULL,
  `data_ip` tinyint NOT NULL,
  `data_mac` tinyint NOT NULL,
  `last_update` tinyint NOT NULL,
  `data_bloq` tinyint NOT NULL,
  `tags` tinyint NOT NULL,
  `tecnico` tinyint NOT NULL,
  `data_ins` tinyint NOT NULL,
  `altsenha` tinyint NOT NULL,
  `geranfe` tinyint NOT NULL,
  `mesref` tinyint NOT NULL,
  `ipfall` tinyint NOT NULL,
  `tit_abertos` tinyint NOT NULL,
  `parc_abertas` tinyint NOT NULL,
  `tipo_pessoa` tinyint NOT NULL,
  `celular2` tinyint NOT NULL,
  `mac_serial` tinyint NOT NULL,
  `status_corte` tinyint NOT NULL,
  `plano15` tinyint NOT NULL,
  `pgaviso` tinyint NOT NULL,
  `porta_olt` tinyint NOT NULL,
  `caixa_herm` tinyint NOT NULL,
  `porta_splitter` tinyint NOT NULL,
  `onu_ont` tinyint NOT NULL,
  `switch` tinyint NOT NULL,
  `tit_vencidos` tinyint NOT NULL,
  `pgcorte` tinyint NOT NULL,
  `interface` tinyint NOT NULL,
  `login_atend` tinyint NOT NULL,
  `cidade_ibge` tinyint NOT NULL,
  `estado_ibge` tinyint NOT NULL,
  `data_desbloq` tinyint NOT NULL,
  `pool_name` tinyint NOT NULL,
  `pool6` tinyint NOT NULL,
  `rec_email` tinyint NOT NULL,
  `termo` tinyint NOT NULL,
  `opcelular2` tinyint NOT NULL,
  `dot_ref` tinyint NOT NULL,
  `tipo_cliente` tinyint NOT NULL,
  `armario_olt` tinyint NOT NULL,
  `conta_cartao` tinyint NOT NULL,
  `plano_bloqc` tinyint NOT NULL,
  `uuid_cliente` tinyint NOT NULL,
  `data_desativacao` tinyint NOT NULL,
  `tipo_cob` tinyint NOT NULL,
  `fortunus` tinyint NOT NULL,
  `gsici` tinyint NOT NULL,
  `local_dici` tinyint NOT NULL,
  `datavenc` tinyint NOT NULL,
  `tit_vencidos2` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vtab_fat_noimpress`
--

DROP TABLE IF EXISTS `vtab_fat_noimpress`;
/*!50001 DROP VIEW IF EXISTS `vtab_fat_noimpress`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vtab_fat_noimpress` (
  `id` tinyint NOT NULL,
  `nome` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `endereco` tinyint NOT NULL,
  `bairro` tinyint NOT NULL,
  `cidade` tinyint NOT NULL,
  `cep` tinyint NOT NULL,
  `estado` tinyint NOT NULL,
  `cpf_cnpj` tinyint NOT NULL,
  `fone` tinyint NOT NULL,
  `obs` tinyint NOT NULL,
  `nascimento` tinyint NOT NULL,
  `estado_civil` tinyint NOT NULL,
  `cadastro` tinyint NOT NULL,
  `login` tinyint NOT NULL,
  `tipo` tinyint NOT NULL,
  `night` tinyint NOT NULL,
  `aviso` tinyint NOT NULL,
  `foto` tinyint NOT NULL,
  `venc` tinyint NOT NULL,
  `mac` tinyint NOT NULL,
  `complemento` tinyint NOT NULL,
  `ip` tinyint NOT NULL,
  `ramal` tinyint NOT NULL,
  `rg` tinyint NOT NULL,
  `isento` tinyint NOT NULL,
  `celular` tinyint NOT NULL,
  `bloqueado` tinyint NOT NULL,
  `autoip` tinyint NOT NULL,
  `automac` tinyint NOT NULL,
  `conta` tinyint NOT NULL,
  `ipvsix` tinyint NOT NULL,
  `plano` tinyint NOT NULL,
  `send` tinyint NOT NULL,
  `cli_ativado` tinyint NOT NULL,
  `simultaneo` tinyint NOT NULL,
  `turbo` tinyint NOT NULL,
  `comodato` tinyint NOT NULL,
  `observacao` tinyint NOT NULL,
  `chavetipo` tinyint NOT NULL,
  `chave` tinyint NOT NULL,
  `contrato` tinyint NOT NULL,
  `ssid` tinyint NOT NULL,
  `senha` tinyint NOT NULL,
  `numero` tinyint NOT NULL,
  `responsavel` tinyint NOT NULL,
  `nome_pai` tinyint NOT NULL,
  `nome_mae` tinyint NOT NULL,
  `expedicao_rg` tinyint NOT NULL,
  `naturalidade` tinyint NOT NULL,
  `acessacen` tinyint NOT NULL,
  `pessoa` tinyint NOT NULL,
  `endereco_res` tinyint NOT NULL,
  `numero_res` tinyint NOT NULL,
  `bairro_res` tinyint NOT NULL,
  `cidade_res` tinyint NOT NULL,
  `cep_res` tinyint NOT NULL,
  `estado_res` tinyint NOT NULL,
  `complemento_res` tinyint NOT NULL,
  `desconto` tinyint NOT NULL,
  `acrescimo` tinyint NOT NULL,
  `equipamento` tinyint NOT NULL,
  `vendedor` tinyint NOT NULL,
  `nextel` tinyint NOT NULL,
  `accesslist` tinyint NOT NULL,
  `resumo` tinyint NOT NULL,
  `grupo` tinyint NOT NULL,
  `codigo` tinyint NOT NULL,
  `prilanc` tinyint NOT NULL,
  `tipobloq` tinyint NOT NULL,
  `adesao` tinyint NOT NULL,
  `mbdisco` tinyint NOT NULL,
  `sms` tinyint NOT NULL,
  `zap` tinyint NOT NULL,
  `ltrafego` tinyint NOT NULL,
  `planodown` tinyint NOT NULL,
  `ligoudown` tinyint NOT NULL,
  `statusdown` tinyint NOT NULL,
  `statusturbo` tinyint NOT NULL,
  `opcelular` tinyint NOT NULL,
  `nome_res` tinyint NOT NULL,
  `coordenadas` tinyint NOT NULL,
  `rem_obs` tinyint NOT NULL,
  `valor_sva` tinyint NOT NULL,
  `dias_corte` tinyint NOT NULL,
  `user_ip` tinyint NOT NULL,
  `user_mac` tinyint NOT NULL,
  `data_ip` tinyint NOT NULL,
  `data_mac` tinyint NOT NULL,
  `last_update` tinyint NOT NULL,
  `data_bloq` tinyint NOT NULL,
  `tags` tinyint NOT NULL,
  `tecnico` tinyint NOT NULL,
  `data_ins` tinyint NOT NULL,
  `altsenha` tinyint NOT NULL,
  `geranfe` tinyint NOT NULL,
  `mesref` tinyint NOT NULL,
  `ipfall` tinyint NOT NULL,
  `tit_abertos` tinyint NOT NULL,
  `parc_abertas` tinyint NOT NULL,
  `tipo_pessoa` tinyint NOT NULL,
  `celular2` tinyint NOT NULL,
  `mac_serial` tinyint NOT NULL,
  `status_corte` tinyint NOT NULL,
  `plano15` tinyint NOT NULL,
  `pgaviso` tinyint NOT NULL,
  `porta_olt` tinyint NOT NULL,
  `caixa_herm` tinyint NOT NULL,
  `porta_splitter` tinyint NOT NULL,
  `onu_ont` tinyint NOT NULL,
  `switch` tinyint NOT NULL,
  `tit_vencidos` tinyint NOT NULL,
  `pgcorte` tinyint NOT NULL,
  `interface` tinyint NOT NULL,
  `login_atend` tinyint NOT NULL,
  `cidade_ibge` tinyint NOT NULL,
  `estado_ibge` tinyint NOT NULL,
  `data_desbloq` tinyint NOT NULL,
  `pool_name` tinyint NOT NULL,
  `pool6` tinyint NOT NULL,
  `rec_email` tinyint NOT NULL,
  `termo` tinyint NOT NULL,
  `opcelular2` tinyint NOT NULL,
  `dot_ref` tinyint NOT NULL,
  `tipo_cliente` tinyint NOT NULL,
  `armario_olt` tinyint NOT NULL,
  `conta_cartao` tinyint NOT NULL,
  `plano_bloqc` tinyint NOT NULL,
  `uuid_cliente` tinyint NOT NULL,
  `data_desativacao` tinyint NOT NULL,
  `tipo_cob` tinyint NOT NULL,
  `fortunus` tinyint NOT NULL,
  `gsici` tinyint NOT NULL,
  `local_dici` tinyint NOT NULL,
  `nossonum` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vtab_mtitulos`
--

DROP TABLE IF EXISTS `vtab_mtitulos`;
/*!50001 DROP VIEW IF EXISTS `vtab_mtitulos`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vtab_mtitulos` (
  `id` tinyint NOT NULL,
  `idlanc` tinyint NOT NULL,
  `valor` tinyint NOT NULL,
  `tipo` tinyint NOT NULL,
  `cfop_mlanc` tinyint NOT NULL,
  `desc` tinyint NOT NULL,
  `deltitulo` tinyint NOT NULL,
  `datavenc` tinyint NOT NULL,
  `datapag` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `login` tinyint NOT NULL,
  `bloqueado` tinyint NOT NULL,
  `mesref` tinyint NOT NULL,
  `cli_ativado` tinyint NOT NULL,
  `tipo_cob` tinyint NOT NULL,
  `tit_abertos` tinyint NOT NULL,
  `parc_abertas` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vtab_newcarne`
--

DROP TABLE IF EXISTS `vtab_newcarne`;
/*!50001 DROP VIEW IF EXISTS `vtab_newcarne`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vtab_newcarne` (
  `id` tinyint NOT NULL,
  `nome` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `endereco` tinyint NOT NULL,
  `bairro` tinyint NOT NULL,
  `cidade` tinyint NOT NULL,
  `cep` tinyint NOT NULL,
  `estado` tinyint NOT NULL,
  `cpf_cnpj` tinyint NOT NULL,
  `fone` tinyint NOT NULL,
  `obs` tinyint NOT NULL,
  `nascimento` tinyint NOT NULL,
  `estado_civil` tinyint NOT NULL,
  `cadastro` tinyint NOT NULL,
  `login` tinyint NOT NULL,
  `tipo` tinyint NOT NULL,
  `night` tinyint NOT NULL,
  `aviso` tinyint NOT NULL,
  `foto` tinyint NOT NULL,
  `venc` tinyint NOT NULL,
  `mac` tinyint NOT NULL,
  `complemento` tinyint NOT NULL,
  `ip` tinyint NOT NULL,
  `ramal` tinyint NOT NULL,
  `rg` tinyint NOT NULL,
  `isento` tinyint NOT NULL,
  `celular` tinyint NOT NULL,
  `bloqueado` tinyint NOT NULL,
  `autoip` tinyint NOT NULL,
  `automac` tinyint NOT NULL,
  `conta` tinyint NOT NULL,
  `ipvsix` tinyint NOT NULL,
  `plano` tinyint NOT NULL,
  `send` tinyint NOT NULL,
  `cli_ativado` tinyint NOT NULL,
  `simultaneo` tinyint NOT NULL,
  `turbo` tinyint NOT NULL,
  `comodato` tinyint NOT NULL,
  `observacao` tinyint NOT NULL,
  `chavetipo` tinyint NOT NULL,
  `chave` tinyint NOT NULL,
  `contrato` tinyint NOT NULL,
  `ssid` tinyint NOT NULL,
  `senha` tinyint NOT NULL,
  `numero` tinyint NOT NULL,
  `responsavel` tinyint NOT NULL,
  `nome_pai` tinyint NOT NULL,
  `nome_mae` tinyint NOT NULL,
  `expedicao_rg` tinyint NOT NULL,
  `naturalidade` tinyint NOT NULL,
  `acessacen` tinyint NOT NULL,
  `pessoa` tinyint NOT NULL,
  `endereco_res` tinyint NOT NULL,
  `numero_res` tinyint NOT NULL,
  `bairro_res` tinyint NOT NULL,
  `cidade_res` tinyint NOT NULL,
  `cep_res` tinyint NOT NULL,
  `estado_res` tinyint NOT NULL,
  `complemento_res` tinyint NOT NULL,
  `desconto` tinyint NOT NULL,
  `acrescimo` tinyint NOT NULL,
  `equipamento` tinyint NOT NULL,
  `vendedor` tinyint NOT NULL,
  `nextel` tinyint NOT NULL,
  `accesslist` tinyint NOT NULL,
  `resumo` tinyint NOT NULL,
  `grupo` tinyint NOT NULL,
  `codigo` tinyint NOT NULL,
  `prilanc` tinyint NOT NULL,
  `tipobloq` tinyint NOT NULL,
  `adesao` tinyint NOT NULL,
  `mbdisco` tinyint NOT NULL,
  `sms` tinyint NOT NULL,
  `zap` tinyint NOT NULL,
  `ltrafego` tinyint NOT NULL,
  `planodown` tinyint NOT NULL,
  `ligoudown` tinyint NOT NULL,
  `statusdown` tinyint NOT NULL,
  `statusturbo` tinyint NOT NULL,
  `opcelular` tinyint NOT NULL,
  `nome_res` tinyint NOT NULL,
  `coordenadas` tinyint NOT NULL,
  `rem_obs` tinyint NOT NULL,
  `valor_sva` tinyint NOT NULL,
  `dias_corte` tinyint NOT NULL,
  `user_ip` tinyint NOT NULL,
  `user_mac` tinyint NOT NULL,
  `data_ip` tinyint NOT NULL,
  `data_mac` tinyint NOT NULL,
  `last_update` tinyint NOT NULL,
  `data_bloq` tinyint NOT NULL,
  `tags` tinyint NOT NULL,
  `tecnico` tinyint NOT NULL,
  `data_ins` tinyint NOT NULL,
  `altsenha` tinyint NOT NULL,
  `geranfe` tinyint NOT NULL,
  `mesref` tinyint NOT NULL,
  `ipfall` tinyint NOT NULL,
  `tit_abertos` tinyint NOT NULL,
  `parc_abertas` tinyint NOT NULL,
  `tipo_pessoa` tinyint NOT NULL,
  `celular2` tinyint NOT NULL,
  `mac_serial` tinyint NOT NULL,
  `status_corte` tinyint NOT NULL,
  `plano15` tinyint NOT NULL,
  `pgaviso` tinyint NOT NULL,
  `porta_olt` tinyint NOT NULL,
  `caixa_herm` tinyint NOT NULL,
  `porta_splitter` tinyint NOT NULL,
  `onu_ont` tinyint NOT NULL,
  `switch` tinyint NOT NULL,
  `tit_vencidos` tinyint NOT NULL,
  `pgcorte` tinyint NOT NULL,
  `interface` tinyint NOT NULL,
  `login_atend` tinyint NOT NULL,
  `cidade_ibge` tinyint NOT NULL,
  `estado_ibge` tinyint NOT NULL,
  `data_desbloq` tinyint NOT NULL,
  `pool_name` tinyint NOT NULL,
  `pool6` tinyint NOT NULL,
  `rec_email` tinyint NOT NULL,
  `termo` tinyint NOT NULL,
  `opcelular2` tinyint NOT NULL,
  `dot_ref` tinyint NOT NULL,
  `tipo_cliente` tinyint NOT NULL,
  `armario_olt` tinyint NOT NULL,
  `conta_cartao` tinyint NOT NULL,
  `plano_bloqc` tinyint NOT NULL,
  `uuid_cliente` tinyint NOT NULL,
  `data_desativacao` tinyint NOT NULL,
  `tipo_cob` tinyint NOT NULL,
  `fortunus` tinyint NOT NULL,
  `gsici` tinyint NOT NULL,
  `local_dici` tinyint NOT NULL,
  `parcela` tinyint NOT NULL,
  `deltitulo` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vtab_newtitulo`
--

DROP TABLE IF EXISTS `vtab_newtitulo`;
/*!50001 DROP VIEW IF EXISTS `vtab_newtitulo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vtab_newtitulo` (
  `id` tinyint NOT NULL,
  `nome` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `endereco` tinyint NOT NULL,
  `bairro` tinyint NOT NULL,
  `cidade` tinyint NOT NULL,
  `cep` tinyint NOT NULL,
  `estado` tinyint NOT NULL,
  `cpf_cnpj` tinyint NOT NULL,
  `fone` tinyint NOT NULL,
  `obs` tinyint NOT NULL,
  `nascimento` tinyint NOT NULL,
  `estado_civil` tinyint NOT NULL,
  `cadastro` tinyint NOT NULL,
  `login` tinyint NOT NULL,
  `tipo` tinyint NOT NULL,
  `night` tinyint NOT NULL,
  `aviso` tinyint NOT NULL,
  `foto` tinyint NOT NULL,
  `venc` tinyint NOT NULL,
  `mac` tinyint NOT NULL,
  `complemento` tinyint NOT NULL,
  `ip` tinyint NOT NULL,
  `ramal` tinyint NOT NULL,
  `rg` tinyint NOT NULL,
  `isento` tinyint NOT NULL,
  `celular` tinyint NOT NULL,
  `bloqueado` tinyint NOT NULL,
  `autoip` tinyint NOT NULL,
  `automac` tinyint NOT NULL,
  `conta` tinyint NOT NULL,
  `ipvsix` tinyint NOT NULL,
  `plano` tinyint NOT NULL,
  `send` tinyint NOT NULL,
  `cli_ativado` tinyint NOT NULL,
  `simultaneo` tinyint NOT NULL,
  `turbo` tinyint NOT NULL,
  `comodato` tinyint NOT NULL,
  `observacao` tinyint NOT NULL,
  `chavetipo` tinyint NOT NULL,
  `chave` tinyint NOT NULL,
  `contrato` tinyint NOT NULL,
  `ssid` tinyint NOT NULL,
  `senha` tinyint NOT NULL,
  `numero` tinyint NOT NULL,
  `responsavel` tinyint NOT NULL,
  `nome_pai` tinyint NOT NULL,
  `nome_mae` tinyint NOT NULL,
  `expedicao_rg` tinyint NOT NULL,
  `naturalidade` tinyint NOT NULL,
  `acessacen` tinyint NOT NULL,
  `pessoa` tinyint NOT NULL,
  `endereco_res` tinyint NOT NULL,
  `numero_res` tinyint NOT NULL,
  `bairro_res` tinyint NOT NULL,
  `cidade_res` tinyint NOT NULL,
  `cep_res` tinyint NOT NULL,
  `estado_res` tinyint NOT NULL,
  `complemento_res` tinyint NOT NULL,
  `desconto` tinyint NOT NULL,
  `acrescimo` tinyint NOT NULL,
  `equipamento` tinyint NOT NULL,
  `vendedor` tinyint NOT NULL,
  `nextel` tinyint NOT NULL,
  `accesslist` tinyint NOT NULL,
  `resumo` tinyint NOT NULL,
  `grupo` tinyint NOT NULL,
  `codigo` tinyint NOT NULL,
  `prilanc` tinyint NOT NULL,
  `tipobloq` tinyint NOT NULL,
  `adesao` tinyint NOT NULL,
  `mbdisco` tinyint NOT NULL,
  `sms` tinyint NOT NULL,
  `zap` tinyint NOT NULL,
  `ltrafego` tinyint NOT NULL,
  `planodown` tinyint NOT NULL,
  `ligoudown` tinyint NOT NULL,
  `statusdown` tinyint NOT NULL,
  `statusturbo` tinyint NOT NULL,
  `opcelular` tinyint NOT NULL,
  `nome_res` tinyint NOT NULL,
  `coordenadas` tinyint NOT NULL,
  `rem_obs` tinyint NOT NULL,
  `valor_sva` tinyint NOT NULL,
  `dias_corte` tinyint NOT NULL,
  `user_ip` tinyint NOT NULL,
  `user_mac` tinyint NOT NULL,
  `data_ip` tinyint NOT NULL,
  `data_mac` tinyint NOT NULL,
  `last_update` tinyint NOT NULL,
  `data_bloq` tinyint NOT NULL,
  `tags` tinyint NOT NULL,
  `tecnico` tinyint NOT NULL,
  `data_ins` tinyint NOT NULL,
  `altsenha` tinyint NOT NULL,
  `geranfe` tinyint NOT NULL,
  `mesref` tinyint NOT NULL,
  `ipfall` tinyint NOT NULL,
  `tit_abertos` tinyint NOT NULL,
  `parc_abertas` tinyint NOT NULL,
  `tipo_pessoa` tinyint NOT NULL,
  `celular2` tinyint NOT NULL,
  `mac_serial` tinyint NOT NULL,
  `status_corte` tinyint NOT NULL,
  `plano15` tinyint NOT NULL,
  `pgaviso` tinyint NOT NULL,
  `porta_olt` tinyint NOT NULL,
  `caixa_herm` tinyint NOT NULL,
  `porta_splitter` tinyint NOT NULL,
  `onu_ont` tinyint NOT NULL,
  `switch` tinyint NOT NULL,
  `tit_vencidos` tinyint NOT NULL,
  `pgcorte` tinyint NOT NULL,
  `interface` tinyint NOT NULL,
  `login_atend` tinyint NOT NULL,
  `cidade_ibge` tinyint NOT NULL,
  `estado_ibge` tinyint NOT NULL,
  `data_desbloq` tinyint NOT NULL,
  `pool_name` tinyint NOT NULL,
  `pool6` tinyint NOT NULL,
  `rec_email` tinyint NOT NULL,
  `termo` tinyint NOT NULL,
  `opcelular2` tinyint NOT NULL,
  `dot_ref` tinyint NOT NULL,
  `tipo_cliente` tinyint NOT NULL,
  `armario_olt` tinyint NOT NULL,
  `conta_cartao` tinyint NOT NULL,
  `plano_bloqc` tinyint NOT NULL,
  `uuid_cliente` tinyint NOT NULL,
  `data_desativacao` tinyint NOT NULL,
  `tipo_cob` tinyint NOT NULL,
  `fortunus` tinyint NOT NULL,
  `gsici` tinyint NOT NULL,
  `local_dici` tinyint NOT NULL,
  `titulo` tinyint NOT NULL,
  `deltitulo` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vtab_remtitulos01`
--

DROP TABLE IF EXISTS `vtab_remtitulos01`;
/*!50001 DROP VIEW IF EXISTS `vtab_remtitulos01`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vtab_remtitulos01` (
  `nome` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `endereco` tinyint NOT NULL,
  `complemento` tinyint NOT NULL,
  `bairro` tinyint NOT NULL,
  `cidade` tinyint NOT NULL,
  `cep` tinyint NOT NULL,
  `estado` tinyint NOT NULL,
  `cpf_cnpj` tinyint NOT NULL,
  `login` tinyint NOT NULL,
  `venc` tinyint NOT NULL,
  `numero` tinyint NOT NULL,
  `cli_ativado` tinyint NOT NULL,
  `bloqueado` tinyint NOT NULL,
  `mesref` tinyint NOT NULL,
  `plano` tinyint NOT NULL,
  `grupo` tinyint NOT NULL,
  `ramal` tinyint NOT NULL,
  `data_bloq` tinyint NOT NULL,
  `tipo_cob` tinyint NOT NULL,
  `tit_abertos` tinyint NOT NULL,
  `parc_abertas` tinyint NOT NULL,
  `valor` tinyint NOT NULL,
  `titulo` tinyint NOT NULL,
  `imp` tinyint NOT NULL,
  `datavenc` tinyint NOT NULL,
  `referencia` tinyint NOT NULL,
  `nossonum` tinyint NOT NULL,
  `processamento` tinyint NOT NULL,
  `percmulta` tinyint NOT NULL,
  `valormulta` tinyint NOT NULL,
  `percmora` tinyint NOT NULL,
  `valormora` tinyint NOT NULL,
  `percdesc` tinyint NOT NULL,
  `valordesc` tinyint NOT NULL,
  `datapag` tinyint NOT NULL,
  `datadel` tinyint NOT NULL,
  `deltitulo` tinyint NOT NULL,
  `numconta` tinyint NOT NULL,
  `cod_ocorrencia` tinyint NOT NULL,
  `oco01` tinyint NOT NULL,
  `oco02` tinyint NOT NULL,
  `oco06` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vtab_remtitulos02`
--

DROP TABLE IF EXISTS `vtab_remtitulos02`;
/*!50001 DROP VIEW IF EXISTS `vtab_remtitulos02`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vtab_remtitulos02` (
  `nome` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `endereco` tinyint NOT NULL,
  `complemento` tinyint NOT NULL,
  `bairro` tinyint NOT NULL,
  `cidade` tinyint NOT NULL,
  `cep` tinyint NOT NULL,
  `estado` tinyint NOT NULL,
  `cpf_cnpj` tinyint NOT NULL,
  `login` tinyint NOT NULL,
  `venc` tinyint NOT NULL,
  `numero` tinyint NOT NULL,
  `cli_ativado` tinyint NOT NULL,
  `bloqueado` tinyint NOT NULL,
  `mesref` tinyint NOT NULL,
  `plano` tinyint NOT NULL,
  `grupo` tinyint NOT NULL,
  `ramal` tinyint NOT NULL,
  `data_bloq` tinyint NOT NULL,
  `tipo_cob` tinyint NOT NULL,
  `tit_abertos` tinyint NOT NULL,
  `parc_abertas` tinyint NOT NULL,
  `valor` tinyint NOT NULL,
  `titulo` tinyint NOT NULL,
  `imp` tinyint NOT NULL,
  `datavenc` tinyint NOT NULL,
  `referencia` tinyint NOT NULL,
  `nossonum` tinyint NOT NULL,
  `processamento` tinyint NOT NULL,
  `percmulta` tinyint NOT NULL,
  `valormulta` tinyint NOT NULL,
  `percmora` tinyint NOT NULL,
  `valormora` tinyint NOT NULL,
  `percdesc` tinyint NOT NULL,
  `valordesc` tinyint NOT NULL,
  `datapag` tinyint NOT NULL,
  `datadel` tinyint NOT NULL,
  `deltitulo` tinyint NOT NULL,
  `numconta` tinyint NOT NULL,
  `cod_ocorrencia` tinyint NOT NULL,
  `oco01` tinyint NOT NULL,
  `oco02` tinyint NOT NULL,
  `oco06` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vtab_remtitulos06`
--

DROP TABLE IF EXISTS `vtab_remtitulos06`;
/*!50001 DROP VIEW IF EXISTS `vtab_remtitulos06`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vtab_remtitulos06` (
  `nome` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `endereco` tinyint NOT NULL,
  `complemento` tinyint NOT NULL,
  `bairro` tinyint NOT NULL,
  `cidade` tinyint NOT NULL,
  `cep` tinyint NOT NULL,
  `estado` tinyint NOT NULL,
  `cpf_cnpj` tinyint NOT NULL,
  `login` tinyint NOT NULL,
  `venc` tinyint NOT NULL,
  `numero` tinyint NOT NULL,
  `cli_ativado` tinyint NOT NULL,
  `bloqueado` tinyint NOT NULL,
  `mesref` tinyint NOT NULL,
  `plano` tinyint NOT NULL,
  `grupo` tinyint NOT NULL,
  `ramal` tinyint NOT NULL,
  `data_bloq` tinyint NOT NULL,
  `tipo_cob` tinyint NOT NULL,
  `tit_abertos` tinyint NOT NULL,
  `parc_abertas` tinyint NOT NULL,
  `valor` tinyint NOT NULL,
  `titulo` tinyint NOT NULL,
  `imp` tinyint NOT NULL,
  `datavenc` tinyint NOT NULL,
  `referencia` tinyint NOT NULL,
  `nossonum` tinyint NOT NULL,
  `processamento` tinyint NOT NULL,
  `percmulta` tinyint NOT NULL,
  `valormulta` tinyint NOT NULL,
  `percmora` tinyint NOT NULL,
  `valormora` tinyint NOT NULL,
  `percdesc` tinyint NOT NULL,
  `valordesc` tinyint NOT NULL,
  `datapag` tinyint NOT NULL,
  `datadel` tinyint NOT NULL,
  `deltitulo` tinyint NOT NULL,
  `numconta` tinyint NOT NULL,
  `cod_ocorrencia` tinyint NOT NULL,
  `oco01` tinyint NOT NULL,
  `oco02` tinyint NOT NULL,
  `oco06` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vtab_sem_nossonum`
--

DROP TABLE IF EXISTS `vtab_sem_nossonum`;
/*!50001 DROP VIEW IF EXISTS `vtab_sem_nossonum`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vtab_sem_nossonum` (
  `id` tinyint NOT NULL,
  `nome` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `endereco` tinyint NOT NULL,
  `bairro` tinyint NOT NULL,
  `cidade` tinyint NOT NULL,
  `cep` tinyint NOT NULL,
  `estado` tinyint NOT NULL,
  `cpf_cnpj` tinyint NOT NULL,
  `fone` tinyint NOT NULL,
  `obs` tinyint NOT NULL,
  `nascimento` tinyint NOT NULL,
  `estado_civil` tinyint NOT NULL,
  `cadastro` tinyint NOT NULL,
  `login` tinyint NOT NULL,
  `tipo` tinyint NOT NULL,
  `night` tinyint NOT NULL,
  `aviso` tinyint NOT NULL,
  `foto` tinyint NOT NULL,
  `venc` tinyint NOT NULL,
  `mac` tinyint NOT NULL,
  `complemento` tinyint NOT NULL,
  `ip` tinyint NOT NULL,
  `ramal` tinyint NOT NULL,
  `rg` tinyint NOT NULL,
  `isento` tinyint NOT NULL,
  `celular` tinyint NOT NULL,
  `bloqueado` tinyint NOT NULL,
  `autoip` tinyint NOT NULL,
  `automac` tinyint NOT NULL,
  `conta` tinyint NOT NULL,
  `ipvsix` tinyint NOT NULL,
  `plano` tinyint NOT NULL,
  `send` tinyint NOT NULL,
  `cli_ativado` tinyint NOT NULL,
  `simultaneo` tinyint NOT NULL,
  `turbo` tinyint NOT NULL,
  `comodato` tinyint NOT NULL,
  `observacao` tinyint NOT NULL,
  `chavetipo` tinyint NOT NULL,
  `chave` tinyint NOT NULL,
  `contrato` tinyint NOT NULL,
  `ssid` tinyint NOT NULL,
  `senha` tinyint NOT NULL,
  `numero` tinyint NOT NULL,
  `responsavel` tinyint NOT NULL,
  `nome_pai` tinyint NOT NULL,
  `nome_mae` tinyint NOT NULL,
  `expedicao_rg` tinyint NOT NULL,
  `naturalidade` tinyint NOT NULL,
  `acessacen` tinyint NOT NULL,
  `pessoa` tinyint NOT NULL,
  `endereco_res` tinyint NOT NULL,
  `numero_res` tinyint NOT NULL,
  `bairro_res` tinyint NOT NULL,
  `cidade_res` tinyint NOT NULL,
  `cep_res` tinyint NOT NULL,
  `estado_res` tinyint NOT NULL,
  `complemento_res` tinyint NOT NULL,
  `desconto` tinyint NOT NULL,
  `acrescimo` tinyint NOT NULL,
  `equipamento` tinyint NOT NULL,
  `vendedor` tinyint NOT NULL,
  `nextel` tinyint NOT NULL,
  `accesslist` tinyint NOT NULL,
  `resumo` tinyint NOT NULL,
  `grupo` tinyint NOT NULL,
  `codigo` tinyint NOT NULL,
  `prilanc` tinyint NOT NULL,
  `tipobloq` tinyint NOT NULL,
  `adesao` tinyint NOT NULL,
  `mbdisco` tinyint NOT NULL,
  `sms` tinyint NOT NULL,
  `zap` tinyint NOT NULL,
  `ltrafego` tinyint NOT NULL,
  `planodown` tinyint NOT NULL,
  `ligoudown` tinyint NOT NULL,
  `statusdown` tinyint NOT NULL,
  `statusturbo` tinyint NOT NULL,
  `opcelular` tinyint NOT NULL,
  `nome_res` tinyint NOT NULL,
  `coordenadas` tinyint NOT NULL,
  `rem_obs` tinyint NOT NULL,
  `valor_sva` tinyint NOT NULL,
  `dias_corte` tinyint NOT NULL,
  `user_ip` tinyint NOT NULL,
  `user_mac` tinyint NOT NULL,
  `data_ip` tinyint NOT NULL,
  `data_mac` tinyint NOT NULL,
  `last_update` tinyint NOT NULL,
  `data_bloq` tinyint NOT NULL,
  `tags` tinyint NOT NULL,
  `tecnico` tinyint NOT NULL,
  `data_ins` tinyint NOT NULL,
  `altsenha` tinyint NOT NULL,
  `geranfe` tinyint NOT NULL,
  `mesref` tinyint NOT NULL,
  `ipfall` tinyint NOT NULL,
  `tit_abertos` tinyint NOT NULL,
  `parc_abertas` tinyint NOT NULL,
  `tipo_pessoa` tinyint NOT NULL,
  `celular2` tinyint NOT NULL,
  `mac_serial` tinyint NOT NULL,
  `status_corte` tinyint NOT NULL,
  `plano15` tinyint NOT NULL,
  `pgaviso` tinyint NOT NULL,
  `porta_olt` tinyint NOT NULL,
  `caixa_herm` tinyint NOT NULL,
  `porta_splitter` tinyint NOT NULL,
  `onu_ont` tinyint NOT NULL,
  `switch` tinyint NOT NULL,
  `tit_vencidos` tinyint NOT NULL,
  `pgcorte` tinyint NOT NULL,
  `interface` tinyint NOT NULL,
  `login_atend` tinyint NOT NULL,
  `cidade_ibge` tinyint NOT NULL,
  `estado_ibge` tinyint NOT NULL,
  `data_desbloq` tinyint NOT NULL,
  `pool_name` tinyint NOT NULL,
  `pool6` tinyint NOT NULL,
  `rec_email` tinyint NOT NULL,
  `termo` tinyint NOT NULL,
  `opcelular2` tinyint NOT NULL,
  `dot_ref` tinyint NOT NULL,
  `tipo_cliente` tinyint NOT NULL,
  `armario_olt` tinyint NOT NULL,
  `conta_cartao` tinyint NOT NULL,
  `plano_bloqc` tinyint NOT NULL,
  `uuid_cliente` tinyint NOT NULL,
  `data_desativacao` tinyint NOT NULL,
  `tipo_cob` tinyint NOT NULL,
  `fortunus` tinyint NOT NULL,
  `gsici` tinyint NOT NULL,
  `local_dici` tinyint NOT NULL,
  `nossonum` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vtab_suportes`
--

DROP TABLE IF EXISTS `vtab_suportes`;
/*!50001 DROP VIEW IF EXISTS `vtab_suportes`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vtab_suportes` (
  `nome` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `vendedor` tinyint NOT NULL,
  `endereco` tinyint NOT NULL,
  `complemento` tinyint NOT NULL,
  `bairro` tinyint NOT NULL,
  `cidade` tinyint NOT NULL,
  `cep` tinyint NOT NULL,
  `estado` tinyint NOT NULL,
  `cpf_cnpj` tinyint NOT NULL,
  `fone` tinyint NOT NULL,
  `login` tinyint NOT NULL,
  `venc` tinyint NOT NULL,
  `celular` tinyint NOT NULL,
  `conta` tinyint NOT NULL,
  `plano` tinyint NOT NULL,
  `numero` tinyint NOT NULL,
  `cli_ativado` tinyint NOT NULL,
  `bloqueado` tinyint NOT NULL,
  `grupo` tinyint NOT NULL,
  `codigo` tinyint NOT NULL,
  `mesref` tinyint NOT NULL,
  `tipo_cob` tinyint NOT NULL,
  `tit_abertos` tinyint NOT NULL,
  `parc_abertas` tinyint NOT NULL,
  `assunto` tinyint NOT NULL,
  `abertura` tinyint NOT NULL,
  `fechamento` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `chamado` tinyint NOT NULL,
  `atendente` tinyint NOT NULL,
  `visita` tinyint NOT NULL,
  `prioridade` tinyint NOT NULL,
  `ramal` tinyint NOT NULL,
  `reply` tinyint NOT NULL,
  `tecnico` tinyint NOT NULL,
  `login_atend` tinyint NOT NULL,
  `id` tinyint NOT NULL,
  `uuid_suporte` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vtab_titulos`
--

DROP TABLE IF EXISTS `vtab_titulos`;
/*!50001 DROP VIEW IF EXISTS `vtab_titulos`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vtab_titulos` (
  `nome` tinyint NOT NULL,
  `pessoa` tinyint NOT NULL,
  `nome_res` tinyint NOT NULL,
  `senha` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `vendedor` tinyint NOT NULL,
  `endereco` tinyint NOT NULL,
  `complemento` tinyint NOT NULL,
  `bairro` tinyint NOT NULL,
  `cidade` tinyint NOT NULL,
  `cep` tinyint NOT NULL,
  `estado` tinyint NOT NULL,
  `cpf_cnpj` tinyint NOT NULL,
  `fone` tinyint NOT NULL,
  `login` tinyint NOT NULL,
  `venc` tinyint NOT NULL,
  `celular` tinyint NOT NULL,
  `conta` tinyint NOT NULL,
  `plano` tinyint NOT NULL,
  `numero` tinyint NOT NULL,
  `desconto` tinyint NOT NULL,
  `acrescimo` tinyint NOT NULL,
  `ramal` tinyint NOT NULL,
  `cli_ativado` tinyint NOT NULL,
  `bloqueado` tinyint NOT NULL,
  `grupo` tinyint NOT NULL,
  `codigo` tinyint NOT NULL,
  `calculado` tinyint NOT NULL,
  `tags` tinyint NOT NULL,
  `comodato` tinyint NOT NULL,
  `dias_corte` tinyint NOT NULL,
  `geranfe` tinyint NOT NULL,
  `mesref` tinyint NOT NULL,
  `opcelular` tinyint NOT NULL,
  `uuid_cliente` tinyint NOT NULL,
  `tipo_cob` tinyint NOT NULL,
  `tit_abertos` tinyint NOT NULL,
  `parc_abertas` tinyint NOT NULL,
  `observacao` tinyint NOT NULL,
  `valor` tinyint NOT NULL,
  `valorpag` tinyint NOT NULL,
  `valorger` tinyint NOT NULL,
  `formapag` tinyint NOT NULL,
  `linhadig` tinyint NOT NULL,
  `datavenc` tinyint NOT NULL,
  `referencia` tinyint NOT NULL,
  `nossonum` tinyint NOT NULL,
  `datapag` tinyint NOT NULL,
  `recibo` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `tipo` tinyint NOT NULL,
  `processamento` tinyint NOT NULL,
  `usergerou` tinyint NOT NULL,
  `coletor` tinyint NOT NULL,
  `tipocob` tinyint NOT NULL,
  `codigo_carne` tinyint NOT NULL,
  `fcartaobandeira` tinyint NOT NULL,
  `fcartaonumero` tinyint NOT NULL,
  `fchequenumero` tinyint NOT NULL,
  `fchequebanco` tinyint NOT NULL,
  `fchequeagcc` tinyint NOT NULL,
  `descricao` tinyint NOT NULL,
  `numconta` tinyint NOT NULL,
  `num_retornos` tinyint NOT NULL,
  `deltitulo` tinyint NOT NULL,
  `tarifa_paga` tinyint NOT NULL,
  `chave_gnet2` tinyint NOT NULL,
  `chave_juno` tinyint NOT NULL,
  `titulo` tinyint NOT NULL,
  `uuid_lanc` tinyint NOT NULL,
  `imp` tinyint NOT NULL,
  `gerourem` tinyint NOT NULL,
  `oco01` tinyint NOT NULL,
  `oco02` tinyint NOT NULL,
  `oco06` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vtab_usuarios`
--

DROP TABLE IF EXISTS `vtab_usuarios`;
/*!50001 DROP VIEW IF EXISTS `vtab_usuarios`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vtab_usuarios` (
  `usuario` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vtab_ativ`
--

/*!50001 DROP TABLE IF EXISTS `vtab_ativ`*/;
/*!50001 DROP VIEW IF EXISTS `vtab_ativ`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW `vtab_ativ` AS select `sis_ativ`.`id` AS `id`,`sis_ativ`.`registro` AS `registro`,`sis_ativ`.`data` AS `data`,`sis_ativ`.`login` AS `login`,`sis_ativ`.`ip` AS `ip`,`sis_ativ`.`tipo` AS `tipo`,`sis_ativ`.`operacao` AS `operacao` from `sis_ativ` union select `sis_logs`.`id` AS `id`,`sis_logs`.`registro` AS `registro`,str_to_date(`sis_logs`.`data`,'%d/%m/%Y %H:%i:%s') AS `data`,`sis_logs`.`login` AS `login`,'0.0.0.0' AS `ip`,`sis_logs`.`tipo` AS `tipo`,`sis_logs`.`operacao` AS `operacao` from `sis_logs` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vtab_car_noimpress`
--

/*!50001 DROP TABLE IF EXISTS `vtab_car_noimpress`*/;
/*!50001 DROP VIEW IF EXISTS `vtab_car_noimpress`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW `vtab_car_noimpress` AS select `sis_cliente`.`id` AS `id`,`sis_cliente`.`nome` AS `nome`,`sis_cliente`.`email` AS `email`,`sis_cliente`.`endereco` AS `endereco`,`sis_cliente`.`bairro` AS `bairro`,`sis_cliente`.`cidade` AS `cidade`,`sis_cliente`.`cep` AS `cep`,`sis_cliente`.`estado` AS `estado`,`sis_cliente`.`cpf_cnpj` AS `cpf_cnpj`,`sis_cliente`.`fone` AS `fone`,`sis_cliente`.`obs` AS `obs`,`sis_cliente`.`nascimento` AS `nascimento`,`sis_cliente`.`estado_civil` AS `estado_civil`,`sis_cliente`.`cadastro` AS `cadastro`,`sis_cliente`.`login` AS `login`,`sis_cliente`.`tipo` AS `tipo`,`sis_cliente`.`night` AS `night`,`sis_cliente`.`aviso` AS `aviso`,`sis_cliente`.`foto` AS `foto`,`sis_cliente`.`venc` AS `venc`,`sis_cliente`.`mac` AS `mac`,`sis_cliente`.`complemento` AS `complemento`,`sis_cliente`.`ip` AS `ip`,`sis_cliente`.`ramal` AS `ramal`,`sis_cliente`.`rg` AS `rg`,`sis_cliente`.`isento` AS `isento`,`sis_cliente`.`celular` AS `celular`,`sis_cliente`.`bloqueado` AS `bloqueado`,`sis_cliente`.`autoip` AS `autoip`,`sis_cliente`.`automac` AS `automac`,`sis_cliente`.`conta` AS `conta`,`sis_cliente`.`ipvsix` AS `ipvsix`,`sis_cliente`.`plano` AS `plano`,`sis_cliente`.`send` AS `send`,`sis_cliente`.`cli_ativado` AS `cli_ativado`,`sis_cliente`.`simultaneo` AS `simultaneo`,`sis_cliente`.`turbo` AS `turbo`,`sis_cliente`.`comodato` AS `comodato`,`sis_cliente`.`observacao` AS `observacao`,`sis_cliente`.`chavetipo` AS `chavetipo`,`sis_cliente`.`chave` AS `chave`,`sis_cliente`.`contrato` AS `contrato`,`sis_cliente`.`ssid` AS `ssid`,`sis_cliente`.`senha` AS `senha`,`sis_cliente`.`numero` AS `numero`,`sis_cliente`.`responsavel` AS `responsavel`,`sis_cliente`.`nome_pai` AS `nome_pai`,`sis_cliente`.`nome_mae` AS `nome_mae`,`sis_cliente`.`expedicao_rg` AS `expedicao_rg`,`sis_cliente`.`naturalidade` AS `naturalidade`,`sis_cliente`.`acessacen` AS `acessacen`,`sis_cliente`.`pessoa` AS `pessoa`,`sis_cliente`.`endereco_res` AS `endereco_res`,`sis_cliente`.`numero_res` AS `numero_res`,`sis_cliente`.`bairro_res` AS `bairro_res`,`sis_cliente`.`cidade_res` AS `cidade_res`,`sis_cliente`.`cep_res` AS `cep_res`,`sis_cliente`.`estado_res` AS `estado_res`,`sis_cliente`.`complemento_res` AS `complemento_res`,`sis_cliente`.`desconto` AS `desconto`,`sis_cliente`.`acrescimo` AS `acrescimo`,`sis_cliente`.`equipamento` AS `equipamento`,`sis_cliente`.`vendedor` AS `vendedor`,`sis_cliente`.`nextel` AS `nextel`,`sis_cliente`.`accesslist` AS `accesslist`,`sis_cliente`.`resumo` AS `resumo`,`sis_cliente`.`grupo` AS `grupo`,`sis_cliente`.`codigo` AS `codigo`,`sis_cliente`.`prilanc` AS `prilanc`,`sis_cliente`.`tipobloq` AS `tipobloq`,`sis_cliente`.`adesao` AS `adesao`,`sis_cliente`.`mbdisco` AS `mbdisco`,`sis_cliente`.`sms` AS `sms`,`sis_cliente`.`zap` AS `zap`,`sis_cliente`.`ltrafego` AS `ltrafego`,`sis_cliente`.`planodown` AS `planodown`,`sis_cliente`.`ligoudown` AS `ligoudown`,`sis_cliente`.`statusdown` AS `statusdown`,`sis_cliente`.`statusturbo` AS `statusturbo`,`sis_cliente`.`opcelular` AS `opcelular`,`sis_cliente`.`nome_res` AS `nome_res`,`sis_cliente`.`coordenadas` AS `coordenadas`,`sis_cliente`.`rem_obs` AS `rem_obs`,`sis_cliente`.`valor_sva` AS `valor_sva`,`sis_cliente`.`dias_corte` AS `dias_corte`,`sis_cliente`.`user_ip` AS `user_ip`,`sis_cliente`.`user_mac` AS `user_mac`,`sis_cliente`.`data_ip` AS `data_ip`,`sis_cliente`.`data_mac` AS `data_mac`,`sis_cliente`.`last_update` AS `last_update`,`sis_cliente`.`data_bloq` AS `data_bloq`,`sis_cliente`.`tags` AS `tags`,`sis_cliente`.`tecnico` AS `tecnico`,`sis_cliente`.`data_ins` AS `data_ins`,`sis_cliente`.`altsenha` AS `altsenha`,`sis_cliente`.`geranfe` AS `geranfe`,`sis_cliente`.`mesref` AS `mesref`,`sis_cliente`.`ipfall` AS `ipfall`,`sis_cliente`.`tit_abertos` AS `tit_abertos`,`sis_cliente`.`parc_abertas` AS `parc_abertas`,`sis_cliente`.`tipo_pessoa` AS `tipo_pessoa`,`sis_cliente`.`celular2` AS `celular2`,`sis_cliente`.`mac_serial` AS `mac_serial`,`sis_cliente`.`status_corte` AS `status_corte`,`sis_cliente`.`plano15` AS `plano15`,`sis_cliente`.`pgaviso` AS `pgaviso`,`sis_cliente`.`porta_olt` AS `porta_olt`,`sis_cliente`.`caixa_herm` AS `caixa_herm`,`sis_cliente`.`porta_splitter` AS `porta_splitter`,`sis_cliente`.`onu_ont` AS `onu_ont`,`sis_cliente`.`switch` AS `switch`,`sis_cliente`.`tit_vencidos` AS `tit_vencidos`,`sis_cliente`.`pgcorte` AS `pgcorte`,`sis_cliente`.`interface` AS `interface`,`sis_cliente`.`login_atend` AS `login_atend`,`sis_cliente`.`cidade_ibge` AS `cidade_ibge`,`sis_cliente`.`estado_ibge` AS `estado_ibge`,`sis_cliente`.`data_desbloq` AS `data_desbloq`,`sis_cliente`.`pool_name` AS `pool_name`,`sis_cliente`.`pool6` AS `pool6`,`sis_cliente`.`rec_email` AS `rec_email`,`sis_cliente`.`termo` AS `termo`,`sis_cliente`.`opcelular2` AS `opcelular2`,`sis_cliente`.`dot_ref` AS `dot_ref`,`sis_cliente`.`tipo_cliente` AS `tipo_cliente`,`sis_cliente`.`armario_olt` AS `armario_olt`,`sis_cliente`.`conta_cartao` AS `conta_cartao`,`sis_cliente`.`plano_bloqc` AS `plano_bloqc`,`sis_cliente`.`uuid_cliente` AS `uuid_cliente`,`sis_cliente`.`data_desativacao` AS `data_desativacao`,`sis_cliente`.`tipo_cob` AS `tipo_cob`,`sis_cliente`.`fortunus` AS `fortunus`,`sis_cliente`.`gsici` AS `gsici`,`sis_cliente`.`local_dici` AS `local_dici`,`sis_carne`.`parcelas` AS `parcelas` from (`sis_cliente` join `sis_carne`) where `sis_cliente`.`login` = `sis_carne`.`login` and `sis_carne`.`impresso` = 'nao' group by `sis_cliente`.`login` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vtab_comerros`
--

/*!50001 DROP TABLE IF EXISTS `vtab_comerros`*/;
/*!50001 DROP VIEW IF EXISTS `vtab_comerros`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW `vtab_comerros` AS select count(`sis_cliente`.`login`) AS `tentativas`,`sis_cliente`.`id` AS `id`,`sis_cliente`.`nome` AS `nome`,`sis_cliente`.`email` AS `email`,`sis_cliente`.`endereco` AS `endereco`,`sis_cliente`.`bairro` AS `bairro`,`sis_cliente`.`cidade` AS `cidade`,`sis_cliente`.`cep` AS `cep`,`sis_cliente`.`estado` AS `estado`,`sis_cliente`.`cpf_cnpj` AS `cpf_cnpj`,`sis_cliente`.`fone` AS `fone`,`sis_cliente`.`obs` AS `obs`,`sis_cliente`.`nascimento` AS `nascimento`,`sis_cliente`.`estado_civil` AS `estado_civil`,`sis_cliente`.`cadastro` AS `cadastro`,`sis_cliente`.`login` AS `login`,`sis_cliente`.`tipo` AS `tipo`,`sis_cliente`.`night` AS `night`,`sis_cliente`.`aviso` AS `aviso`,`sis_cliente`.`foto` AS `foto`,`sis_cliente`.`venc` AS `venc`,`sis_cliente`.`mac` AS `mac`,`sis_cliente`.`complemento` AS `complemento`,`sis_cliente`.`ip` AS `ip`,`sis_cliente`.`ramal` AS `ramal`,`sis_cliente`.`rg` AS `rg`,`sis_cliente`.`isento` AS `isento`,`sis_cliente`.`celular` AS `celular`,`sis_cliente`.`bloqueado` AS `bloqueado`,`sis_cliente`.`autoip` AS `autoip`,`sis_cliente`.`automac` AS `automac`,`sis_cliente`.`conta` AS `conta`,`sis_cliente`.`ipvsix` AS `ipvsix`,`sis_cliente`.`plano` AS `plano`,`sis_cliente`.`send` AS `send`,`sis_cliente`.`cli_ativado` AS `cli_ativado`,`sis_cliente`.`simultaneo` AS `simultaneo`,`sis_cliente`.`turbo` AS `turbo`,`sis_cliente`.`comodato` AS `comodato`,`sis_cliente`.`observacao` AS `observacao`,`sis_cliente`.`chavetipo` AS `chavetipo`,`sis_cliente`.`chave` AS `chave`,`sis_cliente`.`contrato` AS `contrato`,`sis_cliente`.`ssid` AS `ssid`,`sis_cliente`.`senha` AS `senha`,`sis_cliente`.`numero` AS `numero`,`sis_cliente`.`responsavel` AS `responsavel`,`sis_cliente`.`nome_pai` AS `nome_pai`,`sis_cliente`.`nome_mae` AS `nome_mae`,`sis_cliente`.`expedicao_rg` AS `expedicao_rg`,`sis_cliente`.`naturalidade` AS `naturalidade`,`sis_cliente`.`acessacen` AS `acessacen`,`sis_cliente`.`pessoa` AS `pessoa`,`sis_cliente`.`endereco_res` AS `endereco_res`,`sis_cliente`.`numero_res` AS `numero_res`,`sis_cliente`.`bairro_res` AS `bairro_res`,`sis_cliente`.`cidade_res` AS `cidade_res`,`sis_cliente`.`cep_res` AS `cep_res`,`sis_cliente`.`estado_res` AS `estado_res`,`sis_cliente`.`complemento_res` AS `complemento_res`,`sis_cliente`.`desconto` AS `desconto`,`sis_cliente`.`acrescimo` AS `acrescimo`,`sis_cliente`.`equipamento` AS `equipamento`,`sis_cliente`.`vendedor` AS `vendedor`,`sis_cliente`.`nextel` AS `nextel`,`sis_cliente`.`accesslist` AS `accesslist`,`sis_cliente`.`resumo` AS `resumo`,`sis_cliente`.`grupo` AS `grupo`,`sis_cliente`.`codigo` AS `codigo`,`sis_cliente`.`prilanc` AS `prilanc`,`sis_cliente`.`tipobloq` AS `tipobloq`,`sis_cliente`.`adesao` AS `adesao`,`sis_cliente`.`mbdisco` AS `mbdisco`,`sis_cliente`.`sms` AS `sms`,`sis_cliente`.`zap` AS `zap`,`sis_cliente`.`ltrafego` AS `ltrafego`,`sis_cliente`.`planodown` AS `planodown`,`sis_cliente`.`ligoudown` AS `ligoudown`,`sis_cliente`.`statusdown` AS `statusdown`,`sis_cliente`.`statusturbo` AS `statusturbo`,`sis_cliente`.`opcelular` AS `opcelular`,`sis_cliente`.`nome_res` AS `nome_res`,`sis_cliente`.`coordenadas` AS `coordenadas`,`sis_cliente`.`rem_obs` AS `rem_obs`,`sis_cliente`.`valor_sva` AS `valor_sva`,`sis_cliente`.`dias_corte` AS `dias_corte`,`sis_cliente`.`user_ip` AS `user_ip`,`sis_cliente`.`user_mac` AS `user_mac`,`sis_cliente`.`data_ip` AS `data_ip`,`sis_cliente`.`data_mac` AS `data_mac`,`sis_cliente`.`last_update` AS `last_update`,`sis_cliente`.`data_bloq` AS `data_bloq`,`sis_cliente`.`tags` AS `tags`,`sis_cliente`.`tecnico` AS `tecnico`,`sis_cliente`.`data_ins` AS `data_ins`,`sis_cliente`.`altsenha` AS `altsenha`,`sis_cliente`.`geranfe` AS `geranfe`,`sis_cliente`.`mesref` AS `mesref`,`sis_cliente`.`ipfall` AS `ipfall`,`sis_cliente`.`tit_abertos` AS `tit_abertos`,`sis_cliente`.`parc_abertas` AS `parc_abertas`,`sis_cliente`.`tipo_pessoa` AS `tipo_pessoa`,`sis_cliente`.`celular2` AS `celular2`,`sis_cliente`.`mac_serial` AS `mac_serial`,`sis_cliente`.`status_corte` AS `status_corte`,`sis_cliente`.`plano15` AS `plano15`,`sis_cliente`.`pgaviso` AS `pgaviso`,`sis_cliente`.`porta_olt` AS `porta_olt`,`sis_cliente`.`caixa_herm` AS `caixa_herm`,`sis_cliente`.`porta_splitter` AS `porta_splitter`,`sis_cliente`.`onu_ont` AS `onu_ont`,`sis_cliente`.`switch` AS `switch`,`sis_cliente`.`tit_vencidos` AS `tit_vencidos`,`sis_cliente`.`pgcorte` AS `pgcorte`,`sis_cliente`.`interface` AS `interface`,`sis_cliente`.`login_atend` AS `login_atend`,`sis_cliente`.`cidade_ibge` AS `cidade_ibge`,`sis_cliente`.`estado_ibge` AS `estado_ibge`,`sis_cliente`.`data_desbloq` AS `data_desbloq`,`sis_cliente`.`pool_name` AS `pool_name`,`sis_cliente`.`pool6` AS `pool6`,`sis_cliente`.`rec_email` AS `rec_email`,`sis_cliente`.`termo` AS `termo`,`sis_cliente`.`opcelular2` AS `opcelular2`,`sis_cliente`.`dot_ref` AS `dot_ref`,`sis_cliente`.`tipo_cliente` AS `tipo_cliente`,`sis_cliente`.`armario_olt` AS `armario_olt`,`sis_cliente`.`conta_cartao` AS `conta_cartao`,`sis_cliente`.`plano_bloqc` AS `plano_bloqc`,`sis_cliente`.`uuid_cliente` AS `uuid_cliente`,`sis_cliente`.`data_desativacao` AS `data_desativacao`,`sis_cliente`.`tipo_cob` AS `tipo_cob`,`sis_cliente`.`fortunus` AS `fortunus`,`sis_cliente`.`gsici` AS `gsici`,`sis_cliente`.`local_dici` AS `local_dici` from (`radpostauth` left join `sis_cliente` on(`radpostauth`.`username` = `sis_cliente`.`login` and cast(`radpostauth`.`authdate` as date) = cast(current_timestamp() as date) and hour(`radpostauth`.`authdate`) = hour(current_timestamp()) and `radpostauth`.`reply` = 'Access-Reject')) where `sis_cliente`.`cli_ativado` = 's' group by `sis_cliente`.`login` having `tentativas` >= 2 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vtab_conectados`
--

/*!50001 DROP TABLE IF EXISTS `vtab_conectados`*/;
/*!50001 DROP VIEW IF EXISTS `vtab_conectados`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW `vtab_conectados` AS select `sis_cliente`.`id` AS `id`,`sis_cliente`.`nome` AS `nome`,`sis_cliente`.`email` AS `email`,`sis_cliente`.`endereco` AS `endereco`,`sis_cliente`.`bairro` AS `bairro`,`sis_cliente`.`cidade` AS `cidade`,`sis_cliente`.`cep` AS `cep`,`sis_cliente`.`estado` AS `estado`,`sis_cliente`.`cpf_cnpj` AS `cpf_cnpj`,`sis_cliente`.`fone` AS `fone`,`sis_cliente`.`obs` AS `obs`,`sis_cliente`.`nascimento` AS `nascimento`,`sis_cliente`.`estado_civil` AS `estado_civil`,`sis_cliente`.`cadastro` AS `cadastro`,`sis_cliente`.`login` AS `login`,`sis_cliente`.`tipo` AS `tipo`,`sis_cliente`.`night` AS `night`,`sis_cliente`.`aviso` AS `aviso`,`sis_cliente`.`foto` AS `foto`,`sis_cliente`.`venc` AS `venc`,`sis_cliente`.`mac` AS `mac`,`sis_cliente`.`complemento` AS `complemento`,`sis_cliente`.`ip` AS `ip`,`sis_cliente`.`ramal` AS `ramal`,`sis_cliente`.`rg` AS `rg`,`sis_cliente`.`isento` AS `isento`,`sis_cliente`.`celular` AS `celular`,`sis_cliente`.`bloqueado` AS `bloqueado`,`sis_cliente`.`autoip` AS `autoip`,`sis_cliente`.`automac` AS `automac`,`sis_cliente`.`conta` AS `conta`,`sis_cliente`.`ipvsix` AS `ipvsix`,`sis_cliente`.`plano` AS `plano`,`sis_cliente`.`send` AS `send`,`sis_cliente`.`cli_ativado` AS `cli_ativado`,`sis_cliente`.`simultaneo` AS `simultaneo`,`sis_cliente`.`turbo` AS `turbo`,`sis_cliente`.`comodato` AS `comodato`,`sis_cliente`.`observacao` AS `observacao`,`sis_cliente`.`chavetipo` AS `chavetipo`,`sis_cliente`.`chave` AS `chave`,`sis_cliente`.`contrato` AS `contrato`,`sis_cliente`.`ssid` AS `ssid`,`sis_cliente`.`senha` AS `senha`,`sis_cliente`.`numero` AS `numero`,`sis_cliente`.`responsavel` AS `responsavel`,`sis_cliente`.`nome_pai` AS `nome_pai`,`sis_cliente`.`nome_mae` AS `nome_mae`,`sis_cliente`.`expedicao_rg` AS `expedicao_rg`,`sis_cliente`.`naturalidade` AS `naturalidade`,`sis_cliente`.`acessacen` AS `acessacen`,`sis_cliente`.`pessoa` AS `pessoa`,`sis_cliente`.`endereco_res` AS `endereco_res`,`sis_cliente`.`numero_res` AS `numero_res`,`sis_cliente`.`bairro_res` AS `bairro_res`,`sis_cliente`.`cidade_res` AS `cidade_res`,`sis_cliente`.`cep_res` AS `cep_res`,`sis_cliente`.`estado_res` AS `estado_res`,`sis_cliente`.`complemento_res` AS `complemento_res`,`sis_cliente`.`desconto` AS `desconto`,`sis_cliente`.`acrescimo` AS `acrescimo`,`sis_cliente`.`equipamento` AS `equipamento`,`sis_cliente`.`vendedor` AS `vendedor`,`sis_cliente`.`nextel` AS `nextel`,`sis_cliente`.`accesslist` AS `accesslist`,`sis_cliente`.`resumo` AS `resumo`,`sis_cliente`.`grupo` AS `grupo`,`sis_cliente`.`codigo` AS `codigo`,`sis_cliente`.`prilanc` AS `prilanc`,`sis_cliente`.`tipobloq` AS `tipobloq`,`sis_cliente`.`adesao` AS `adesao`,`sis_cliente`.`mbdisco` AS `mbdisco`,`sis_cliente`.`sms` AS `sms`,`sis_cliente`.`zap` AS `zap`,`sis_cliente`.`ltrafego` AS `ltrafego`,`sis_cliente`.`planodown` AS `planodown`,`sis_cliente`.`ligoudown` AS `ligoudown`,`sis_cliente`.`statusdown` AS `statusdown`,`sis_cliente`.`statusturbo` AS `statusturbo`,`sis_cliente`.`opcelular` AS `opcelular`,`sis_cliente`.`nome_res` AS `nome_res`,`sis_cliente`.`coordenadas` AS `coordenadas`,`sis_cliente`.`rem_obs` AS `rem_obs`,`sis_cliente`.`valor_sva` AS `valor_sva`,`sis_cliente`.`dias_corte` AS `dias_corte`,`sis_cliente`.`user_ip` AS `user_ip`,`sis_cliente`.`user_mac` AS `user_mac`,`sis_cliente`.`data_ip` AS `data_ip`,`sis_cliente`.`data_mac` AS `data_mac`,`sis_cliente`.`last_update` AS `last_update`,`sis_cliente`.`data_bloq` AS `data_bloq`,`sis_cliente`.`tags` AS `tags`,`sis_cliente`.`tecnico` AS `tecnico`,`sis_cliente`.`data_ins` AS `data_ins`,`sis_cliente`.`altsenha` AS `altsenha`,`sis_cliente`.`geranfe` AS `geranfe`,`sis_cliente`.`mesref` AS `mesref`,`sis_cliente`.`ipfall` AS `ipfall`,`sis_cliente`.`tit_abertos` AS `tit_abertos`,`sis_cliente`.`parc_abertas` AS `parc_abertas`,`sis_cliente`.`tipo_pessoa` AS `tipo_pessoa`,`sis_cliente`.`celular2` AS `celular2`,`sis_cliente`.`mac_serial` AS `mac_serial`,`sis_cliente`.`status_corte` AS `status_corte`,`sis_cliente`.`plano15` AS `plano15`,`sis_cliente`.`pgaviso` AS `pgaviso`,`sis_cliente`.`porta_olt` AS `porta_olt`,`sis_cliente`.`caixa_herm` AS `caixa_herm`,`sis_cliente`.`porta_splitter` AS `porta_splitter`,`sis_cliente`.`onu_ont` AS `onu_ont`,`sis_cliente`.`switch` AS `switch`,`sis_cliente`.`tit_vencidos` AS `tit_vencidos`,`sis_cliente`.`pgcorte` AS `pgcorte`,`sis_cliente`.`interface` AS `interface`,`sis_cliente`.`login_atend` AS `login_atend`,`sis_cliente`.`cidade_ibge` AS `cidade_ibge`,`sis_cliente`.`estado_ibge` AS `estado_ibge`,`sis_cliente`.`data_desbloq` AS `data_desbloq`,`sis_cliente`.`pool_name` AS `pool_name`,`sis_cliente`.`pool6` AS `pool6`,`sis_cliente`.`rec_email` AS `rec_email`,`sis_cliente`.`termo` AS `termo`,`sis_cliente`.`opcelular2` AS `opcelular2`,`sis_cliente`.`dot_ref` AS `dot_ref`,`sis_cliente`.`tipo_cliente` AS `tipo_cliente`,`sis_cliente`.`armario_olt` AS `armario_olt`,`sis_cliente`.`conta_cartao` AS `conta_cartao`,`sis_cliente`.`plano_bloqc` AS `plano_bloqc`,`sis_cliente`.`uuid_cliente` AS `uuid_cliente`,`sis_cliente`.`data_desativacao` AS `data_desativacao`,`sis_cliente`.`tipo_cob` AS `tipo_cob`,`sis_cliente`.`fortunus` AS `fortunus`,`sis_cliente`.`gsici` AS `gsici`,`sis_cliente`.`local_dici` AS `local_dici`,`radacct`.`acctuniqueid` AS `acctuniqueid` from (`sis_cliente` join `radacct`) where `sis_cliente`.`login` = `radacct`.`username` and `radacct`.`acctstoptime` is null group by `sis_cliente`.`login` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vtab_desbloqueio`
--

/*!50001 DROP TABLE IF EXISTS `vtab_desbloqueio`*/;
/*!50001 DROP VIEW IF EXISTS `vtab_desbloqueio`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW `vtab_desbloqueio` AS select `sis_cliente`.`login` AS `login`,`sis_cliente`.`id` AS `id`,`sis_cliente`.`celular` AS `celular`,`sis_cliente`.`nome_res` AS `nome_res`,`sis_cliente`.`email` AS `email`,`sis_cliente`.`dias_corte` AS `dias_corte`,`sis_cliente`.`tipo_cob` AS `tipo_cob`,`sis_cliente`.`tit_abertos` AS `tit_abertos`,`sis_cliente`.`parc_abertas` AS `parc_abertas`,`sis_lanc`.`datavenc` AS `datavenc`,`sis_lanc`.`id` AS `titulo`,`sis_lanc`.`deltitulo` AS `deltitulo` from (`sis_cliente` left join `sis_lanc` on(`sis_lanc`.`login` = `sis_cliente`.`login` and `sis_lanc`.`status` <> 'pago' and `sis_lanc`.`deltitulo` = 0 and `sis_lanc`.`datavenc` < current_timestamp())) where `sis_cliente`.`cli_ativado` = 's' and `sis_cliente`.`observacao` = 'nao' and `sis_cliente`.`bloqueado` = 'sim' and `sis_cliente`.`tipobloq` = 'aut' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vtab_ematraso`
--

/*!50001 DROP TABLE IF EXISTS `vtab_ematraso`*/;
/*!50001 DROP VIEW IF EXISTS `vtab_ematraso`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW `vtab_ematraso` AS select `sis_cliente`.`id` AS `id`,`sis_cliente`.`nome` AS `nome`,`sis_cliente`.`email` AS `email`,`sis_cliente`.`endereco` AS `endereco`,`sis_cliente`.`bairro` AS `bairro`,`sis_cliente`.`cidade` AS `cidade`,`sis_cliente`.`cep` AS `cep`,`sis_cliente`.`estado` AS `estado`,`sis_cliente`.`cpf_cnpj` AS `cpf_cnpj`,`sis_cliente`.`fone` AS `fone`,`sis_cliente`.`obs` AS `obs`,`sis_cliente`.`nascimento` AS `nascimento`,`sis_cliente`.`estado_civil` AS `estado_civil`,`sis_cliente`.`cadastro` AS `cadastro`,`sis_cliente`.`login` AS `login`,`sis_cliente`.`tipo` AS `tipo`,`sis_cliente`.`night` AS `night`,`sis_cliente`.`aviso` AS `aviso`,`sis_cliente`.`foto` AS `foto`,`sis_cliente`.`venc` AS `venc`,`sis_cliente`.`mac` AS `mac`,`sis_cliente`.`complemento` AS `complemento`,`sis_cliente`.`ip` AS `ip`,`sis_cliente`.`ramal` AS `ramal`,`sis_cliente`.`rg` AS `rg`,`sis_cliente`.`isento` AS `isento`,`sis_cliente`.`celular` AS `celular`,`sis_cliente`.`bloqueado` AS `bloqueado`,`sis_cliente`.`autoip` AS `autoip`,`sis_cliente`.`automac` AS `automac`,`sis_cliente`.`conta` AS `conta`,`sis_cliente`.`ipvsix` AS `ipvsix`,`sis_cliente`.`plano` AS `plano`,`sis_cliente`.`send` AS `send`,`sis_cliente`.`cli_ativado` AS `cli_ativado`,`sis_cliente`.`simultaneo` AS `simultaneo`,`sis_cliente`.`turbo` AS `turbo`,`sis_cliente`.`comodato` AS `comodato`,`sis_cliente`.`observacao` AS `observacao`,`sis_cliente`.`chavetipo` AS `chavetipo`,`sis_cliente`.`chave` AS `chave`,`sis_cliente`.`contrato` AS `contrato`,`sis_cliente`.`ssid` AS `ssid`,`sis_cliente`.`senha` AS `senha`,`sis_cliente`.`numero` AS `numero`,`sis_cliente`.`responsavel` AS `responsavel`,`sis_cliente`.`nome_pai` AS `nome_pai`,`sis_cliente`.`nome_mae` AS `nome_mae`,`sis_cliente`.`expedicao_rg` AS `expedicao_rg`,`sis_cliente`.`naturalidade` AS `naturalidade`,`sis_cliente`.`acessacen` AS `acessacen`,`sis_cliente`.`pessoa` AS `pessoa`,`sis_cliente`.`endereco_res` AS `endereco_res`,`sis_cliente`.`numero_res` AS `numero_res`,`sis_cliente`.`bairro_res` AS `bairro_res`,`sis_cliente`.`cidade_res` AS `cidade_res`,`sis_cliente`.`cep_res` AS `cep_res`,`sis_cliente`.`estado_res` AS `estado_res`,`sis_cliente`.`complemento_res` AS `complemento_res`,`sis_cliente`.`desconto` AS `desconto`,`sis_cliente`.`acrescimo` AS `acrescimo`,`sis_cliente`.`equipamento` AS `equipamento`,`sis_cliente`.`vendedor` AS `vendedor`,`sis_cliente`.`nextel` AS `nextel`,`sis_cliente`.`accesslist` AS `accesslist`,`sis_cliente`.`resumo` AS `resumo`,`sis_cliente`.`grupo` AS `grupo`,`sis_cliente`.`codigo` AS `codigo`,`sis_cliente`.`prilanc` AS `prilanc`,`sis_cliente`.`tipobloq` AS `tipobloq`,`sis_cliente`.`adesao` AS `adesao`,`sis_cliente`.`mbdisco` AS `mbdisco`,`sis_cliente`.`sms` AS `sms`,`sis_cliente`.`zap` AS `zap`,`sis_cliente`.`ltrafego` AS `ltrafego`,`sis_cliente`.`planodown` AS `planodown`,`sis_cliente`.`ligoudown` AS `ligoudown`,`sis_cliente`.`statusdown` AS `statusdown`,`sis_cliente`.`statusturbo` AS `statusturbo`,`sis_cliente`.`opcelular` AS `opcelular`,`sis_cliente`.`nome_res` AS `nome_res`,`sis_cliente`.`coordenadas` AS `coordenadas`,`sis_cliente`.`rem_obs` AS `rem_obs`,`sis_cliente`.`valor_sva` AS `valor_sva`,`sis_cliente`.`dias_corte` AS `dias_corte`,`sis_cliente`.`user_ip` AS `user_ip`,`sis_cliente`.`user_mac` AS `user_mac`,`sis_cliente`.`data_ip` AS `data_ip`,`sis_cliente`.`data_mac` AS `data_mac`,`sis_cliente`.`last_update` AS `last_update`,`sis_cliente`.`data_bloq` AS `data_bloq`,`sis_cliente`.`tags` AS `tags`,`sis_cliente`.`tecnico` AS `tecnico`,`sis_cliente`.`data_ins` AS `data_ins`,`sis_cliente`.`altsenha` AS `altsenha`,`sis_cliente`.`geranfe` AS `geranfe`,`sis_cliente`.`mesref` AS `mesref`,`sis_cliente`.`ipfall` AS `ipfall`,`sis_cliente`.`tit_abertos` AS `tit_abertos`,`sis_cliente`.`parc_abertas` AS `parc_abertas`,`sis_cliente`.`tipo_pessoa` AS `tipo_pessoa`,`sis_cliente`.`celular2` AS `celular2`,`sis_cliente`.`mac_serial` AS `mac_serial`,`sis_cliente`.`status_corte` AS `status_corte`,`sis_cliente`.`plano15` AS `plano15`,`sis_cliente`.`pgaviso` AS `pgaviso`,`sis_cliente`.`porta_olt` AS `porta_olt`,`sis_cliente`.`caixa_herm` AS `caixa_herm`,`sis_cliente`.`porta_splitter` AS `porta_splitter`,`sis_cliente`.`onu_ont` AS `onu_ont`,`sis_cliente`.`switch` AS `switch`,`sis_cliente`.`tit_vencidos` AS `tit_vencidos`,`sis_cliente`.`pgcorte` AS `pgcorte`,`sis_cliente`.`interface` AS `interface`,`sis_cliente`.`login_atend` AS `login_atend`,`sis_cliente`.`cidade_ibge` AS `cidade_ibge`,`sis_cliente`.`estado_ibge` AS `estado_ibge`,`sis_cliente`.`data_desbloq` AS `data_desbloq`,`sis_cliente`.`pool_name` AS `pool_name`,`sis_cliente`.`pool6` AS `pool6`,`sis_cliente`.`rec_email` AS `rec_email`,`sis_cliente`.`termo` AS `termo`,`sis_cliente`.`opcelular2` AS `opcelular2`,`sis_cliente`.`dot_ref` AS `dot_ref`,`sis_cliente`.`tipo_cliente` AS `tipo_cliente`,`sis_cliente`.`armario_olt` AS `armario_olt`,`sis_cliente`.`conta_cartao` AS `conta_cartao`,`sis_cliente`.`plano_bloqc` AS `plano_bloqc`,`sis_cliente`.`uuid_cliente` AS `uuid_cliente`,`sis_cliente`.`data_desativacao` AS `data_desativacao`,`sis_cliente`.`tipo_cob` AS `tipo_cob`,`sis_cliente`.`fortunus` AS `fortunus`,`sis_cliente`.`gsici` AS `gsici`,`sis_cliente`.`local_dici` AS `local_dici`,`sis_lanc`.`datavenc` AS `datavenc`,count(`sis_lanc`.`id`) AS `tit_vencidos2` from (`sis_cliente` join `sis_lanc`) where `sis_cliente`.`login` = `sis_lanc`.`login` and cast(`sis_lanc`.`datavenc` as date) < current_timestamp() and `sis_lanc`.`deltitulo` = 0 and `sis_lanc`.`status` <> 'pago' group by `sis_cliente`.`login` order by `sis_cliente`.`nome` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vtab_fat_noimpress`
--

/*!50001 DROP TABLE IF EXISTS `vtab_fat_noimpress`*/;
/*!50001 DROP VIEW IF EXISTS `vtab_fat_noimpress`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW `vtab_fat_noimpress` AS select `sis_cliente`.`id` AS `id`,`sis_cliente`.`nome` AS `nome`,`sis_cliente`.`email` AS `email`,`sis_cliente`.`endereco` AS `endereco`,`sis_cliente`.`bairro` AS `bairro`,`sis_cliente`.`cidade` AS `cidade`,`sis_cliente`.`cep` AS `cep`,`sis_cliente`.`estado` AS `estado`,`sis_cliente`.`cpf_cnpj` AS `cpf_cnpj`,`sis_cliente`.`fone` AS `fone`,`sis_cliente`.`obs` AS `obs`,`sis_cliente`.`nascimento` AS `nascimento`,`sis_cliente`.`estado_civil` AS `estado_civil`,`sis_cliente`.`cadastro` AS `cadastro`,`sis_cliente`.`login` AS `login`,`sis_cliente`.`tipo` AS `tipo`,`sis_cliente`.`night` AS `night`,`sis_cliente`.`aviso` AS `aviso`,`sis_cliente`.`foto` AS `foto`,`sis_cliente`.`venc` AS `venc`,`sis_cliente`.`mac` AS `mac`,`sis_cliente`.`complemento` AS `complemento`,`sis_cliente`.`ip` AS `ip`,`sis_cliente`.`ramal` AS `ramal`,`sis_cliente`.`rg` AS `rg`,`sis_cliente`.`isento` AS `isento`,`sis_cliente`.`celular` AS `celular`,`sis_cliente`.`bloqueado` AS `bloqueado`,`sis_cliente`.`autoip` AS `autoip`,`sis_cliente`.`automac` AS `automac`,`sis_cliente`.`conta` AS `conta`,`sis_cliente`.`ipvsix` AS `ipvsix`,`sis_cliente`.`plano` AS `plano`,`sis_cliente`.`send` AS `send`,`sis_cliente`.`cli_ativado` AS `cli_ativado`,`sis_cliente`.`simultaneo` AS `simultaneo`,`sis_cliente`.`turbo` AS `turbo`,`sis_cliente`.`comodato` AS `comodato`,`sis_cliente`.`observacao` AS `observacao`,`sis_cliente`.`chavetipo` AS `chavetipo`,`sis_cliente`.`chave` AS `chave`,`sis_cliente`.`contrato` AS `contrato`,`sis_cliente`.`ssid` AS `ssid`,`sis_cliente`.`senha` AS `senha`,`sis_cliente`.`numero` AS `numero`,`sis_cliente`.`responsavel` AS `responsavel`,`sis_cliente`.`nome_pai` AS `nome_pai`,`sis_cliente`.`nome_mae` AS `nome_mae`,`sis_cliente`.`expedicao_rg` AS `expedicao_rg`,`sis_cliente`.`naturalidade` AS `naturalidade`,`sis_cliente`.`acessacen` AS `acessacen`,`sis_cliente`.`pessoa` AS `pessoa`,`sis_cliente`.`endereco_res` AS `endereco_res`,`sis_cliente`.`numero_res` AS `numero_res`,`sis_cliente`.`bairro_res` AS `bairro_res`,`sis_cliente`.`cidade_res` AS `cidade_res`,`sis_cliente`.`cep_res` AS `cep_res`,`sis_cliente`.`estado_res` AS `estado_res`,`sis_cliente`.`complemento_res` AS `complemento_res`,`sis_cliente`.`desconto` AS `desconto`,`sis_cliente`.`acrescimo` AS `acrescimo`,`sis_cliente`.`equipamento` AS `equipamento`,`sis_cliente`.`vendedor` AS `vendedor`,`sis_cliente`.`nextel` AS `nextel`,`sis_cliente`.`accesslist` AS `accesslist`,`sis_cliente`.`resumo` AS `resumo`,`sis_cliente`.`grupo` AS `grupo`,`sis_cliente`.`codigo` AS `codigo`,`sis_cliente`.`prilanc` AS `prilanc`,`sis_cliente`.`tipobloq` AS `tipobloq`,`sis_cliente`.`adesao` AS `adesao`,`sis_cliente`.`mbdisco` AS `mbdisco`,`sis_cliente`.`sms` AS `sms`,`sis_cliente`.`zap` AS `zap`,`sis_cliente`.`ltrafego` AS `ltrafego`,`sis_cliente`.`planodown` AS `planodown`,`sis_cliente`.`ligoudown` AS `ligoudown`,`sis_cliente`.`statusdown` AS `statusdown`,`sis_cliente`.`statusturbo` AS `statusturbo`,`sis_cliente`.`opcelular` AS `opcelular`,`sis_cliente`.`nome_res` AS `nome_res`,`sis_cliente`.`coordenadas` AS `coordenadas`,`sis_cliente`.`rem_obs` AS `rem_obs`,`sis_cliente`.`valor_sva` AS `valor_sva`,`sis_cliente`.`dias_corte` AS `dias_corte`,`sis_cliente`.`user_ip` AS `user_ip`,`sis_cliente`.`user_mac` AS `user_mac`,`sis_cliente`.`data_ip` AS `data_ip`,`sis_cliente`.`data_mac` AS `data_mac`,`sis_cliente`.`last_update` AS `last_update`,`sis_cliente`.`data_bloq` AS `data_bloq`,`sis_cliente`.`tags` AS `tags`,`sis_cliente`.`tecnico` AS `tecnico`,`sis_cliente`.`data_ins` AS `data_ins`,`sis_cliente`.`altsenha` AS `altsenha`,`sis_cliente`.`geranfe` AS `geranfe`,`sis_cliente`.`mesref` AS `mesref`,`sis_cliente`.`ipfall` AS `ipfall`,`sis_cliente`.`tit_abertos` AS `tit_abertos`,`sis_cliente`.`parc_abertas` AS `parc_abertas`,`sis_cliente`.`tipo_pessoa` AS `tipo_pessoa`,`sis_cliente`.`celular2` AS `celular2`,`sis_cliente`.`mac_serial` AS `mac_serial`,`sis_cliente`.`status_corte` AS `status_corte`,`sis_cliente`.`plano15` AS `plano15`,`sis_cliente`.`pgaviso` AS `pgaviso`,`sis_cliente`.`porta_olt` AS `porta_olt`,`sis_cliente`.`caixa_herm` AS `caixa_herm`,`sis_cliente`.`porta_splitter` AS `porta_splitter`,`sis_cliente`.`onu_ont` AS `onu_ont`,`sis_cliente`.`switch` AS `switch`,`sis_cliente`.`tit_vencidos` AS `tit_vencidos`,`sis_cliente`.`pgcorte` AS `pgcorte`,`sis_cliente`.`interface` AS `interface`,`sis_cliente`.`login_atend` AS `login_atend`,`sis_cliente`.`cidade_ibge` AS `cidade_ibge`,`sis_cliente`.`estado_ibge` AS `estado_ibge`,`sis_cliente`.`data_desbloq` AS `data_desbloq`,`sis_cliente`.`pool_name` AS `pool_name`,`sis_cliente`.`pool6` AS `pool6`,`sis_cliente`.`rec_email` AS `rec_email`,`sis_cliente`.`termo` AS `termo`,`sis_cliente`.`opcelular2` AS `opcelular2`,`sis_cliente`.`dot_ref` AS `dot_ref`,`sis_cliente`.`tipo_cliente` AS `tipo_cliente`,`sis_cliente`.`armario_olt` AS `armario_olt`,`sis_cliente`.`conta_cartao` AS `conta_cartao`,`sis_cliente`.`plano_bloqc` AS `plano_bloqc`,`sis_cliente`.`uuid_cliente` AS `uuid_cliente`,`sis_cliente`.`data_desativacao` AS `data_desativacao`,`sis_cliente`.`tipo_cob` AS `tipo_cob`,`sis_cliente`.`fortunus` AS `fortunus`,`sis_cliente`.`gsici` AS `gsici`,`sis_cliente`.`local_dici` AS `local_dici`,`sis_lanc`.`nossonum` AS `nossonum` from (`sis_cliente` join `sis_lanc`) where `sis_cliente`.`login` = `sis_lanc`.`login` and `sis_lanc`.`tipocob` = 'fat' and `sis_lanc`.`imp` = 'nao' group by `sis_cliente`.`login` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vtab_mtitulos`
--

/*!50001 DROP TABLE IF EXISTS `vtab_mtitulos`*/;
/*!50001 DROP VIEW IF EXISTS `vtab_mtitulos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW `vtab_mtitulos` AS select `sis_mlanc`.`id` AS `id`,`sis_mlanc`.`idlanc` AS `idlanc`,`sis_mlanc`.`valor` AS `valor`,`sis_mlanc`.`tipo` AS `tipo`,`sis_mlanc`.`cfop_mlanc` AS `cfop_mlanc`,`sis_mlanc`.`desc` AS `desc`,`sis_mlanc`.`deltitulo` AS `deltitulo`,`sis_lanc`.`datavenc` AS `datavenc`,`sis_lanc`.`datapag` AS `datapag`,`sis_lanc`.`status` AS `status`,`sis_lanc`.`login` AS `login`,`sis_cliente`.`bloqueado` AS `bloqueado`,`sis_cliente`.`mesref` AS `mesref`,`sis_cliente`.`cli_ativado` AS `cli_ativado`,`sis_cliente`.`tipo_cob` AS `tipo_cob`,`sis_cliente`.`tit_abertos` AS `tit_abertos`,`sis_cliente`.`parc_abertas` AS `parc_abertas` from ((`sis_mlanc` join `sis_lanc`) join `sis_cliente`) where `sis_mlanc`.`idlanc` = `sis_lanc`.`id` and `sis_lanc`.`login` = `sis_cliente`.`login` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vtab_newcarne`
--

/*!50001 DROP TABLE IF EXISTS `vtab_newcarne`*/;
/*!50001 DROP VIEW IF EXISTS `vtab_newcarne`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW `vtab_newcarne` AS select `sis_cliente`.`id` AS `id`,`sis_cliente`.`nome` AS `nome`,`sis_cliente`.`email` AS `email`,`sis_cliente`.`endereco` AS `endereco`,`sis_cliente`.`bairro` AS `bairro`,`sis_cliente`.`cidade` AS `cidade`,`sis_cliente`.`cep` AS `cep`,`sis_cliente`.`estado` AS `estado`,`sis_cliente`.`cpf_cnpj` AS `cpf_cnpj`,`sis_cliente`.`fone` AS `fone`,`sis_cliente`.`obs` AS `obs`,`sis_cliente`.`nascimento` AS `nascimento`,`sis_cliente`.`estado_civil` AS `estado_civil`,`sis_cliente`.`cadastro` AS `cadastro`,`sis_cliente`.`login` AS `login`,`sis_cliente`.`tipo` AS `tipo`,`sis_cliente`.`night` AS `night`,`sis_cliente`.`aviso` AS `aviso`,`sis_cliente`.`foto` AS `foto`,`sis_cliente`.`venc` AS `venc`,`sis_cliente`.`mac` AS `mac`,`sis_cliente`.`complemento` AS `complemento`,`sis_cliente`.`ip` AS `ip`,`sis_cliente`.`ramal` AS `ramal`,`sis_cliente`.`rg` AS `rg`,`sis_cliente`.`isento` AS `isento`,`sis_cliente`.`celular` AS `celular`,`sis_cliente`.`bloqueado` AS `bloqueado`,`sis_cliente`.`autoip` AS `autoip`,`sis_cliente`.`automac` AS `automac`,`sis_cliente`.`conta` AS `conta`,`sis_cliente`.`ipvsix` AS `ipvsix`,`sis_cliente`.`plano` AS `plano`,`sis_cliente`.`send` AS `send`,`sis_cliente`.`cli_ativado` AS `cli_ativado`,`sis_cliente`.`simultaneo` AS `simultaneo`,`sis_cliente`.`turbo` AS `turbo`,`sis_cliente`.`comodato` AS `comodato`,`sis_cliente`.`observacao` AS `observacao`,`sis_cliente`.`chavetipo` AS `chavetipo`,`sis_cliente`.`chave` AS `chave`,`sis_cliente`.`contrato` AS `contrato`,`sis_cliente`.`ssid` AS `ssid`,`sis_cliente`.`senha` AS `senha`,`sis_cliente`.`numero` AS `numero`,`sis_cliente`.`responsavel` AS `responsavel`,`sis_cliente`.`nome_pai` AS `nome_pai`,`sis_cliente`.`nome_mae` AS `nome_mae`,`sis_cliente`.`expedicao_rg` AS `expedicao_rg`,`sis_cliente`.`naturalidade` AS `naturalidade`,`sis_cliente`.`acessacen` AS `acessacen`,`sis_cliente`.`pessoa` AS `pessoa`,`sis_cliente`.`endereco_res` AS `endereco_res`,`sis_cliente`.`numero_res` AS `numero_res`,`sis_cliente`.`bairro_res` AS `bairro_res`,`sis_cliente`.`cidade_res` AS `cidade_res`,`sis_cliente`.`cep_res` AS `cep_res`,`sis_cliente`.`estado_res` AS `estado_res`,`sis_cliente`.`complemento_res` AS `complemento_res`,`sis_cliente`.`desconto` AS `desconto`,`sis_cliente`.`acrescimo` AS `acrescimo`,`sis_cliente`.`equipamento` AS `equipamento`,`sis_cliente`.`vendedor` AS `vendedor`,`sis_cliente`.`nextel` AS `nextel`,`sis_cliente`.`accesslist` AS `accesslist`,`sis_cliente`.`resumo` AS `resumo`,`sis_cliente`.`grupo` AS `grupo`,`sis_cliente`.`codigo` AS `codigo`,`sis_cliente`.`prilanc` AS `prilanc`,`sis_cliente`.`tipobloq` AS `tipobloq`,`sis_cliente`.`adesao` AS `adesao`,`sis_cliente`.`mbdisco` AS `mbdisco`,`sis_cliente`.`sms` AS `sms`,`sis_cliente`.`zap` AS `zap`,`sis_cliente`.`ltrafego` AS `ltrafego`,`sis_cliente`.`planodown` AS `planodown`,`sis_cliente`.`ligoudown` AS `ligoudown`,`sis_cliente`.`statusdown` AS `statusdown`,`sis_cliente`.`statusturbo` AS `statusturbo`,`sis_cliente`.`opcelular` AS `opcelular`,`sis_cliente`.`nome_res` AS `nome_res`,`sis_cliente`.`coordenadas` AS `coordenadas`,`sis_cliente`.`rem_obs` AS `rem_obs`,`sis_cliente`.`valor_sva` AS `valor_sva`,`sis_cliente`.`dias_corte` AS `dias_corte`,`sis_cliente`.`user_ip` AS `user_ip`,`sis_cliente`.`user_mac` AS `user_mac`,`sis_cliente`.`data_ip` AS `data_ip`,`sis_cliente`.`data_mac` AS `data_mac`,`sis_cliente`.`last_update` AS `last_update`,`sis_cliente`.`data_bloq` AS `data_bloq`,`sis_cliente`.`tags` AS `tags`,`sis_cliente`.`tecnico` AS `tecnico`,`sis_cliente`.`data_ins` AS `data_ins`,`sis_cliente`.`altsenha` AS `altsenha`,`sis_cliente`.`geranfe` AS `geranfe`,`sis_cliente`.`mesref` AS `mesref`,`sis_cliente`.`ipfall` AS `ipfall`,`sis_cliente`.`tit_abertos` AS `tit_abertos`,`sis_cliente`.`parc_abertas` AS `parc_abertas`,`sis_cliente`.`tipo_pessoa` AS `tipo_pessoa`,`sis_cliente`.`celular2` AS `celular2`,`sis_cliente`.`mac_serial` AS `mac_serial`,`sis_cliente`.`status_corte` AS `status_corte`,`sis_cliente`.`plano15` AS `plano15`,`sis_cliente`.`pgaviso` AS `pgaviso`,`sis_cliente`.`porta_olt` AS `porta_olt`,`sis_cliente`.`caixa_herm` AS `caixa_herm`,`sis_cliente`.`porta_splitter` AS `porta_splitter`,`sis_cliente`.`onu_ont` AS `onu_ont`,`sis_cliente`.`switch` AS `switch`,`sis_cliente`.`tit_vencidos` AS `tit_vencidos`,`sis_cliente`.`pgcorte` AS `pgcorte`,`sis_cliente`.`interface` AS `interface`,`sis_cliente`.`login_atend` AS `login_atend`,`sis_cliente`.`cidade_ibge` AS `cidade_ibge`,`sis_cliente`.`estado_ibge` AS `estado_ibge`,`sis_cliente`.`data_desbloq` AS `data_desbloq`,`sis_cliente`.`pool_name` AS `pool_name`,`sis_cliente`.`pool6` AS `pool6`,`sis_cliente`.`rec_email` AS `rec_email`,`sis_cliente`.`termo` AS `termo`,`sis_cliente`.`opcelular2` AS `opcelular2`,`sis_cliente`.`dot_ref` AS `dot_ref`,`sis_cliente`.`tipo_cliente` AS `tipo_cliente`,`sis_cliente`.`armario_olt` AS `armario_olt`,`sis_cliente`.`conta_cartao` AS `conta_cartao`,`sis_cliente`.`plano_bloqc` AS `plano_bloqc`,`sis_cliente`.`uuid_cliente` AS `uuid_cliente`,`sis_cliente`.`data_desativacao` AS `data_desativacao`,`sis_cliente`.`tipo_cob` AS `tipo_cob`,`sis_cliente`.`fortunus` AS `fortunus`,`sis_cliente`.`gsici` AS `gsici`,`sis_cliente`.`local_dici` AS `local_dici`,`sis_lanc`.`id` AS `parcela`,`sis_lanc`.`deltitulo` AS `deltitulo` from (`sis_cliente` left join `sis_lanc` on(`sis_lanc`.`login` = `sis_cliente`.`login` and `sis_lanc`.`status` <> 'pago' and `sis_lanc`.`tipo` = 'mensalidade' and `sis_lanc`.`tipocob` = 'car' and `sis_lanc`.`deltitulo` = 0)) where `sis_cliente`.`cli_ativado` = 's' and `sis_cliente`.`isento` = 'nao' and `sis_cliente`.`fortunus` = 0 and `sis_cliente`.`tipo_cob` = 'carne' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vtab_newtitulo`
--

/*!50001 DROP TABLE IF EXISTS `vtab_newtitulo`*/;
/*!50001 DROP VIEW IF EXISTS `vtab_newtitulo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW `vtab_newtitulo` AS select `sis_cliente`.`id` AS `id`,`sis_cliente`.`nome` AS `nome`,`sis_cliente`.`email` AS `email`,`sis_cliente`.`endereco` AS `endereco`,`sis_cliente`.`bairro` AS `bairro`,`sis_cliente`.`cidade` AS `cidade`,`sis_cliente`.`cep` AS `cep`,`sis_cliente`.`estado` AS `estado`,`sis_cliente`.`cpf_cnpj` AS `cpf_cnpj`,`sis_cliente`.`fone` AS `fone`,`sis_cliente`.`obs` AS `obs`,`sis_cliente`.`nascimento` AS `nascimento`,`sis_cliente`.`estado_civil` AS `estado_civil`,`sis_cliente`.`cadastro` AS `cadastro`,`sis_cliente`.`login` AS `login`,`sis_cliente`.`tipo` AS `tipo`,`sis_cliente`.`night` AS `night`,`sis_cliente`.`aviso` AS `aviso`,`sis_cliente`.`foto` AS `foto`,`sis_cliente`.`venc` AS `venc`,`sis_cliente`.`mac` AS `mac`,`sis_cliente`.`complemento` AS `complemento`,`sis_cliente`.`ip` AS `ip`,`sis_cliente`.`ramal` AS `ramal`,`sis_cliente`.`rg` AS `rg`,`sis_cliente`.`isento` AS `isento`,`sis_cliente`.`celular` AS `celular`,`sis_cliente`.`bloqueado` AS `bloqueado`,`sis_cliente`.`autoip` AS `autoip`,`sis_cliente`.`automac` AS `automac`,`sis_cliente`.`conta` AS `conta`,`sis_cliente`.`ipvsix` AS `ipvsix`,`sis_cliente`.`plano` AS `plano`,`sis_cliente`.`send` AS `send`,`sis_cliente`.`cli_ativado` AS `cli_ativado`,`sis_cliente`.`simultaneo` AS `simultaneo`,`sis_cliente`.`turbo` AS `turbo`,`sis_cliente`.`comodato` AS `comodato`,`sis_cliente`.`observacao` AS `observacao`,`sis_cliente`.`chavetipo` AS `chavetipo`,`sis_cliente`.`chave` AS `chave`,`sis_cliente`.`contrato` AS `contrato`,`sis_cliente`.`ssid` AS `ssid`,`sis_cliente`.`senha` AS `senha`,`sis_cliente`.`numero` AS `numero`,`sis_cliente`.`responsavel` AS `responsavel`,`sis_cliente`.`nome_pai` AS `nome_pai`,`sis_cliente`.`nome_mae` AS `nome_mae`,`sis_cliente`.`expedicao_rg` AS `expedicao_rg`,`sis_cliente`.`naturalidade` AS `naturalidade`,`sis_cliente`.`acessacen` AS `acessacen`,`sis_cliente`.`pessoa` AS `pessoa`,`sis_cliente`.`endereco_res` AS `endereco_res`,`sis_cliente`.`numero_res` AS `numero_res`,`sis_cliente`.`bairro_res` AS `bairro_res`,`sis_cliente`.`cidade_res` AS `cidade_res`,`sis_cliente`.`cep_res` AS `cep_res`,`sis_cliente`.`estado_res` AS `estado_res`,`sis_cliente`.`complemento_res` AS `complemento_res`,`sis_cliente`.`desconto` AS `desconto`,`sis_cliente`.`acrescimo` AS `acrescimo`,`sis_cliente`.`equipamento` AS `equipamento`,`sis_cliente`.`vendedor` AS `vendedor`,`sis_cliente`.`nextel` AS `nextel`,`sis_cliente`.`accesslist` AS `accesslist`,`sis_cliente`.`resumo` AS `resumo`,`sis_cliente`.`grupo` AS `grupo`,`sis_cliente`.`codigo` AS `codigo`,`sis_cliente`.`prilanc` AS `prilanc`,`sis_cliente`.`tipobloq` AS `tipobloq`,`sis_cliente`.`adesao` AS `adesao`,`sis_cliente`.`mbdisco` AS `mbdisco`,`sis_cliente`.`sms` AS `sms`,`sis_cliente`.`zap` AS `zap`,`sis_cliente`.`ltrafego` AS `ltrafego`,`sis_cliente`.`planodown` AS `planodown`,`sis_cliente`.`ligoudown` AS `ligoudown`,`sis_cliente`.`statusdown` AS `statusdown`,`sis_cliente`.`statusturbo` AS `statusturbo`,`sis_cliente`.`opcelular` AS `opcelular`,`sis_cliente`.`nome_res` AS `nome_res`,`sis_cliente`.`coordenadas` AS `coordenadas`,`sis_cliente`.`rem_obs` AS `rem_obs`,`sis_cliente`.`valor_sva` AS `valor_sva`,`sis_cliente`.`dias_corte` AS `dias_corte`,`sis_cliente`.`user_ip` AS `user_ip`,`sis_cliente`.`user_mac` AS `user_mac`,`sis_cliente`.`data_ip` AS `data_ip`,`sis_cliente`.`data_mac` AS `data_mac`,`sis_cliente`.`last_update` AS `last_update`,`sis_cliente`.`data_bloq` AS `data_bloq`,`sis_cliente`.`tags` AS `tags`,`sis_cliente`.`tecnico` AS `tecnico`,`sis_cliente`.`data_ins` AS `data_ins`,`sis_cliente`.`altsenha` AS `altsenha`,`sis_cliente`.`geranfe` AS `geranfe`,`sis_cliente`.`mesref` AS `mesref`,`sis_cliente`.`ipfall` AS `ipfall`,`sis_cliente`.`tit_abertos` AS `tit_abertos`,`sis_cliente`.`parc_abertas` AS `parc_abertas`,`sis_cliente`.`tipo_pessoa` AS `tipo_pessoa`,`sis_cliente`.`celular2` AS `celular2`,`sis_cliente`.`mac_serial` AS `mac_serial`,`sis_cliente`.`status_corte` AS `status_corte`,`sis_cliente`.`plano15` AS `plano15`,`sis_cliente`.`pgaviso` AS `pgaviso`,`sis_cliente`.`porta_olt` AS `porta_olt`,`sis_cliente`.`caixa_herm` AS `caixa_herm`,`sis_cliente`.`porta_splitter` AS `porta_splitter`,`sis_cliente`.`onu_ont` AS `onu_ont`,`sis_cliente`.`switch` AS `switch`,`sis_cliente`.`tit_vencidos` AS `tit_vencidos`,`sis_cliente`.`pgcorte` AS `pgcorte`,`sis_cliente`.`interface` AS `interface`,`sis_cliente`.`login_atend` AS `login_atend`,`sis_cliente`.`cidade_ibge` AS `cidade_ibge`,`sis_cliente`.`estado_ibge` AS `estado_ibge`,`sis_cliente`.`data_desbloq` AS `data_desbloq`,`sis_cliente`.`pool_name` AS `pool_name`,`sis_cliente`.`pool6` AS `pool6`,`sis_cliente`.`rec_email` AS `rec_email`,`sis_cliente`.`termo` AS `termo`,`sis_cliente`.`opcelular2` AS `opcelular2`,`sis_cliente`.`dot_ref` AS `dot_ref`,`sis_cliente`.`tipo_cliente` AS `tipo_cliente`,`sis_cliente`.`armario_olt` AS `armario_olt`,`sis_cliente`.`conta_cartao` AS `conta_cartao`,`sis_cliente`.`plano_bloqc` AS `plano_bloqc`,`sis_cliente`.`uuid_cliente` AS `uuid_cliente`,`sis_cliente`.`data_desativacao` AS `data_desativacao`,`sis_cliente`.`tipo_cob` AS `tipo_cob`,`sis_cliente`.`fortunus` AS `fortunus`,`sis_cliente`.`gsici` AS `gsici`,`sis_cliente`.`local_dici` AS `local_dici`,`sis_lanc`.`id` AS `titulo`,`sis_lanc`.`deltitulo` AS `deltitulo` from (`sis_cliente` left join `sis_lanc` on(`sis_lanc`.`login` = `sis_cliente`.`login` and `sis_lanc`.`status` <> 'pago' and `sis_lanc`.`tipo` = 'mensalidade' and `sis_lanc`.`tipocob` = 'fat' and `sis_lanc`.`deltitulo` = 0)) where `sis_cliente`.`cli_ativado` = 's' and `sis_cliente`.`isento` = 'nao' and `sis_cliente`.`tipo_cob` = 'titulo' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vtab_remtitulos01`
--

/*!50001 DROP TABLE IF EXISTS `vtab_remtitulos01`*/;
/*!50001 DROP VIEW IF EXISTS `vtab_remtitulos01`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW `vtab_remtitulos01` AS select `sis_cliente`.`nome` AS `nome`,`sis_cliente`.`email` AS `email`,`sis_cliente`.`endereco` AS `endereco`,`sis_cliente`.`complemento` AS `complemento`,`sis_cliente`.`bairro` AS `bairro`,`sis_cliente`.`cidade` AS `cidade`,`sis_cliente`.`cep` AS `cep`,`sis_cliente`.`estado` AS `estado`,`sis_cliente`.`cpf_cnpj` AS `cpf_cnpj`,`sis_cliente`.`login` AS `login`,`sis_cliente`.`venc` AS `venc`,`sis_cliente`.`numero` AS `numero`,`sis_cliente`.`cli_ativado` AS `cli_ativado`,`sis_cliente`.`bloqueado` AS `bloqueado`,`sis_cliente`.`mesref` AS `mesref`,`sis_cliente`.`plano` AS `plano`,`sis_cliente`.`grupo` AS `grupo`,`sis_cliente`.`ramal` AS `ramal`,`sis_cliente`.`data_bloq` AS `data_bloq`,`sis_cliente`.`tipo_cob` AS `tipo_cob`,`sis_cliente`.`tit_abertos` AS `tit_abertos`,`sis_cliente`.`parc_abertas` AS `parc_abertas`,`sis_lanc`.`remvalor` AS `valor`,`sis_lanc`.`id` AS `titulo`,`sis_lanc`.`imp` AS `imp`,`sis_lanc`.`datavenc` AS `datavenc`,`sis_lanc`.`referencia` AS `referencia`,`sis_lanc`.`nossonum` AS `nossonum`,`sis_lanc`.`processamento` AS `processamento`,`sis_lanc`.`percmulta` AS `percmulta`,`sis_lanc`.`valormulta` AS `valormulta`,`sis_lanc`.`percmora` AS `percmora`,`sis_lanc`.`valormora` AS `valormora`,`sis_lanc`.`percdesc` AS `percdesc`,`sis_lanc`.`valordesc` AS `valordesc`,`sis_lanc`.`datapag` AS `datapag`,`sis_lanc`.`datadel` AS `datadel`,`sis_lanc`.`deltitulo` AS `deltitulo`,`sis_lanc`.`numconta` AS `numconta`,'01' AS `cod_ocorrencia`,`sis_lanc`.`oco01` AS `oco01`,`sis_lanc`.`oco02` AS `oco02`,`sis_lanc`.`oco06` AS `oco06` from (`sis_cliente` join `sis_lanc`) where `sis_cliente`.`login` = `sis_lanc`.`login` and `sis_lanc`.`nossonum` <> '' and `sis_lanc`.`deltitulo` = 0 and `sis_lanc`.`status` <> 'pago' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vtab_remtitulos02`
--

/*!50001 DROP TABLE IF EXISTS `vtab_remtitulos02`*/;
/*!50001 DROP VIEW IF EXISTS `vtab_remtitulos02`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW `vtab_remtitulos02` AS select `sis_cliente`.`nome` AS `nome`,`sis_cliente`.`email` AS `email`,`sis_cliente`.`endereco` AS `endereco`,`sis_cliente`.`complemento` AS `complemento`,`sis_cliente`.`bairro` AS `bairro`,`sis_cliente`.`cidade` AS `cidade`,`sis_cliente`.`cep` AS `cep`,`sis_cliente`.`estado` AS `estado`,`sis_cliente`.`cpf_cnpj` AS `cpf_cnpj`,`sis_cliente`.`login` AS `login`,`sis_cliente`.`venc` AS `venc`,`sis_cliente`.`numero` AS `numero`,`sis_cliente`.`cli_ativado` AS `cli_ativado`,`sis_cliente`.`bloqueado` AS `bloqueado`,`sis_cliente`.`mesref` AS `mesref`,`sis_cliente`.`plano` AS `plano`,`sis_cliente`.`grupo` AS `grupo`,`sis_cliente`.`ramal` AS `ramal`,`sis_cliente`.`data_bloq` AS `data_bloq`,`sis_cliente`.`tipo_cob` AS `tipo_cob`,`sis_cliente`.`tit_abertos` AS `tit_abertos`,`sis_cliente`.`parc_abertas` AS `parc_abertas`,`sis_lanc`.`remvalor` AS `valor`,`sis_lanc`.`id` AS `titulo`,`sis_lanc`.`imp` AS `imp`,`sis_lanc`.`datavenc` AS `datavenc`,`sis_lanc`.`referencia` AS `referencia`,`sis_lanc`.`nossonum` AS `nossonum`,`sis_lanc`.`processamento` AS `processamento`,`sis_lanc`.`percmulta` AS `percmulta`,`sis_lanc`.`valormulta` AS `valormulta`,`sis_lanc`.`percmora` AS `percmora`,`sis_lanc`.`valormora` AS `valormora`,`sis_lanc`.`percdesc` AS `percdesc`,`sis_lanc`.`valordesc` AS `valordesc`,`sis_lanc`.`datapag` AS `datapag`,`sis_lanc`.`datadel` AS `datadel`,`sis_lanc`.`deltitulo` AS `deltitulo`,`sis_lanc`.`numconta` AS `numconta`,'02' AS `cod_ocorrencia`,`sis_lanc`.`oco01` AS `oco01`,`sis_lanc`.`oco02` AS `oco02`,`sis_lanc`.`oco06` AS `oco06` from (`sis_cliente` join `sis_lanc`) where `sis_cliente`.`login` = `sis_lanc`.`login` and `sis_lanc`.`nossonum` <> '' and `sis_lanc`.`deltitulo` = 0 and `sis_lanc`.`coletor` <> 'arq.retorno' and `sis_lanc`.`status` = 'pago' and `sis_lanc`.`gerourem` <> 0 union select `sis_cliente`.`nome` AS `nome`,`sis_cliente`.`email` AS `email`,`sis_cliente`.`endereco` AS `endereco`,`sis_cliente`.`complemento` AS `complemento`,`sis_cliente`.`bairro` AS `bairro`,`sis_cliente`.`cidade` AS `cidade`,`sis_cliente`.`cep` AS `cep`,`sis_cliente`.`estado` AS `estado`,`sis_cliente`.`cpf_cnpj` AS `cpf_cnpj`,`sis_cliente`.`login` AS `login`,`sis_cliente`.`venc` AS `venc`,`sis_cliente`.`numero` AS `numero`,`sis_cliente`.`cli_ativado` AS `cli_ativado`,`sis_cliente`.`bloqueado` AS `bloqueado`,`sis_cliente`.`mesref` AS `mesref`,`sis_cliente`.`plano` AS `plano`,`sis_cliente`.`grupo` AS `grupo`,`sis_cliente`.`ramal` AS `ramal`,`sis_cliente`.`data_bloq` AS `data_bloq`,`sis_cliente`.`tipo_cob` AS `tipo_cob`,`sis_cliente`.`tit_abertos` AS `tit_abertos`,`sis_cliente`.`parc_abertas` AS `parc_abertas`,`sis_lanc`.`remvalor` AS `valor`,`sis_lanc`.`id` AS `titulo`,`sis_lanc`.`imp` AS `imp`,`sis_lanc`.`datavenc` AS `datavenc`,`sis_lanc`.`referencia` AS `referencia`,`sis_lanc`.`nossonum` AS `nossonum`,`sis_lanc`.`processamento` AS `processamento`,`sis_lanc`.`percmulta` AS `percmulta`,`sis_lanc`.`valormulta` AS `valormulta`,`sis_lanc`.`percmora` AS `percmora`,`sis_lanc`.`valormora` AS `valormora`,`sis_lanc`.`percdesc` AS `percdesc`,`sis_lanc`.`valordesc` AS `valordesc`,`sis_lanc`.`datapag` AS `datapag`,`sis_lanc`.`datadel` AS `datadel`,`sis_lanc`.`deltitulo` AS `deltitulo`,`sis_lanc`.`numconta` AS `numconta`,'02' AS `cod_ocorrencia`,`sis_lanc`.`oco01` AS `oco01`,`sis_lanc`.`oco02` AS `oco02`,`sis_lanc`.`oco06` AS `oco06` from (`sis_cliente` join `sis_lanc`) where `sis_cliente`.`login` = `sis_lanc`.`login` and `sis_lanc`.`nossonum` <> '' and `sis_lanc`.`deltitulo` = 1 and `sis_lanc`.`gerourem` <> 0 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vtab_remtitulos06`
--

/*!50001 DROP TABLE IF EXISTS `vtab_remtitulos06`*/;
/*!50001 DROP VIEW IF EXISTS `vtab_remtitulos06`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW `vtab_remtitulos06` AS select `sis_cliente`.`nome` AS `nome`,`sis_cliente`.`email` AS `email`,`sis_cliente`.`endereco` AS `endereco`,`sis_cliente`.`complemento` AS `complemento`,`sis_cliente`.`bairro` AS `bairro`,`sis_cliente`.`cidade` AS `cidade`,`sis_cliente`.`cep` AS `cep`,`sis_cliente`.`estado` AS `estado`,`sis_cliente`.`cpf_cnpj` AS `cpf_cnpj`,`sis_cliente`.`login` AS `login`,`sis_cliente`.`venc` AS `venc`,`sis_cliente`.`numero` AS `numero`,`sis_cliente`.`cli_ativado` AS `cli_ativado`,`sis_cliente`.`bloqueado` AS `bloqueado`,`sis_cliente`.`mesref` AS `mesref`,`sis_cliente`.`plano` AS `plano`,`sis_cliente`.`grupo` AS `grupo`,`sis_cliente`.`ramal` AS `ramal`,`sis_cliente`.`data_bloq` AS `data_bloq`,`sis_cliente`.`tipo_cob` AS `tipo_cob`,`sis_cliente`.`tit_abertos` AS `tit_abertos`,`sis_cliente`.`parc_abertas` AS `parc_abertas`,`sis_lanc`.`remvalor` AS `valor`,`sis_lanc`.`id` AS `titulo`,`sis_lanc`.`imp` AS `imp`,`sis_lanc`.`datavenc` AS `datavenc`,`sis_lanc`.`referencia` AS `referencia`,`sis_lanc`.`nossonum` AS `nossonum`,`sis_lanc`.`processamento` AS `processamento`,`sis_lanc`.`percmulta` AS `percmulta`,`sis_lanc`.`valormulta` AS `valormulta`,`sis_lanc`.`percmora` AS `percmora`,`sis_lanc`.`valormora` AS `valormora`,`sis_lanc`.`percdesc` AS `percdesc`,`sis_lanc`.`valordesc` AS `valordesc`,`sis_lanc`.`datapag` AS `datapag`,`sis_lanc`.`datadel` AS `datadel`,`sis_lanc`.`deltitulo` AS `deltitulo`,`sis_lanc`.`numconta` AS `numconta`,'06' AS `cod_ocorrencia`,`sis_lanc`.`oco01` AS `oco01`,`sis_lanc`.`oco02` AS `oco02`,`sis_lanc`.`oco06` AS `oco06` from (`sis_cliente` join `sis_lanc`) where `sis_cliente`.`login` = `sis_lanc`.`login` and `sis_lanc`.`nossonum` <> '' and `sis_lanc`.`deltitulo` = 0 and `sis_lanc`.`alt_venc` <> 0 and `sis_lanc`.`status` <> 'pago' and `sis_lanc`.`gerourem` <> 0 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vtab_sem_nossonum`
--

/*!50001 DROP TABLE IF EXISTS `vtab_sem_nossonum`*/;
/*!50001 DROP VIEW IF EXISTS `vtab_sem_nossonum`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW `vtab_sem_nossonum` AS select `sis_cliente`.`id` AS `id`,`sis_cliente`.`nome` AS `nome`,`sis_cliente`.`email` AS `email`,`sis_cliente`.`endereco` AS `endereco`,`sis_cliente`.`bairro` AS `bairro`,`sis_cliente`.`cidade` AS `cidade`,`sis_cliente`.`cep` AS `cep`,`sis_cliente`.`estado` AS `estado`,`sis_cliente`.`cpf_cnpj` AS `cpf_cnpj`,`sis_cliente`.`fone` AS `fone`,`sis_cliente`.`obs` AS `obs`,`sis_cliente`.`nascimento` AS `nascimento`,`sis_cliente`.`estado_civil` AS `estado_civil`,`sis_cliente`.`cadastro` AS `cadastro`,`sis_cliente`.`login` AS `login`,`sis_cliente`.`tipo` AS `tipo`,`sis_cliente`.`night` AS `night`,`sis_cliente`.`aviso` AS `aviso`,`sis_cliente`.`foto` AS `foto`,`sis_cliente`.`venc` AS `venc`,`sis_cliente`.`mac` AS `mac`,`sis_cliente`.`complemento` AS `complemento`,`sis_cliente`.`ip` AS `ip`,`sis_cliente`.`ramal` AS `ramal`,`sis_cliente`.`rg` AS `rg`,`sis_cliente`.`isento` AS `isento`,`sis_cliente`.`celular` AS `celular`,`sis_cliente`.`bloqueado` AS `bloqueado`,`sis_cliente`.`autoip` AS `autoip`,`sis_cliente`.`automac` AS `automac`,`sis_cliente`.`conta` AS `conta`,`sis_cliente`.`ipvsix` AS `ipvsix`,`sis_cliente`.`plano` AS `plano`,`sis_cliente`.`send` AS `send`,`sis_cliente`.`cli_ativado` AS `cli_ativado`,`sis_cliente`.`simultaneo` AS `simultaneo`,`sis_cliente`.`turbo` AS `turbo`,`sis_cliente`.`comodato` AS `comodato`,`sis_cliente`.`observacao` AS `observacao`,`sis_cliente`.`chavetipo` AS `chavetipo`,`sis_cliente`.`chave` AS `chave`,`sis_cliente`.`contrato` AS `contrato`,`sis_cliente`.`ssid` AS `ssid`,`sis_cliente`.`senha` AS `senha`,`sis_cliente`.`numero` AS `numero`,`sis_cliente`.`responsavel` AS `responsavel`,`sis_cliente`.`nome_pai` AS `nome_pai`,`sis_cliente`.`nome_mae` AS `nome_mae`,`sis_cliente`.`expedicao_rg` AS `expedicao_rg`,`sis_cliente`.`naturalidade` AS `naturalidade`,`sis_cliente`.`acessacen` AS `acessacen`,`sis_cliente`.`pessoa` AS `pessoa`,`sis_cliente`.`endereco_res` AS `endereco_res`,`sis_cliente`.`numero_res` AS `numero_res`,`sis_cliente`.`bairro_res` AS `bairro_res`,`sis_cliente`.`cidade_res` AS `cidade_res`,`sis_cliente`.`cep_res` AS `cep_res`,`sis_cliente`.`estado_res` AS `estado_res`,`sis_cliente`.`complemento_res` AS `complemento_res`,`sis_cliente`.`desconto` AS `desconto`,`sis_cliente`.`acrescimo` AS `acrescimo`,`sis_cliente`.`equipamento` AS `equipamento`,`sis_cliente`.`vendedor` AS `vendedor`,`sis_cliente`.`nextel` AS `nextel`,`sis_cliente`.`accesslist` AS `accesslist`,`sis_cliente`.`resumo` AS `resumo`,`sis_cliente`.`grupo` AS `grupo`,`sis_cliente`.`codigo` AS `codigo`,`sis_cliente`.`prilanc` AS `prilanc`,`sis_cliente`.`tipobloq` AS `tipobloq`,`sis_cliente`.`adesao` AS `adesao`,`sis_cliente`.`mbdisco` AS `mbdisco`,`sis_cliente`.`sms` AS `sms`,`sis_cliente`.`zap` AS `zap`,`sis_cliente`.`ltrafego` AS `ltrafego`,`sis_cliente`.`planodown` AS `planodown`,`sis_cliente`.`ligoudown` AS `ligoudown`,`sis_cliente`.`statusdown` AS `statusdown`,`sis_cliente`.`statusturbo` AS `statusturbo`,`sis_cliente`.`opcelular` AS `opcelular`,`sis_cliente`.`nome_res` AS `nome_res`,`sis_cliente`.`coordenadas` AS `coordenadas`,`sis_cliente`.`rem_obs` AS `rem_obs`,`sis_cliente`.`valor_sva` AS `valor_sva`,`sis_cliente`.`dias_corte` AS `dias_corte`,`sis_cliente`.`user_ip` AS `user_ip`,`sis_cliente`.`user_mac` AS `user_mac`,`sis_cliente`.`data_ip` AS `data_ip`,`sis_cliente`.`data_mac` AS `data_mac`,`sis_cliente`.`last_update` AS `last_update`,`sis_cliente`.`data_bloq` AS `data_bloq`,`sis_cliente`.`tags` AS `tags`,`sis_cliente`.`tecnico` AS `tecnico`,`sis_cliente`.`data_ins` AS `data_ins`,`sis_cliente`.`altsenha` AS `altsenha`,`sis_cliente`.`geranfe` AS `geranfe`,`sis_cliente`.`mesref` AS `mesref`,`sis_cliente`.`ipfall` AS `ipfall`,`sis_cliente`.`tit_abertos` AS `tit_abertos`,`sis_cliente`.`parc_abertas` AS `parc_abertas`,`sis_cliente`.`tipo_pessoa` AS `tipo_pessoa`,`sis_cliente`.`celular2` AS `celular2`,`sis_cliente`.`mac_serial` AS `mac_serial`,`sis_cliente`.`status_corte` AS `status_corte`,`sis_cliente`.`plano15` AS `plano15`,`sis_cliente`.`pgaviso` AS `pgaviso`,`sis_cliente`.`porta_olt` AS `porta_olt`,`sis_cliente`.`caixa_herm` AS `caixa_herm`,`sis_cliente`.`porta_splitter` AS `porta_splitter`,`sis_cliente`.`onu_ont` AS `onu_ont`,`sis_cliente`.`switch` AS `switch`,`sis_cliente`.`tit_vencidos` AS `tit_vencidos`,`sis_cliente`.`pgcorte` AS `pgcorte`,`sis_cliente`.`interface` AS `interface`,`sis_cliente`.`login_atend` AS `login_atend`,`sis_cliente`.`cidade_ibge` AS `cidade_ibge`,`sis_cliente`.`estado_ibge` AS `estado_ibge`,`sis_cliente`.`data_desbloq` AS `data_desbloq`,`sis_cliente`.`pool_name` AS `pool_name`,`sis_cliente`.`pool6` AS `pool6`,`sis_cliente`.`rec_email` AS `rec_email`,`sis_cliente`.`termo` AS `termo`,`sis_cliente`.`opcelular2` AS `opcelular2`,`sis_cliente`.`dot_ref` AS `dot_ref`,`sis_cliente`.`tipo_cliente` AS `tipo_cliente`,`sis_cliente`.`armario_olt` AS `armario_olt`,`sis_cliente`.`conta_cartao` AS `conta_cartao`,`sis_cliente`.`plano_bloqc` AS `plano_bloqc`,`sis_cliente`.`uuid_cliente` AS `uuid_cliente`,`sis_cliente`.`data_desativacao` AS `data_desativacao`,`sis_cliente`.`tipo_cob` AS `tipo_cob`,`sis_cliente`.`fortunus` AS `fortunus`,`sis_cliente`.`gsici` AS `gsici`,`sis_cliente`.`local_dici` AS `local_dici`,`sis_lanc`.`nossonum` AS `nossonum` from (`sis_cliente` join `sis_lanc`) where `sis_cliente`.`login` = `sis_lanc`.`login` and `sis_lanc`.`nossonum` is null group by `sis_cliente`.`login` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vtab_suportes`
--

/*!50001 DROP TABLE IF EXISTS `vtab_suportes`*/;
/*!50001 DROP VIEW IF EXISTS `vtab_suportes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW `vtab_suportes` AS select `sis_cliente`.`nome` AS `nome`,`sis_cliente`.`email` AS `email`,`sis_cliente`.`vendedor` AS `vendedor`,`sis_cliente`.`endereco` AS `endereco`,`sis_cliente`.`complemento` AS `complemento`,`sis_cliente`.`bairro` AS `bairro`,`sis_cliente`.`cidade` AS `cidade`,`sis_cliente`.`cep` AS `cep`,`sis_cliente`.`estado` AS `estado`,`sis_cliente`.`cpf_cnpj` AS `cpf_cnpj`,`sis_cliente`.`fone` AS `fone`,`sis_cliente`.`login` AS `login`,`sis_cliente`.`venc` AS `venc`,`sis_cliente`.`celular` AS `celular`,`sis_cliente`.`conta` AS `conta`,`sis_cliente`.`plano` AS `plano`,`sis_cliente`.`numero` AS `numero`,`sis_cliente`.`cli_ativado` AS `cli_ativado`,`sis_cliente`.`bloqueado` AS `bloqueado`,`sis_cliente`.`grupo` AS `grupo`,`sis_cliente`.`codigo` AS `codigo`,`sis_cliente`.`mesref` AS `mesref`,`sis_cliente`.`tipo_cob` AS `tipo_cob`,`sis_cliente`.`tit_abertos` AS `tit_abertos`,`sis_cliente`.`parc_abertas` AS `parc_abertas`,`sis_suporte`.`assunto` AS `assunto`,`sis_suporte`.`abertura` AS `abertura`,`sis_suporte`.`fechamento` AS `fechamento`,`sis_suporte`.`status` AS `status`,`sis_suporte`.`chamado` AS `chamado`,`sis_suporte`.`atendente` AS `atendente`,`sis_suporte`.`visita` AS `visita`,`sis_suporte`.`prioridade` AS `prioridade`,`sis_suporte`.`ramal` AS `ramal`,`sis_suporte`.`reply` AS `reply`,`sis_suporte`.`tecnico` AS `tecnico`,`sis_suporte`.`login_atend` AS `login_atend`,`sis_suporte`.`id` AS `id`,`sis_suporte`.`uuid_suporte` AS `uuid_suporte` from (`sis_cliente` join `sis_suporte`) where `sis_cliente`.`login` = `sis_suporte`.`login` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vtab_titulos`
--

/*!50001 DROP TABLE IF EXISTS `vtab_titulos`*/;
/*!50001 DROP VIEW IF EXISTS `vtab_titulos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW `vtab_titulos` AS select `sis_cliente`.`nome` AS `nome`,`sis_cliente`.`pessoa` AS `pessoa`,`sis_cliente`.`nome_res` AS `nome_res`,`sis_cliente`.`senha` AS `senha`,`sis_cliente`.`email` AS `email`,`sis_cliente`.`vendedor` AS `vendedor`,`sis_cliente`.`endereco` AS `endereco`,`sis_cliente`.`complemento` AS `complemento`,`sis_cliente`.`bairro` AS `bairro`,`sis_cliente`.`cidade` AS `cidade`,`sis_cliente`.`cep` AS `cep`,`sis_cliente`.`estado` AS `estado`,`sis_cliente`.`cpf_cnpj` AS `cpf_cnpj`,`sis_cliente`.`fone` AS `fone`,`sis_cliente`.`login` AS `login`,`sis_cliente`.`venc` AS `venc`,`sis_cliente`.`celular` AS `celular`,`sis_cliente`.`conta` AS `conta`,`sis_cliente`.`plano` AS `plano`,`sis_cliente`.`numero` AS `numero`,`sis_cliente`.`desconto` AS `desconto`,`sis_cliente`.`acrescimo` AS `acrescimo`,`sis_cliente`.`ramal` AS `ramal`,`sis_cliente`.`cli_ativado` AS `cli_ativado`,`sis_cliente`.`bloqueado` AS `bloqueado`,`sis_cliente`.`grupo` AS `grupo`,`sis_cliente`.`codigo` AS `codigo`,if(`sis_lanc`.`tipo` = 'mensalidade',`sis_lanc`.`valor` - `sis_cliente`.`desconto` + `sis_cliente`.`acrescimo`,`sis_lanc`.`valor`) AS `calculado`,`sis_cliente`.`tags` AS `tags`,`sis_cliente`.`comodato` AS `comodato`,`sis_cliente`.`dias_corte` AS `dias_corte`,`sis_cliente`.`geranfe` AS `geranfe`,`sis_cliente`.`mesref` AS `mesref`,`sis_cliente`.`opcelular` AS `opcelular`,`sis_cliente`.`uuid_cliente` AS `uuid_cliente`,`sis_cliente`.`tipo_cob` AS `tipo_cob`,`sis_cliente`.`tit_abertos` AS `tit_abertos`,`sis_cliente`.`parc_abertas` AS `parc_abertas`,`sis_cliente`.`observacao` AS `observacao`,replace(`sis_lanc`.`valor`,',','.') AS `valor`,replace(`sis_lanc`.`valorpag`,',','.') AS `valorpag`,`sis_lanc`.`valorger` AS `valorger`,`sis_lanc`.`formapag` AS `formapag`,`sis_lanc`.`linhadig` AS `linhadig`,`sis_lanc`.`datavenc` AS `datavenc`,`sis_lanc`.`referencia` AS `referencia`,`sis_lanc`.`nossonum` AS `nossonum`,`sis_lanc`.`datapag` AS `datapag`,`sis_lanc`.`recibo` AS `recibo`,`sis_lanc`.`status` AS `status`,`sis_lanc`.`tipo` AS `tipo`,`sis_lanc`.`processamento` AS `processamento`,`sis_lanc`.`usergerou` AS `usergerou`,`sis_lanc`.`coletor` AS `coletor`,`sis_lanc`.`tipocob` AS `tipocob`,`sis_lanc`.`codigo_carne` AS `codigo_carne`,`sis_lanc`.`fcartaobandeira` AS `fcartaobandeira`,`sis_lanc`.`fcartaonumero` AS `fcartaonumero`,`sis_lanc`.`fchequenumero` AS `fchequenumero`,`sis_lanc`.`fchequebanco` AS `fchequebanco`,`sis_lanc`.`fchequeagcc` AS `fchequeagcc`,`sis_lanc`.`obs` AS `descricao`,`sis_lanc`.`numconta` AS `numconta`,`sis_lanc`.`num_retornos` AS `num_retornos`,`sis_lanc`.`deltitulo` AS `deltitulo`,`sis_lanc`.`tarifa_paga` AS `tarifa_paga`,`sis_lanc`.`chave_gnet2` AS `chave_gnet2`,`sis_lanc`.`chave_juno` AS `chave_juno`,`sis_lanc`.`id` AS `titulo`,`sis_lanc`.`uuid_lanc` AS `uuid_lanc`,`sis_lanc`.`imp` AS `imp`,`sis_lanc`.`gerourem` AS `gerourem`,`sis_lanc`.`oco01` AS `oco01`,`sis_lanc`.`oco02` AS `oco02`,`sis_lanc`.`oco06` AS `oco06` from (`sis_cliente` join `sis_lanc`) where `sis_cliente`.`login` = `sis_lanc`.`login` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vtab_usuarios`
--

/*!50001 DROP TABLE IF EXISTS `vtab_usuarios`*/;
/*!50001 DROP VIEW IF EXISTS `vtab_usuarios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW `vtab_usuarios` AS select `sis_cliente`.`login` AS `usuario` from `sis_cliente` union select `sis_adicional`.`username` AS `usuario` from `sis_adicional` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-20 10:36:32

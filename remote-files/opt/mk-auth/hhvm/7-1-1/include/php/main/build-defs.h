/*                                                                -*- C -*-
   +----------------------------------------------------------------------+
   | PHP Version 7                                                        |
   +----------------------------------------------------------------------+
   | Copyright (c) 1997-2017 The PHP Group                                |
   +----------------------------------------------------------------------+
   | This source file is subject to version 3.01 of the PHP license,      |
   | that is bundled with this package in the file LICENSE, and is        |
   | available through the world-wide-web at the following url:           |
   | http://www.php.net/license/3_01.txt                                  |
   | If you did not receive a copy of the PHP license and are unable to   |
   | obtain it through the world-wide-web, please send a note to          |
   | license@php.net so we can mail you a copy immediately.               |
   +----------------------------------------------------------------------+
   | Author: Stig Sæther Bakken <ssb@php.net>                             |
   +----------------------------------------------------------------------+
*/

/* $Id$ */

#define CONFIGURE_COMMAND " './configure'  '--prefix=/opt/mk-auth/hhvm/7-1-1' '--with-apxs2=/usr/bin/apxs2' '--with-config-file-path=/opt/mk-auth/hhvm/7-1-1/etc' '--with-pear' '--with-gd' '--enable-gd-native-ttf' '--with-jpeg-dir' '--with-png-dir' '--with-xpm-dir' '--with-freetype-dir' '--with-mhash' '--with-mysql-sock=/var/run/mysqld/mysqld.sock' '--with-mysqli=mysqlnd' '--with-pdo-mysql=mysqlnd' '--with-bz2' '--with-xmlrpc' '--with-gettext' '--with-curl' '--with-openssl' '--with-zlib' '--enable-cli' '--enable-inline-optimization' '--enable-exif' '--enable-wddx' '--enable-zip' '--enable-bcmath' '--enable-calendar' '--enable-mbstring=all' '--enable-soap' '--enable-sockets' '--enable-shmop' '--enable-dba' '--enable-sysvsem' '--enable-sysvshm' '--enable-phar'"
#define PHP_ADA_INCLUDE		""
#define PHP_ADA_LFLAGS		""
#define PHP_ADA_LIBS		""
#define PHP_APACHE_INCLUDE	""
#define PHP_APACHE_TARGET	""
#define PHP_FHTTPD_INCLUDE      ""
#define PHP_FHTTPD_LIB          ""
#define PHP_FHTTPD_TARGET       ""
#define PHP_CFLAGS		"$(CFLAGS_CLEAN) "
#define PHP_DBASE_LIB		""
#define PHP_BUILD_DEBUG		""
#define PHP_GDBM_INCLUDE	""
#define PHP_IBASE_INCLUDE	""
#define PHP_IBASE_LFLAGS	""
#define PHP_IBASE_LIBS		""
#define PHP_IFX_INCLUDE		""
#define PHP_IFX_LFLAGS		""
#define PHP_IFX_LIBS		""
#define PHP_INSTALL_IT		"$(mkinstalldirs) '$(INSTALL_ROOT)/usr/lib/apache2/modules' &&                 $(mkinstalldirs) '$(INSTALL_ROOT)/etc/apache2' &&                  /usr/bin/apxs2 -S LIBEXECDIR='$(INSTALL_ROOT)/usr/lib/apache2/modules'                        -S SYSCONFDIR='$(INSTALL_ROOT)/etc/apache2'                        -i -a -n php7 libphp7.la"
#define PHP_IODBC_INCLUDE	""
#define PHP_IODBC_LFLAGS	""
#define PHP_IODBC_LIBS		""
#define PHP_MSQL_INCLUDE	""
#define PHP_MSQL_LFLAGS		""
#define PHP_MSQL_LIBS		""
#define PHP_MYSQL_INCLUDE	"@MYSQL_INCLUDE@"
#define PHP_MYSQL_LIBS		"@MYSQL_LIBS@"
#define PHP_MYSQL_TYPE		"@MYSQL_MODULE_TYPE@"
#define PHP_ODBC_INCLUDE	""
#define PHP_ODBC_LFLAGS		""
#define PHP_ODBC_LIBS		""
#define PHP_ODBC_TYPE		""
#define PHP_OCI8_SHARED_LIBADD 	""
#define PHP_OCI8_DIR			""
#define PHP_OCI8_ORACLE_VERSION		""
#define PHP_ORACLE_SHARED_LIBADD 	"@ORACLE_SHARED_LIBADD@"
#define PHP_ORACLE_DIR				"@ORACLE_DIR@"
#define PHP_ORACLE_VERSION			"@ORACLE_VERSION@"
#define PHP_PGSQL_INCLUDE	""
#define PHP_PGSQL_LFLAGS	""
#define PHP_PGSQL_LIBS		""
#define PHP_PROG_SENDMAIL	"/usr/sbin/sendmail"
#define PHP_SOLID_INCLUDE	""
#define PHP_SOLID_LIBS		""
#define PHP_EMPRESS_INCLUDE	""
#define PHP_EMPRESS_LIBS	""
#define PHP_SYBASE_INCLUDE	""
#define PHP_SYBASE_LFLAGS	""
#define PHP_SYBASE_LIBS		""
#define PHP_DBM_TYPE		""
#define PHP_DBM_LIB		""
#define PHP_LDAP_LFLAGS		""
#define PHP_LDAP_INCLUDE	""
#define PHP_LDAP_LIBS		""
#define PHP_BIRDSTEP_INCLUDE     ""
#define PHP_BIRDSTEP_LIBS        ""
#define PEAR_INSTALLDIR         "/opt/mk-auth/hhvm/7-1-1/lib/php"
#define PHP_INCLUDE_PATH	".:/opt/mk-auth/hhvm/7-1-1/lib/php"
#define PHP_EXTENSION_DIR       "/opt/mk-auth/hhvm/7-1-1/lib/php/extensions/no-debug-non-zts-20160303"
#define PHP_PREFIX              "/opt/mk-auth/hhvm/7-1-1"
#define PHP_BINDIR              "/opt/mk-auth/hhvm/7-1-1/bin"
#define PHP_SBINDIR             "/opt/mk-auth/hhvm/7-1-1/sbin"
#define PHP_MANDIR              "/opt/mk-auth/hhvm/7-1-1/php/man"
#define PHP_LIBDIR              "/opt/mk-auth/hhvm/7-1-1/lib/php"
#define PHP_DATADIR             "/opt/mk-auth/hhvm/7-1-1/share/php"
#define PHP_SYSCONFDIR          "/opt/mk-auth/hhvm/7-1-1/etc"
#define PHP_LOCALSTATEDIR       "/opt/mk-auth/hhvm/7-1-1/var"
#define PHP_CONFIG_FILE_PATH    "/opt/mk-auth/hhvm/7-1-1/etc"
#define PHP_CONFIG_FILE_SCAN_DIR    ""
#define PHP_SHLIB_SUFFIX        "so"

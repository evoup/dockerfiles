#!/bin/sh
/etc/init.d/php-fpm start
/etc/init.d/nginx start
/etc/init.d/inetutils-syslogd start
/bin/bash

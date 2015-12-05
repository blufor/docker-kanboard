#!/bin/bash


echo "<?php
# autogenerated on container startup
define('DEBUG', true);
define('ENABLE_URL_REWRITE', true);
define('MAIL_FROM', '${MAIL_FROM}');
define('MAIL_TRANSPORT', 'smtp');
define('MAIL_SMTP_HOSTNAME', '${SMTP_HOST}');
define('MAIL_SMTP_PORT', ${SMTP_PORT});
define('DB_DRIVER', 'postgres');
define('DB_USERNAME', '${POSTGRES_ENV_POSTGRES_USER}');
define('DB_PASSWORD', '${POSTGRES_ENV_POSTGRES_PASSWORD}');
define('DB_HOSTNAME', '${POSTGRES_PORT_5432_TCP_ADDR}');
define('DB_NAME', '${POSTGRES_ENV_POSTGRES_USER}');
define('DB_PORT', ${POSTGRES_PORT_5432_TCP_PORT});
define('GITLAB_AUTH', true);
define('GITLAB_CLIENT_ID', '${GITLAB_OAUTH_ID}');
define('GITLAB_CLIENT_SECRET', '${GITLAB_OAUTH_SECRET}');
define('GITLAB_OAUTH_AUTHORIZE_URL', '${GITLAB_OAUTH_ENDPOINT}/oauth/authorize');
define('GITLAB_OAUTH_TOKEN_URL', '${GITLAB_OAUTH_ENDPOINT}/oauth/token');
define('GITLAB_API_URL', '${GITLAB_OAUTH_ENDPOINT}/api/v3/');
define('HIDE_LOGIN_FORM', false);
?>" > /var/www/html/config.php

chown www-data:www-data /var/www/html/config.php

exec /usr/sbin/apache2ctl -D FOREGROUND

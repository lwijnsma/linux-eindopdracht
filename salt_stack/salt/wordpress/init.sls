packages:
  pkg.installed:
    - pkgs:
      - nginx
      - mariadb-server
      - php
      - php-fpm
      - php-mysql
      - python3-pip
      - default-libmysqlclient-dev

mysql_conectivity:
  file.managed:
    - name: /etc/salt/minion.d/00-mysql.conf
    - source: salt://wordpress/files/00-mysql.conf

mariadb_service:
  service.running:
    - name: mariadb
    - enable: true
    - reload: true

wordpress_db:
  pip.installed:
    - name: mysqlclient
  mysql_database.present:
    - name: {{pillar['mysql']['db']['db']}}
  mysql_user.present:
    - name: {{pillar['mysql']['db']['user']}}
    - password: {{pillar['mysql']['db']['password']}}
  mysql_grants.present:
    - database: {{pillar['mysql']['db']['db']}}.*
    - grant: ALL PRIVILEGES
    - user: {{pillar['mysql']['db']['user']}}
    - host: 'localhost'

extract_wordpress:
  cmd.run:
    - name: 'wget -q -O - https://nl.wordpress.org/latest-nl_NL.tar.gz | tar zxf -' 
    - cwd: /var/www
    - creates: /var/www/wordpress/index.php

apache2:
  service.dead:
    - enable: false

reload-nginx:
  service.running:
    - name: nginx
    - enable: true
    - reload: true
    - watch:
      - file: /etc/nginx/sites-enabled/*

/etc/nginx/sites-enabled/default:
  file.managed:
    - source: salt://wordpress/files/default

/var/www/wordpress/wp-config.php:
  file.managed:
    - template: jinja
    - source: salt://wordpress/files/wp-config.php

enable_nginx_monitoring:
  cmd.run: 
    - name: metricbeat modules enable nginx

enable_nginx_loging:
  cmd.run:
    - name: filebeat modules enable nginx mysql
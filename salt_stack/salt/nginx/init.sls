nginx:
  pkg.installed
php:
  pkg.installed
php-fpm:
  pkg.installed

nginx_monitoring:
  file.managed:
    - template: jinja
    - name: /etc/nginx/conf/nginx.conf
    - source: salt://nginx/files/conf/nginx.conf

nginx_service:
  service.running:
    - name: nginx
    - enable: true
    - reload: true
    - watch:
      - pkg: nginx
      - file: /var/www/html/

enable_nginx_monitoring:
  cmd.run: 
    - name: metricbeat modules enable nginx

enable_nginx_loging:
  cmd.run:
    - name: filebeat modules enable nginx

nginx_monitoring:
  file.managed:
    - template: jinja
    - name: /etc/metricbeat/modules.d/nginx.yml
    - source: salt://metricbeat/files/modules.d/nginx.yml

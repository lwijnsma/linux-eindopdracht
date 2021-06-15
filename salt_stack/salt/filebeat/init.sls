filebeat:
  pkg.installed:
    - require:  
      - pkgrepo: elastic-repo

configure_filebeat:
  file.managed:
    - template: jinja
    - name: /etc/filebeat/filebeat.yml
    - source: salt://filebeat/files/filebeat.yml

enable_filebeat_modules:
  cmd.run: 
    - name: filebeat modules enable system

setup_filebeat:
  cmd.run: 
    - name: filebeat setup

filebeat_service:
  service.running:
    - name: filebeat
    - enable: true
    - watch:
      - file: /etc/filebeat/filebeat.yml


    
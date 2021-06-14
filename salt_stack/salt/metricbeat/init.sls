metricbeat:
  pkg.installed:
    - require:  
      - pkgrepo: elastic-repo

configure_metricbeat:
  file.managed:
    - template: jinja
    - name: /etc/metricbeat/metricbeat.yml
    - source: salt://metricbeat/files/metricbeat.yml

enable_metricbeat_modules:
  cmd.run: 
    - name: metricbeat modules enable system

system_monitoring:
  file.managed:
    - template: jinja
    - name: /etc/metricbeat/modules.d/system.yml
    - source: salt://metricbeat/files/modules.d/system.yml
    
setup_metricbeat:
  cmd.run: 
    - name: metricbeat setup

metricbeat_service:
  service.running:
    - name: metricbeat
    - enable: true
    - watch:
      - pkg: metricbeat
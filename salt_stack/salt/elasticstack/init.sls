elasticsearch:
  pkg.installed:
    - require:  
      - pkgrepo: elastic-repo

configure_elasticsearch:
  file.managed:
    - template: jinja
    - name: /etc/elasticsearch/elasticsearch.yml
    - source: salt://elasticstack/files/elasticsearch.yml

enable_elasticsearch:
  service.running:
    - name: elasticsearch
    - enable: true
    - watch:
      - file: /etc/elasticsearch/elasticsearch.yml
    - require:
      - pkg: elasticsearch

kibana:
  pkg.installed:
    - require:  
      - pkgrepo: elastic-repo

configure_kibana:
  file.managed:
    - template: jinja
    - name: /etc/kibana/kibana.yml
    - source: salt://elasticstack/files/kibana.yml

enable_kibana:
  service.running:
    - name: kibana
    - enable: true
    - watch:
      - file: /etc/kibana/kibana.yml
    - require:
      - pkg: kibana

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
    - name: filebeat modules enable system elasticsearch kibana

setup_filebeat:
  cmd.run: 
    - name: filebeat setup

filebeat_service:
  service.running:
    - name: filebeat
    - enable: True
    - watch:
      - pkg: filebeat

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
    - name: metricbeat modules enable system elasticsearch kibana elasticsearch-xpack kibana-xpack

system_monitoring:
  file.managed:
    - template: jinja
    - name: /etc/metricbeat/modules.d/system.yml
    - source: salt://metricbeat/files/modules.d/system.yml

kibana_monitoring:
  file.managed:
    - template: jinja
    - name: /etc/metricbeat/modules.d/kibana.yml
    - source: salt://metricbeat/files/modules.d/kibana.yml

kibana-xpack_monitoring:
  file.managed:
    - template: jinja
    - name: /etc/metricbeat/modules.d/kibana-xpack.yml
    - source: salt://metricbeat/files/modules.d/kibana-xpack.yml

elasticsearch_monitoring:
  file.managed:
    - template: jinja
    - name: /etc/metricbeat/modules.d/elasticsearch.yml
    - source: salt://metricbeat/files/modules.d/elasticsearch.yml

elasticsearch-xpack_monitoring:
  file.managed:
    - template: jinja
    - name: /etc/metricbeat/modules.d/elasticsearch-xpack.yml
    - source: salt://metricbeat/files/modules.d/elasticsearch-xpack.yml
    
setup_metricbeat:
  cmd.run: 
    - name: metricbeat setup

metricbeat_service:
  service.running:
    - name: metricbeat
    - enable: True
    - watch:
      - pkg: metricbeat

replicashards:
  cmd.run:
    - name: >-
        curl -X PUT -H "Content-Type: application/json" -d '{ "number_of_replicas": 0 }' http://192.168.7.55:9200/_settings

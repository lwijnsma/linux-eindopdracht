base:
  '*':
    - base
  'salt-master':
    - elasticstack  
  'minion*':
    - metricbeat
    - filebeat
    - docker
    - elasticrepo
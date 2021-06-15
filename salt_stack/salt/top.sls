base:
  '*':
    - base
    - elasticrepo
  'salt-master':
    - elasticstack
    - master
  'minion*':
    - filebeat
    - metricbeat
  'minion1':
    - docker
  'minion2':
    - wordpress
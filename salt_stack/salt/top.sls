base:
  '*':
    - base
    - metricbeat
    - filebeat
    - elasticrepo
  'salt-master':
    - elasticstack
    - master
  'minion1':
    - docker
  'minion2':
    - wordpress
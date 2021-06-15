docker-repo:
  pkgrepo.managed:
    - humanname: docker-repo
    - name: deb [arch=amd64] https://download.docker.com/linux/ubuntu   focal stable
    - file: /etc/apt/sources.list.d/docker.list          
    - gpgcheck: 1
    - key_url: https://download.docker.com/linux/ubuntu/gpg

docker:
  pkg.removed
docker-engine:
  pkg.removed
"docker.io":
  pkg.removed
containerd:
  pkg.removed
runc:
  pkg.removed
  
docker-ce:
  pkg.installed:
    - require:  
      - pkgrepo: docker-repo

docker-ce-cli:
  pkg.installed:
    - require:  
      - pkgrepo: docker-repo

"containerd.io":
  pkg.installed:
    - require:  
      - pkgrepo: docker-repo

enable_metricbeat_docker:
  cmd.run: 
    - name: metricbeat modules enable docker

docker_monitoring:
  file.managed:
    - name: /etc/metricbeat/modules.d/docker.yml
    - source: salt://metricbeat/files/modules.d/docker.yml
    
setup_docker_monitoring:
  cmd.run: 
    - name: metricbeat setup

whoami:
  cmd.run:
    - name: >- 
        docker run -d -p 80:80 containous/whoami
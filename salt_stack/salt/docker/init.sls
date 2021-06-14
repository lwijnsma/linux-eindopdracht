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


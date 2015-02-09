---
 # add the nginx repository to yum repo
    pkgrepo.managed:
      - humanname: nginx
      - baseurl: baseurl=http://nginx.org/packages/OS/OSRELEASE/$basearch/
      - gpgcheck: 0
      - enabled: 1


      # install nginx
    nginx:
      pkg:
        - name: nginx
      service.running:
        - enabled: True
        - reload: True
        - watch:
          - pkg: nginx

    php:
      pkg:
          - name: epel-release
          - name: php-fpm
          - name: php
          - name: php-mysql
      service.running:
          - enabled: True
          - reload: True
          - watch:
            - pkg: php-fpm


        

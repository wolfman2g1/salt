---
 # add the nginx repository to yum repo
 {% if grains['OS'] == 'redhat'%}
    pkgrepo.managed:
      - humanname: nginx
      - baseurl: baseurl=http://nginx.org/packages/OS/OSRELEASE/$basearch/
      - gpgcheck: 0
      - enabled: 1

      {%endif%}
      # install nginx
    nginx:
      pkg:
        {%if grains['Os'] == 'redhat'%}
        - name: nginx
        {%elif grains['OS'] == "ubuntu"%}
        - name: nginx
        {%endif%}

    php:
      pkg:
          {%if grains['Os'] == 'redhat'%}
          - name: epel-release
          - name: php-fpm
          - name: php
          - name: php-mysql
      service.running:


          {%elif grains['OS'] == "ubuntu"%}
          - name: php5-fpm
          - name: php5-mysql
          {%endif%}

    nginx:
      service.running:
        - enabled: True
        - reload: True
        - watch:
          - pkg: nginx
    {% if grains['OS'] == 'redhat' %}
    php-fpm:
      service.running:
        - enabled: True
        - reload: True
        - watch:
          - pkg: php-fpm
    {%elif grains['OS'] == 'ubuntu'}
    php5-fpm:
      service.running:
        - enabled: True
        - reload: True
        - watch:
          - pkg: php5-fpm

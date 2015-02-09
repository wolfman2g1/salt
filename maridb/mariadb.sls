---
# install maridb
   mariadb:
     {%if grains['OS'] == "ubuntu"%}
     /etc/apt/sources.list.d/mariadb.list:
         file:
           - append:
             - text:
               - deb http://mirror.pw/mariadb/repo/10.0/ubuntu utopic main
               - deb-src http://mirror.pw/mariadb/repo/10.0/ubuntu utopic main
         {%endif%}
     pkg:
       - installed
       {%if grains['Os'] == 'redhat'%}
       - name: mariadb-server
       {%elif grains['OS'] == "ubuntu"%}
       - name: mariadb-server
       {%endif%}

      mariadb-server:
        service.running:
          - enabled: True
          - reload: True
          - watch:
            - pkg: mariadb-server

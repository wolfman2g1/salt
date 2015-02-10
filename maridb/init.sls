---
# install maridb
   mariadb:
     pkg:
       - installed
       - name: mariadb-server
     service.running:
       - enabled: True
       - reload: True
       - watch:
         - pkg: mariadb-server

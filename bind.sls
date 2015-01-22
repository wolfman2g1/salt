---
  # install bind dns on a server

  bind9:
    pkg:
      - installed
    service:
      -running: []
      - enable: True

      # set the named.conf
  /etc/bind/named.conf:
    file:
      - managed
      - source: salt://named.conf
      - user: root
      - group: root
      - mode: 644
      - require:
        -pkg: bind9
  # set named.conf.options
 /etc/bind/named.conf.options:
   file:
     - managed
     - source: salt://named.conf.options
     - user: root
     - group: root
     - mode: 644
     - require:
       - pkg: bind9

 /etc/bind/db.ny.int.meteora.co:
   file:
     - managed
     - source: salt://db.ny.int.meteora.co
     - user: root
     - group: root
     - mode: 644
     - require:
       - pkg: bind9



# create files
 /etc/bind/db.10:
  - file:
    - managed
    - touch
 /etc/bind/db.4:
  - file:
    - managed
    - touch
 /etc/bind/db.root:
   - file:
     - managed
     - touch

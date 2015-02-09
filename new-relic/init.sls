---
  pkgrepo.managed:
    - humanname: newrelic
    - baseurl: http://yum.newrelic.com/pub/newrelic/el5/$basearch
    - gpgcheck: 0
    - enabled: 1
 newrelic:
   pkg:
     - installed
     - name: newrelic-sysmond
   service.running:
     - enabled: True
     - reload: True
     - watch:
       - pkg: newrelic-sysmond

beaver:
  format: json
  transport: tcp
  logstash_version: 1
  tcp_host: 192.168.35.30
  tcp_port: 5959
  tcp_ssl_enabled: True

  files:
    /var/log/syslog:
      type: syslog

    /var/log/auth.log:
      type: syslog
      tags:
        - auth

    /var/log/kern.log:
      type: syslog
      tags:
        - kern

    /var/log/dpkg.log:
      type: dpkg

    /var/log/salt/minion:
      type: salt
      tags:
        - minion

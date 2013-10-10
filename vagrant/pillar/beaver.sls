beaver:
  format: json
  transport: stdout

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

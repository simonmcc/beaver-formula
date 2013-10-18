# Copyright 2013 Hewlett-Packard Development Company, L.P.
#
#    Licensed under the Apache License, Version 2.0 (the "License"); you may
#    not use this file except in compliance with the License. You may obtain
#    a copy of the License at
#
#         http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
#    WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
#    License for the specific language governing permissions and limitations
#    under the License.
#

# We should have packages fron http://ppa.launchpad.net/kiall/beaver/
# in an internal apt repo:
# beaver_30-3_all.deb
# python-beaver_30-3_all.deb
# python-conf-d_0.0.3-1_all.deb
# python-glob2_0.3-1_all.deb

beaver:
  pkg:
    - latest
  service:
    - running
    - watch:
      - file: /etc/beaver.conf
    - require:
      - pkg: beaver
      - file: /etc/beaver.conf
      - file: /var/cache/beaver

/etc/beaver.conf:
  file:
    - managed
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - source: salt://beaver/templates/beaver.conf.jinja
    - require:
      - pkg: beaver

/var/cache/beaver:
  file:
    - directory
    - user: root
    - group: root
    - mode: 750
    - makedirs: True

{% if salt['pillar.get']('beaver:transport', 'none') == 'redis' %}
beaver-redis:
  pkg:
    - installed
    - name: python-redis
    - require_in:
      - pkg: beaver
    - watch_in:
      - service: beaver
{% endif %}

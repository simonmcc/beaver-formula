/tmp/grains-test:
  file:
    - managed
    - template: jinja
    - mode: 644
    - source: salt://beaver/templates/grains-test.jinja

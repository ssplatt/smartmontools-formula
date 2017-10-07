# vim: ft=sls
# How to configure smartmontools
{%- from "smartmontools/map.jinja" import smartmontools with context %}

{%if smartmontools.default is defined %}
smartmontools_default_config:
  file.managed:
    - name: '/etc/default/smartmontools'
    - source: salt://smartmontools/files/default_smartmontools.j2
    - user: root
    - group : root
    - mode: 0644
    - template: jinja
{% endif %}

smartmontools_smartd_config:
  file.managed:
    - name: '/etc/smartd.conf'
    - source: salt://smartmontools/files/smartd.conf.j2
    - user: root
    - group : root
    - mode: 0644
    - template: jinja

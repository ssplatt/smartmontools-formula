# vim: ft=sls
# Init smartmontools
{%- from "smartmontools/map.jinja" import smartmontools with context %}
{# Below is an example of having a toggle for the state #}

{% if smartmontools.enabled %}
include:
  - smartmontools.install
  - smartmontools.config
  - smartmontools.service
{% else %}
'smartmontools-formula disabled':
  test.succeed_without_changes
{% endif %}


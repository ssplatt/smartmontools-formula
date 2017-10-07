# vim: ft=sls
# Manage service for service smartmontools
{%- from "smartmontools/map.jinja" import smartmontools with context %}

smartmontools_service:
 service.{{ smartmontools.service.state }}:
   - name: {{ smartmontools.service.name }}
   - enable: {{ smartmontools.service.enable }}
   - watch:
     {% if smartmontools.default is defined %}
       - file: smartmontools_default_config
     {% endif %}
       - file: smartmontools_smartd_config

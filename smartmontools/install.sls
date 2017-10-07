# vim: ft=sls
# How to install smartmontools
{%- from "smartmontools/map.jinja" import smartmontools with context %}

smartmontools_pkg:
  pkg.installed:
    - name: {{ smartmontools.pkg }}

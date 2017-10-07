# vim: ft=yaml
# Custom Pillar Data for smartmontools

smartmontools:
  enabled: true
  service:
    name: smartd
    state: running
    enable: true
  default:
    start_smartd: "yes"
  config:
    devices:
      '/dev/sda': '-a -o on -S on -s (S/../.././02|L/../../6/03)'
      '/dev/sdb': '-a -I 194 -W 4,45,55 -R 5 -m admin@example.com'

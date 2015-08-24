# /srv/salt/inotify.sls
include:
  - pip

# Install inotify to enable the beacon
install_python_inotify:
  pip.installed:
    - name: pyinotify
    - upgrade: True
    - require:
      - sls: pip

/beacon_demo/watch_folder/:
  file.directory:
    - user: root
    - group: users
    - mode: 777
    - makedirs: True

restart_minion:
  cmd.run:
    - name: |
        nohup /bin/sh -c 'sleep 10 && salt-call --local service.restart salt-minion'
    - python_shell: True
    - order: last
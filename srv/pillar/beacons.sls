# /srv/pillar/beacons.sls

beacons:
  inotify:
    /beacon_demo/watch_folder:
      mask:
        - access
        - attrib
        - close_nowrite
        - close_write
        - create
        - delete
        - delete_self
        - modify
        - moved_from
        - moved_to
        - move_self
        - open
      recurse: True
      auto_add: True
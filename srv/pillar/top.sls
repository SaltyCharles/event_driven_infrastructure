# /srv/pillar/top.sls

# for additional methods of targeting, see 
# http://docs.saltstack.com/en/latest/topics/targeting/compound.html


base:
  '*':          # Target all minions
    - beacons
  '*master':    # Only target the master (by name)
    - slack
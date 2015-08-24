# /srv/reactor/test_reactor.sls

bark_to_slack:
  runner.state.orchestrate:
    - mods: orch.slack_barker
    - pillar:
        beacon_data: {{ data | json() }}

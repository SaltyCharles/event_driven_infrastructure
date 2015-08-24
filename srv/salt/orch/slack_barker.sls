# /srv/salt/orch/slack_barker.sls

{% set bdata = salt['pillar.get']('beacon_data') %}
# {% if 'IN_DELETE' in bdata.data.change %}
bark_to_slack:
  slack.post_message:
  - channel: "general"
  - from_name: "Your Friendly Salt Minion {{ bdata.data.id }}"
  - api_key: {{ pillar['api_key'] }}
  - message: |
      Hello sir, from minion {{ bdata.data.id }}.
      Just thought you might want to know that this happened:
      Changed: {{ bdata.data.change }}
      File: {{ bdata.data.path }}
# {% endif %}

{# Example Beacon event data

salt/beacon/minion01/inotify//beacon_demo/watch_folder  {
    "_stamp": "2015-08-20T21:48:48.294028",
    "data": {
        "change": "IN_OPEN",
        "id": "minion01",
        "path": "/beacon_demo/watch_folder/test1"
    },
    "tag": "salt/beacon/minion01/inotify//beacon_demo/watch_folder"
}
#}

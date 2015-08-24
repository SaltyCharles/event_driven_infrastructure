====
Managing an Event Driven Infrastructure with SaltStack - Silicon Valley Meetup 8/19/2015 
====


.. note::

    See the SaltStack `Getting Started Guide for fundamental concepts and getting started
    <http://docs.saltstack.com/en/getstarted/fundamentals/index.html>`_.

Getting Started:
================

Clone this repo then run 'vagrant up':
    salt minion01 state.highstate (from your master if it did not run during provisioning)
    salt-run state.event pretty=True (will show your events)
    salt minion01 file.touch /beacon_demo/watch_folder/test1 (will kick off the demo)


Files within this repo
======================

.. contents::
    :local:

``etc.master.d.reactor.conf``
-----------------------------

Sets up the reactor on the master

``etc.master.d.roots.conf``
---------------------------

Sets up the file roots backend on the master

``etc.master.d.security.conf``
------------------------------

Enables the master to auto accept minion keys (set to true for this demonstration)

``srv.pillar.beacons``
----------------------

Creates the beacon to be used within pillar for your minions

``srv.pillar.slack``
--------------------

Replace the slack api_key with one of your own:
.. code-block:: yaml
    api_key: xoxp-xxxxxxxxxx-xxxxxxxxxx-xxxxxxxxxx-xxxxx

``srv.pillar.top``
------------------

This is used for targeting your pillar data to this minion and master

``srv.reactor.test_reactor``
----------------------------

Simple reactor to send beacon data to the slack responder (sent as pillar - 'beacon_data')

``srv.salt.orch.slack_barker``
------------------------------

State file used to customize the event response data and send to slack

``srv.salt.inotify``
--------------------

Validates pip is installed, installs python-pyinotify, create the watch folder on the minion, restart minion deamon to allow for immediate testing/validation

``srv.salt.pip``
----------------

Installs pip

``srv.salt.top``
----------------

Ensures inotify is installed on the minion during highstate run during provisioning

``minion.conf``
================

Simple settings to apply to the minion during provisioning

``Vagrantfile``
===============

Executing the provided `Vagrantfile <http://www.vagrantup.com/>`_  will create a Ubuntu 14.04 VM, add the default Saltstack Repository and install the current stable version for the master and will also create a Ubuntu 14.04 VM, install Salt, run a highstate and restart the minion daemon.

The folders inside the VM will be set up in a way that enables you to simply execute 'sudo salt "*" state.highstate' to apply the salt formula to the VM, using the pillar.example config. You can check /etc/salt/ for results.

Remember, you will have to run ``state.highstate`` or ``state.sls salt.(master|minion|cloud)`` manually.
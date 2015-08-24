# -*- mode: ruby -*-
# vi: set ft=ruby :
# SaltStack Meetup 8/19/2015 - Silicon Valley
# Predictive Management of an Event Driven Infrastructure


# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.define "master" do |master|
    master.vm.provider "virtualbox" do |v|
      v.memory = 1024
    end
    master.vm.box = "ubuntu/trusty64"
    master.vm.host_name = "salt-master"
    master.vm.network :private_network, ip: "192.168.22.10"
    master.vm.network "public_network", :bridge => 'en0: Wi-Fi (Airport)'
    master.vm.network "forwarded_port", guest: 4505, host: 4505
    master.vm.network "forwarded_port", guest: 4506, host: 4506
    master.vm.synced_folder "./etc/", "/etc/salt/"
    master.vm.synced_folder "./srv/", "/srv/"
    master.vm.provision :salt do |salt|
      salt.install_master = true
      salt.minion_config = "./minion.conf"
    end
  end

  config.vm.define "minion01" do |minion01|
    minion01.vm.box = "ubuntu/trusty64"
    minion01.vm.host_name = "minion01"
    minion01.vm.network :private_network, ip: "192.168.22.11"
    minion01.vm.provision :salt do |salt|
      salt.minion_config = "./minion.conf"
      salt.run_highstate = true
    end
  end
end
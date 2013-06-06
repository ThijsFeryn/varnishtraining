# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "varnishtraining"
  config.vm.box_url = "http://download.feryn.eu/varnishtraining.box"
  config.vm.hostname = "varnishtraining"

  config.vm.network :private_network, ip: "10.10.10.6"

  config.vm.provider :virtualbox do |v|
    v.customize ["modifyvm", :id, '--chipset', 'ich9'] # solves kernel panic issue on some host machines
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--memory", 512]
    v.customize ["modifyvm", :id, "--ioapic", "on"]
    #v.gui = true # turn gui on
  end

  #shared folders are slow even with nfs, warning nfs is not available on windows
  #config.vm.synced_folder "./", "/home/data", nfs: true, id: "vagrant-root"
  config.vm.synced_folder "./", "/home/data", id: "vagrant-root"
end


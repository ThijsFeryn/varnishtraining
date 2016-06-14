# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "deb/jessie-amd64"
  config.vm.hostname = "varnishtraining"

  config.vm.network :private_network, ip: "10.10.10.6"

  config.vm.provider :virtualbox do |v|
    v.customize ["modifyvm", :id, "--memory", 512]
  end
end


# -*- mode: ruby -*-
# vi: set ft=ruby :

# Unfortunately need to require a very recent version due to
# issues caused by default Vagrant box hosting moving to
# vagrantcloud.com
# See https://github.com/hashicorp/vagrant/issues/9442
Vagrant.require_version ">= 2.0.3"

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Set up the quickstart environment on 16.04 LTS Ubuntu
  config.vm.box = "ubuntu/xenial64"

  # Port forwarding
  config.vm.network "forwarded_port", guest: 3000, host: 3000
  config.vm.network "forwarded_port", guest: 4200, host: 4200
  config.vm.network "forwarded_port", guest: 8080, host: 8080

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # VirtualBox configuration
  config.vm.provider "virtualbox" do |vb|
    # Increase memory allocated to vm (for build tasks)
    vb.memory = 6192
  end

  # Install prereqs
  config.vm.provision "provision-root", type: "shell", path: "provision-root.sh"
  config.vm.provision "provision-user", type: "shell", path: "provision-user.sh", privileged: false

  # Install Hyperledger Composer
  config.vm.provision "install-composer", type: "shell", path: "install-composer.sh", privileged: false, args: ENV['COMPOSER_VERSION']
end

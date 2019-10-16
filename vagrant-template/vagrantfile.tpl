# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "Packer-Vagrant-CentOS-7-x86_64"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  config.vm.box_check_update = false

  config.vm.boot_timeout = 600

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
     # Display the VirtualBox GUI when booting the machine
     # vb.gui = true
     # Customize Name of VM:
     # vb.name = "Packer-Vagrant-CentOS-7-x86_64"
     # Customize the amount of memory on the VM:
     # vb.memory = "4096"
     # Customize video memory
     # vb.customize ["modifyvm", :id, "--vram", "32"]
     # Enable 3D acceleration:
     # vb.customize ["modifyvm", :id, "--accelerate3d", "on"]
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
   config.vm.provision "shell", inline: <<-SHELL
    sudo yum -y update
   SHELL
  
  # Running Provisioners Always
   config.vm.provision "shell", run: "always" do |s|
    s.inline = "sudo yum-complete-transaction --cleanup-only"
    s.inline = "sudo yum -y update"
   end
end
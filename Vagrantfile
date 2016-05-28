# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  config.vm.hostname = "sh-106";

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  # config.vm.box = "ubuntu/xenial64"
  config.vm.box = "ubuntu/trusty64"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "192.168.56.106"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # config.winnfsd.uid = 1000
  # config.winnfsd.gid = 1000
  # config.winnfsd.logging = "on"

  # config.vm.synced_folder "c:\\Users\\Artur.Safin", "/mnt/nfs", id: "mounted-home"

    # :nfs => true,
    # :mount_options => ['rw,vers=3,tcp,noatime']
    # :linux__nfs_options => ['rw','tcp','vers=3','no_subtree_check','all_squash']

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    # vb.gui = true
  
    # Customize the amount of memory on the VM:
    vb.memory = "2048"
    vb.name = "psh"
    vb.cpus = 4
  end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  
  config.vm.provision "shell", path: "system.sh", name: "system", keep_color: true
  config.vm.provision "shell", path: "packages.sh", name: "packages", keep_color: true
  config.vm.provision "shell", path: "user.sh", name: "user", keep_color: true


  #     echo "artsafin:vagrant" | sudo chpasswd
  # sudo apt-get -y install fuse-convmvfs
  # sudo convmvfs /home/artsafin -o srcdir=/mnt/nfs/,icharset=CP1251,ocharset=UTF8,allow_other

  # config.ssh.username = 'artsafin'
  # config.ssh.password = 'vagrant'
  config.ssh.insert_key = 'false'
end

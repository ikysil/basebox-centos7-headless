# -*- mode: ruby -*-
# vi: set ft=ruby :

vm_id = "basebox-centos7-headless"
vm_hostname = "#{vm_id}"

VAGRANT_ROOT = File.dirname(File.expand_path(__FILE__))

unless Vagrant.has_plugin?("vagrant-cachier")
  raise "Please install vagrant-cachier with \nvagrant plugin install vagrant-cachier"
end

unless Vagrant.has_plugin?("vagrant-vbguest")
  raise "Please install vagrant-vbguest with \nvagrant plugin install vagrant-vbguest"
end

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "bento/centos-7.1"

  config.vm.hostname = vm_hostname

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
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
    # OPTIONAL: If you are using VirtualBox, you might want to use that to enable
    # NFS for shared folders. This is also very useful for vagrant-libvirt if you
    # want bi-directional sync
    # config.cache.synced_folder_opts = {
    #   type: :nfs,
    #   # The nolock option can be useful for an NFSv3 client that wants to avoid the
    #   # NLM sideband protocol. Without this option, apt-get might hang if it tries
    #   # to lock files needed for /var/cache/* operations. All of this can be avoided
    #   # by using NFSv4 everywhere. Please note that the tcp option is not the default.
    #   mount_options: ['rw', 'vers=3', 'tcp', 'nolock']
    # }
  end

  if Vagrant.has_plugin?("vagrant-vbguest")
    config.vbguest.auto_update = false
    config.vbguest.auto_reboot = false
    config.vbguest.no_remote = true
    config.vbguest.no_install = false
  end

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
    vb.gui = true
    vb.name = config.vm.hostname
    # Use VBoxManage to customize the VM. For example to change memory:
    vb.memory = 2048
    vb.cpus = 2
    vb.customize ["modifyvm", :id, "--ioapic", "on"]
    vb.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
    vb.customize ["modifyvm", :id, "--vram", "16"]
    vb.customize ["modifyvm", :id, "--accelerate3d", "on"]
    vb.customize ["modifyvm", :id, "--rtcuseutc", "on"]
  end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  config.vm.provision :shell, path: "shell/privileged.sh"
  config.vm.provision :shell, path: "shell/unprivileged.sh", privileged: false

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   sudo apt-get update
  #   sudo apt-get install -y apache2
  # SHELL
end

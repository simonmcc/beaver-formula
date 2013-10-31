Vagrant.configure("2") do |config|
  ## Choose your base box
  config.vm.box = "precise64"

  ## For masterless, mount your salt file root
  config.vm.synced_folder ".", "/srv/salt/"
  config.vm.synced_folder "vagrant/pillar", "/srv/pillar/"

  # add a private network interface, to make it easier to
  # plug vagrant instances from formula together (outside of
  # an integration setup)
  config.vm.network "private_network", ip: "192.168.35.20"

  ## Use all the defaults:
  config.vm.provision :salt do |salt|
    salt.verbose = true

    salt.minion_config = "vagrant/minion"
    salt.run_highstate = true
  end
end

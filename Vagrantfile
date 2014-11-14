# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. 
# Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Either use i386 or amd64 versions
  config.vm.box       = 'ubuntu/trusty32'

  config.vm.hostname  = 'vm'
  config.ssh.forward_agent = true

  config.vm.provision :shell, :path => "vagrant/bootstrap.sh"
  config.vm.provision :shell, :path => "vagrant/dev.sh", 
    :args => "#{ENV['user']}", privileged: false

  #config.vm.provision :shell, :path => "cleanup.sh"
end

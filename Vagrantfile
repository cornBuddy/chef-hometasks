Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  config.vm.provider :virtualbox do |vb|
    # enable promiscuous mode on the public network
    vb.customize ["modifyvm", :id, "--nicpromisc3", "allow-all"]
  end

  config.vm.define "web" do |web|
    web.vm.network "private_network", ip: "192.168.1.2"
    web.vm.network "forwarded_port", guest: 80, host: 8080
    web.vm.hostname = "web"
  end

  config.vm.define "jboss" do |jboss|
    jboss.vm.network "private_network", ip: "192.168.1.3"
    jboss.vm.hostname = "jboss"
  end
end

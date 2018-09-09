Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  config.vm.provider :virtualbox do |vb|
    # enable promiscuous mode on the public network
    vb.customize ["modifyvm", :id, "--nicpromisc3", "allow-all"]
  end

  config.vm.define "web" do |web|
    web.vm.network "private_network", ip: "192.168.1.2"
  end

  config.vm.define "app" do |app|
    app.vm.network "private_network", ip: "192.168.1.3"
  end

  config.vm.define "jboss" do |jboss|
    jboss.vm.network "private_network", ip: "192.168.1.4"
  end
end

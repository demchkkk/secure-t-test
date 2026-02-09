Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/jammy64"

  config.vm.define "control" do |c|
    c.vm.hostname = "control"
    c.vm.network "private_network", ip: "192.168.56.2"
    c.vm.provision "shell", inline: "apt-get update && apt-get install -y ansible"
  end

  config.vm.define "nginx" do |n|
    n.vm.hostname = "nginx"
    n.vm.network "private_network", ip: "192.168.56.10"
  end

  config.vm.define "backend" do |b|
    b.vm.hostname = "backend"
    b.vm.network "private_network", ip: "192.168.56.11"
  end

  config.vm.define "db" do |d|
    d.vm.hostname = "db"
    d.vm.network "private_network", ip: "192.168.56.12"
  end
end
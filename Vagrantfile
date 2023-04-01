Vagrant.configure("2") do |server|
    (1..2).each do |i|
        server.vm.define "node_#{i}" do |web|
            web.vm.box = "ubuntu/jammy64"
            web.vm.network "public_network", 
                bridge: "Realtek PCIe GbE Family Controller", 
                ip: "192.168.15.10#{i}"
            
            web.ssh.insert_key = false
        
            web.vm.provider "virtualbox" do |vb|  
                vb.memory = "2048"
                vb.cpus = 3
            end
        
            web.vm.provision "shell", path: "apache.sh"
            web.vm.provision "shell", inline: "echo \'<h1>node #{i}</h1>\' > /var/www/html/index.html" 
        end
    end
end


Vagrant.configure("2") do |gateway|
    gateway.vm.define "load_balancer" do |lb|
        lb.vm.box = "ubuntu/jammy64"
        lb.vm.network "public_network", 
            bridge: "Realtek PCIe GbE Family Controller", 
            ip: "192.168.15.100"

        lb.ssh.insert_key = false
    
        lb.vm.provider "virtualbox" do |vb|  
        vb.memory = "1024"
        end
    
        lb.vm.provision "shell", path: "apache.sh"
        lb.vm.provision "shell", path: "lb.sh"
        lb.vm.provision "shell", path: "mods_lb.sh"
    end
end
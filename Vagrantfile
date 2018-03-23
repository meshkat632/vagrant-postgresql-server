Vagrant.configure("2") do |config|

  config.vm.provider 'virtualbox' do |v|
    v.memory = 1536
    v.cpus = 1
  end


  devvm_disk = 'devvm.vdi'

  config.vm.define :devvm do |box|
      box.vm.box = "ubuntu/trusty64"
      #box.vm.network "public_network"      
      box.vm.network :private_network, ip: "192.168.1.46"
      box.vm.host_name = "devvm.muc.meshkat"
      box.vm.synced_folder "sharedFolder/", "/sharedFolder/"
      config.vm.provider 'virtualbox' do |v|
        v.memory = 3072
        v.cpus = 2
      end
      config.ssh.userName = "vagrant"
      config.ssh.password = "vagrant"
      config.ssh.insert_key = true

      config.vm.provision "bootstrap", type: "shell" do |s|
          s.inline = "echo hello"
      end

      config.vm.provision "file", source: ".curlrc", destination: "/tmp/.curlrc"
      config.vm.provision "file", source: ".wgetrc", destination: "/tmp/.wgetrc"
      config.vm.provision "file", source: "apt.conf", destination: "/tmp/apt.conf"
      config.vm.provision :shell, :path => "proxy.sh"      


      #config.vm.provision "file", source: "docker-gpg", destination: "/tmp/docker-gpg", run: "always"
      #config.vm.provision "file", source: "docker-config.json", destination: "/tmp/docker-config.json", run: "always"
      #config.vm.provision :shell, :path => "install-docker.sh", run: "always"


      config.vm.provision :shell, :path => "install-postgres.sh" , run: "always"
      #config.vm.provision :shell, :path => "wget-setup.sh" , run: "always"

    end
end
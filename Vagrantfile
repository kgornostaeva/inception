Vagrant.configure(2) do |config|

	config.vm.box_check_update = false
	config.vm.box = "hashicorp/bionic64"

	config.vm.network :forwarded_port, guest: 80, host: 80

	config.vm.provider "virtualbox" do |v|
		v.memory = 2048
		v.cpus = 2
	end
	config.vm.provision "shell", privileged: true, reboot: true, path: "./setup.sh"
end

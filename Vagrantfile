Vagrant.configure("2") do |config|
	config.vm.box = "ubuntu/xenial64"
	config.vm.define "nttv-buildroot"
	config.ssh.forward_agent = true

	config.vm.provider :virtualbox do |v, override|
		v.memory = 1024 * 8
		v.cpus = 6
		v.name = "xenial-buildroot"

		required_plugins = %w( vagrant-vbguest )
		required_plugins.each do |plugin|
			system "vagrant plugin install #{plugin}" unless Vagrant.has_plugin? plugin
		end
	end
	
	config.vm.provider :virtualbox do |v|
		v.customize ["modifyvm", :id, "--usb", "on"]
		v.customize ["modifyvm", :id, "--usbehci", "on"]
	end

	config.vm.provision 'shell', 
		privileged: true,
		inline: $script
end

$script = <<-SCRIPT

MARKER="/usr/local/vagrant_is_setup_marker"

if [ -f '${MARKER}' ]; then
	exit 0
fi

dpkg --add-architecture i386

# neovim installation
apt-get install -qy software-properties-common 
add-apt-repository ppa:neovim-ppa/stable

apt-get update

apt-get install -qy bc binutils build-essential bzip2 bzr \
	cmake cpio curl cvs g++ gcc git libncurses5-dev libncursesw5-dev \
	mercurial neovim python python-dev python3-dev \
	rsync silversearcher-ag subversion unzip vim wget

apt-get -qy autoremove
apt-get -qy clean

apt-get -qy upgrade

touch ${MARKER}

SCRIPT

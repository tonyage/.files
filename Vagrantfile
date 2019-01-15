Vagrant.configure("2") do |config|
	config.vm.box = "bento/ubuntu-16.04"
	config.vm.define "vagrant-linux"
		
	config.vm.provider :virtualbox do |v, override|
		v.memory = 1024 * 8
		v.cpus = 6
		v.name = "xenial"

		required_plugins = %w( vagrant-vbguest )
		required_plugins.each do |plugin|
			system "vagrant plugin install #{plugin}" unless Vagrant.has_plugin? plugin
		end
	end
	
	config.vm.provider "virtualbox" do |v|
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

ln -fs /usr/share/zoneinfo/America/Chicago /etc/localtime

# dotfile installation
git clone http://github.com/tonyage/.file.git /home/vagrant/.file

touch ${MARKER}

SCRIPT

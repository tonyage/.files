Vagrant.configure("2") do |config|
	config.vm.provider :virtualbox do |v, override|
		v.memory = 1024 * 8
		v.cpus = 6
		v.name = "bionic-vagrant"

		required_plugins = %w( vagrant-vbguest vagrant-disksize )
		_retry = false
		required_plugins.each do |plugin|
			unless Vagrant.has_plugin? plugin
				system "vagrant plugin install #{plugin}"
				_retry = true
			end
		end
		
	config.vm.box = "ubuntu/bionic64"
	config.vm.define "bionic"
	config.vm.synced_folder "~/Public", "/home/vagrant/Public"
	config.disksize.size = "75GB"
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

############################################################
#
# neovim installation
#
############################################################

apt-get install -qy software-properties-common
add-apt-repository ppa:neovim-ppa/stable

apt-get update

############################################################
#
# buildroot dependencies and general dev stuff
#
############################################################

apt-get install -qy bc binutils build-essential bzip2 bzr \
	cmake cpio curl cvs exuberant-ctags g++ gcc git libncurses5-dev libncursesw5-dev \
	mercurial neovim python python-dev python3-dev python-pip python3-pip \
	rsync silversearcher-ag subversion tree unzip vim wget

############################################################
#
# crosstool-ng dependencies
#
############################################################

apt-get install -qy autoconf bison flex texinfo gawk gcj-jdk \
	help2man libexpat1-dev libtool-bin

apt-get -qy autoremove
apt-get -qy clean

DEBIAN_FRONTEND= apt-get -qyo Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" upgrade

ln -fs /usr/share/zoneinfo/America/Chicago /etc/localtime

############################################################
#
# .file setup
#
############################################################

echo "POWERLEVEL9K_CUSTOM_OS_ICON="\"echo -n ''\'\\uf30c''\'\""
        \nPOWERLEVEL9K_CUSTOM_OS_ICON_FOREGROUND='069'
        \nPOWERLEVEL9K_CUSTOM_OS_ICON_BACKGROUND='231'
		\nPOWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(custom_os_icon root_indicator user dir_writable dir vcs)" > /home/vagrant/.zshrc_local

touch ${MARKER}

SCRIPT

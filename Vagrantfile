# -*- mode: ruby -*-
# vi: set ft=ruby :
$script = <<SCRIPT
set -e
set -x

sudo apt-get install \
  git-core -y \
  curl -y \
  software-properties-common -y \
  libpq-dev -y

gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
sudo apt-add-repository ppa:rael-gc/rvm -y
sudo apt-get update -y
curl -sSL https://get.rvm.io | bash
source /home/vagrant/.rvm/scripts/rvm


rvm install "ruby-2.3.1"
rvm use 2.3.1
sudo apt-get install nodejs -y
rvm gemset create flashcards
rvm gemset use flashcards

git clone https://github.com/dan-abramov/flashcards.git

sudo sh -c "echo 'deb http://apt.postgresql.org/pub/repos/apt/ 16.04-pgdg main' > /etc/apt/sources.list.d/pgdg.list"
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get install postgresql-contrib-9.5 -y
sudo sh -c "echo 'local all all trust\nhost all all 127.0.0.1/32 trust\nhost all all ::1/128 trust' > /etc/postgresql/9.5/main/pg_hba.conf "
sudo /etc/init.d/postgresql reload

cd flashcards
git init
rvm --ruby-version use 2.3.1@flashcards
gem install bundler
bundle

cp config/database.yml.travis config/database.yml
sudo sh -c "echo 'development:\n  adapter: postgresql\n  database: travis_ci_development\n  username: postgres\n\ntest:\n  adapter: postgresql\n  database: travis_ci_test\n  username: postgres' > config/database.yml"

rake db:create
rake db:migrate

SCRIPT

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "ubuntu/xenial64"
  config.vm.provision :shell, inline: $script, privileged: false

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  config.vm.network "forwarded_port", guest: 3000, host: 3000

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL
end

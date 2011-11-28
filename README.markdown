##Ubuntu 11.10 - Ruby on Rails setup
	sudo apt-get install git-core
	sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev
	sudo apt-get install mercurial
	hg clone https://vim.googlecode.com/hg/ ~/vim
	cd ~/vim/src
	./configure --enable-gui=gnome2 --with-features=huge --enable-rubyinterp
	make
	sudo make install
	# disable wifi-indicator blinking
	echo 'options iwlagn led_mode=1' | sudo tee -a /etc/modprobe.d/wlan.conf
	modprobe -r iwlagn && modprobe iwlagn
	# touchpad bug
	sudo apt-get install kde-config-touchpad
	synaptiks
	sudo apt-get install curl
	mkdir ~/bin
	sudo apt-get install aptitude
	sudo aptitude update
	sudo aptitude install build-essential
	bash < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer)
	sudo aptitude install build-essential openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-0 libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison subversion
	echo '[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"' >> ~/.bashrc
	source ~/.bashrc
	rvm install 1.9.2
	rvm use 1.9.2
	ruby -v
	rvm --default use 1.9.2
	rvm install 1.9.3
	gem install rails
	rails -v
	sudo apt-get install -y g++ libssl-dev apache2-utils curl git-core
	git clone git://github.com/joyent/node.git ~/node
	cd ~/node
	git checkout v0.4.11
	./configure
	make
	sudo make install
	node -v
	npm -v
	sudo npm install -g coffee-script
	coffee -v
	curl -sL https://github.com/djl/vcprompt/raw/master/bin/vcprompt > ~/bin/vcprompt
	chmod 755 ~/bin/vcprompt
	git clone git@github.com:JiriChara/dotfiles.git ~/bin/dotfiles
	cd ~/bin/dotfiles/
	rake install
	sudo apt-get install ncurses-term 
	sudo apt-get install zsh
	chsh -s /bin/zsh
	sudo apt-get install imagemagick
	sudo apt-get install redis-server

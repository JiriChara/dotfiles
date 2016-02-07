##Install required libraries
	sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev

##Install Mercurial
	sudo apt-get install mercurial

##Clone vim from repository
	hg clone https://vim.googlecode.com/hg/ ~/vim

##Configure vim installation
	cd ~/vim/src
	./configure --enable-gui=gnome2 --with-features=huge --enable-rubyinterp

##Install Vim
	make
	sudo make install

##My config files
	git clone git@github.com:JiriChara/vim-files.git ~/.vim

##Create symlinks
	ln -s ~/.vim/vimrc ~/.vimrc
	ln -s ~/.vim/gvimrc ~/.gvimrc

##Make folder for backup and temp files:
	mkdir ~/.vim/backup
	mkdir ~/.vim/tmp

##Required for Ack
	sudo apt-get install ack-grep
	sudo ln -s /usr/bin/ack-grep /usr/local/bin/ack

##Install CoffeeScript
	sudo apt-get install -y g++ libssl-dev apache2-utils curl git-core
	git clone git://github.com/joyent/node.git
	git checkout v0.4.11
	./configure
	make
	sudo make install
	node -v
	curl http://npmjs.org/install.sh | sudo sh
	npm -v
	sudo npm install -g coffee-script
	coffee -v

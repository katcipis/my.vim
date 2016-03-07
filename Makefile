NVIM_HOME=$(HOME)/.config/nvim
all: install-plugins

config-editor:
	sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
	sudo update-alternatives --config vi
	sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
	sudo update-alternatives --config vim
	sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
	sudo update-alternatives --config editor

bootstrap:
	sudo add-apt-repository ppa:neovim-ppa/unstable
	sudo apt-get update
	sudo apt-get install neovim
	sudo apt-get install python-dev python-pip python3.5-dev python3-pip python3.5-dev
	sudo pip3 install neovim

install: 
	echo "Copying vimrc"
	cp vimrc $(NVIM_HOME)/init.vim
	echo "Install ftplugin"
	cp -pr ./ftplugin  $(NVIM_HOME)

install-plugins: install
	echo "Installing vim-plug"
	curl -fLo $(HOME)/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	vim +PlugInstall

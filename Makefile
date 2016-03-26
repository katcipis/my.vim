NVIM_HOME=$(XDG_CONFIG_HOME)/nvim

all: install
	echo "Installing vim-plug"
	curl -fLo $(NVIM_HOME)/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	vim +PlugInstall
	vim +UpdateRemotePlugins
	vim +GoInstallBinaries

bootstrap:
	sudo pacman --noconfirm -S neovim

install: 
	echo "Copying vimrc"
	mkdir -p $(NVIM_HOME)
	cp vimrc $(NVIM_HOME)/init.vim
	echo "Install ftplugin"
	cp -pr ./ftplugin  $(NVIM_HOME)

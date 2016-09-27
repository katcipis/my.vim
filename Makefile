NVIM_HOME=$(HOME)/.config/nvim

all: uninstall install
	echo "Installing vim-plug"
	curl -fLo $(NVIM_HOME)/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	nvim +PlugInstall
	nvim +UpdateRemotePlugins
	nvim +GoInstallBinaries

bootstrap:
	sudo pacman --noconfirm -S neovim python-neovim ctags
	sudo ln -s /usr/bin/nvim /usr/bin/vi
	sudo ln -s /usr/bin/nvim /usr/bin/vim

install: 
	echo "Copying vimrc"
	mkdir -p $(NVIM_HOME)
	cp vimrc $(NVIM_HOME)/init.vim
	echo "Install ftplugin"
	cp -pr ./ftplugin  $(NVIM_HOME)

uninstall:
	rm -rf $(NVIM_HOME)

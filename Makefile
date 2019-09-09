NVIM_HOME=$(HOME)/.config/nvim
NVIM_SPELL=$(NVIM_HOME)/spell

all: uninstall install
	echo "Installing vim-plug"
	curl -fLo $(NVIM_HOME)/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	nvim +PlugInstall
	nvim +UpdateRemotePlugins
	nvim +GoInstallBinaries

bootstrap:
	sudo pacman --noconfirm -S neovim python-neovim ctags

install: 
	echo "Copying vimrc"
	mkdir -p $(NVIM_HOME)
	cp vimrc $(NVIM_HOME)/init.vim
	echo "Install ftplugin"
	cp -pr ./ftplugin  $(NVIM_HOME)
	mkdir -p $(NVIM_SPELL)
	curl "http://ftp.vim.org/pub/vim/runtime/spell/en.utf-8.spl" -o $(NVIM_SPELL)/en.utf-8.spl

uninstall:
	rm -rf $(NVIM_HOME)

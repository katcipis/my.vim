VIMHOME=$(HOME)/.vim
VIMRC=$(HOME)/.vimrc
BUNDLEDIR=$(VIMHOME)/bundle

all: install

bootstrap:
	pip3 install jedi
	mkdir -p $(BUNDLEDIR)
	git clone https://github.com/VundleVim/Vundle.vim.git $(BUNDLEDIR)/Vundle.vim

install:
	@echo "Copying vimrc"
	mkdir -p $(VIMHOME)
	cp vimrc $(VIMRC)
	@echo "Install ftplugin"
	cp -pr ./ftplugin  $(VIMHOME)
	@echo "Install plugins"
	vim +PluginInstall +qall

uninstall:
	rm -rf $(VIMHOME)
	rm -rf $(VIMRC)

VIMHOME=$(HOME)/.vim
VIMRC=$(HOME)/.vimrc

all: install

install:
	@echo "Copying vimrc"
	mkdir -p $(VIMHOME)
	cp vimrc $(VIMRC)
	@echo "Install ftplugin"
	cp -pr ./ftplugin  $(VIMHOME)
	@echo "Install plugins"
	#TODO

uninstall:
	rm -rf $(VIMHOME)
	rm -rf $(VIMRC)

VIMHOME=$(HOME)/.vim
VIMRC=$(HOME)/.vimrc

all: install

.PHONY: install
install:
	@echo "Copying vimrc"
	mkdir -p $(VIMHOME)
	cp vimrc $(VIMRC)
	@echo "Install ftplugin"
	cp -pr ./ftplugin  $(VIMHOME)
	@echo "Install plugins"
	#TODO

.PHONY: uninstall
uninstall:
	rm -rf $(VIMHOME)
	rm -rf $(VIMRC)

.PHONY: vendor
vendor:
	@./tools/vendor

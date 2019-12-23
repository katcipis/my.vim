VIMHOME=$(HOME)/.vim
VIMRC=$(HOME)/.vimrc
VIMPKG=$(VIMHOME)/pack/3rdparty

all: install

.PHONY: install
install:
	@echo "Copying vimrc"
	mkdir -p $(VIMHOME)
	cp vimrc $(VIMRC)
	@echo "Install ftplugin"
	cp -pr ./ftplugin  $(VIMHOME)

.PHONY: plugins
plugins:
	@echo "Install plugins"
	mkdir -p $(VIMPKG)/start
	cp -r ./vendor/* $(VIMPKG)/start

.PHONY: uninstall
uninstall:
	rm -rf $(VIMHOME)
	rm -rf $(VIMRC)

.PHONY: vendor
vendor:
	@./tools/vendor

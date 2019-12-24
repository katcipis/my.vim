VIMHOME=$(HOME)/.vim
VIMRC=$(HOME)/.vimrc
VIMPKG=$(VIMHOME)/pack/3rdparty

all: config

.PHONY: config
config:
	@echo "Copying vimrc"
	mkdir -p $(VIMHOME)
	cp vimrc $(VIMRC)
	@echo "Install ftplugin"
	cp -pr ./ftplugin  $(VIMHOME)

.PHONY: plugins
plugins:
	@echo "Install plugins"
	rm -rf $(VIMPKG)
	mkdir -p $(VIMPKG)/start
	cp -r ./vendor/* $(VIMPKG)/start

.PHONY: uninstall
uninstall:
	rm -rf $(VIMHOME)
	rm -rf $(VIMRC)

.PHONY: vendor
vendor:
	@./tools/vendor

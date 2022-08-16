VIMHOME=$(HOME)/.vim
VIMRC=$(HOME)/.vimrc
VIMPKG=$(VIMHOME)/pack/3rdparty

all: plugins config

.PHONY: config
config:
	@echo "Copying vimrc"
	mkdir -p $(VIMHOME)
	cp vimrc $(VIMRC)
	@echo "Install ftplugin"
	cp -pr ./ftplugin $(VIMHOME)
	cp -pr ./ftdetect $(VIMHOME)

.PHONY: plugins
plugins:
	@echo "Install plugins"
	rm -rf $(VIMPKG)
	mkdir -p $(VIMPKG)/start
	cp -r ./vendor/* $(VIMPKG)/start
	@vim +GoUpdateBinaries +qall

.PHONY: uninstall
uninstall:
	rm -rf $(VIMHOME)
	rm -rf $(VIMRC)

.PHONY: vendor
vendor:
	@./tools/vendor

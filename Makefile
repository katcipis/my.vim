NEOVIM_HOME=$(HOME)/.config/nvim
NEOVIM_RC=$(NEOVIM_HOME)/init.vim
NEOVIM_PLUGIN=$(HOME)/.local/share/nvim/site/pack/plugins/start
NEOVIM_FTPLUGIN=$(HOME)/.local/share/nvim/site/ftplugin

all: config plugins

.PHONY: config
config:
	@echo "Copying vimrc"
	mkdir -p $(NEOVIM_HOME)
	cp init.vim $(NEOVIM_RC)
	@echo "Install ftplugin"
	mkdir -p $(NEOVIM_FTPLUGIN)
	cp ./ftplugin/* $(NEOVIM_FTPLUGIN)

.PHONY: plugins
plugins:
	@echo "Install plugins"
	rm -rf $(NEOVIM_PLUGIN)
	mkdir -p $(NEOVIM_PLUGIN)
	cp -r ./vendor/* $(NEOVIM_PLUGIN)
	@nvim +GoUpdateBinaries +qall

.PHONY: uninstall
uninstall:
	rm -rf $(NEOVIM_HOME)
	rm -rf $(NEOVIM_PLUGIN)
	rm -rf $(NEOVIM_FTPLUGIN)

.PHONY: vendor
vendor:
	@./tools/vendor

NEOVIM_HOME=$(HOME)/.config/nvim

all: install

.PHONY: install
install: cleanup bootstrap
	mkdir -p $(NEOVIM_HOME)
	cp init.lua $(NEOVIM_HOME)
	cp -r lua $(NEOVIM_HOME)
	nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
	cp -r after $(NEOVIM_HOME)
	cp -r ftplugin $(NEOVIM_HOME)
	go install golang.org/x/tools/cmd/goimports@v0.18.0
	
.PHONY: config
config:
	cp init.lua $(NEOVIM_HOME)
	cp -r lua $(NEOVIM_HOME)
	cp -r after $(NEOVIM_HOME)
	cp -r ftplugin $(NEOVIM_HOME)

.PHONY: cleanup
cleanup:
	rm -rf $(NEOVIM_HOME)
	rm -rf $(HOME)/.local/share/nvim

.PHONY: bootstrap
bootstrap:
	git clone --depth 1 https://github.com/wbthomason/packer.nvim \
 		$(HOME)/.local/share/nvim/site/pack/packer/start/packer.nvim


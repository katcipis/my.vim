NEOVIM_HOME=$(HOME)/.config/nvim

all: install

.PHONY: install
install:
	rm -rf $(NEOVIM_HOME)
	mkdir -p $(NEOVIM_HOME)
	cp init.lua $(NEOVIM_HOME)
	cp -r lua $(NEOVIM_HOME)
	cp -r after $(NEOVIM_HOME)
	nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

.PHONY: cleanup
cleanup:
	rm -rf $(NEOVIM_HOME)
	rm -rf $(HOME)/.local/share/nvim

.PHONY: bootstrap
bootstrap:
	git clone --depth 1 https://github.com/wbthomason/packer.nvim \
 		$(HOME)/.local/share/nvim/site/pack/packer/start/packer.nvim


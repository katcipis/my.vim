NEOVIM_HOME=$(HOME)/.config/nvim

all: install

.PHONY: install
install:
	rm -rf $(NEOVIM_HOME)
	mkdir -p $(NEOVIM_HOME)
	cp init.lua $(NEOVIM_HOME)
	cp -r lua $(NEOVIM_HOME)
	cp -r after $(NEOVIM_HOME)

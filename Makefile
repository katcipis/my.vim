PATHOGEN_BUNDLE_DIR=$(HOME)/.vim/bundle
VIM_AUTOLOAD=$(HOME)/.vim/autoload

make all: install-plugins

install: 
	echo "Copying vimrc"
	cp vimrc $(HOME)/.vimrc
	rm -rf $(HOME)/.vim
	cp -pr vim $(HOME)/.vim

install-plugins: install
	echo "Installing Pathogen"
	mkdir -p $(VIM_AUTOLOAD)
	wget -O $(VIM_AUTOLOAD)/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
	echo "Installing plugins"
	./install-plugin.sh tabular https://github.com/godlygeek/tabular.git $(PATHOGEN_BUNDLE_DIR)/tabular
	./install-plugin.sh nerd-tree https://github.com/scrooloose/nerdtree.git $(PATHOGEN_BUNDLE_DIR)/nerd-tree
	./install-plugin.sh syntastic https://github.com/scrooloose/syntastic.git $(PATHOGEN_BUNDLE_DIR)/syntastic
	./install-plugin.sh nerdcommenter https://github.com/scrooloose/nerdcommenter.git $(PATHOGEN_BUNDLE_DIR)/nerd-commenter
	./install-plugin.sh fugitive https://github.com/tpope/vim-fugitive.git $(PATHOGEN_BUNDLE_DIR)/fugitive
	./install-plugin.sh airline https://github.com/bling/vim-airline $(PATHOGEN_BUNDLE_DIR)/airline
	./install-plugin.sh vim-markdown https://github.com/tpope/vim-markdown $(PATHOGEN_BUNDLE_DIR)/vim-markdown
	./install-plugin.sh wildfire https://github.com/gcmt/wildfire.vim $(PATHOGEN_BUNDLE_DIR)/wildfire
	./install-plugin.sh vim-colorschemes https://github.com/flazz/vim-colorschemes $(PATHOGEN_BUNDLE_DIR)/vim-colorschemes
	./install-plugin.sh latex-box https://github.com/LaTeX-Box-Team/LaTeX-Box $(PATHOGEN_BUNDLE_DIR)/latex-box
	./install-plugin.sh vim-node https://github.com/moll/vim-node $(PATHOGEN_BUNDLE_DIR)/vim-node
	./install-plugin.sh vim-javascript-syntax https://github.com/jelera/vim-javascript-syntax $(PATHOGEN_BUNDLE_DIR)/vim-javascript-syntax
	./install-plugin.sh JavaScript-Indent https://github.com/vim-scripts/JavaScript-Indent $(PATHOGEN_BUNDLE_DIR)/JavaScript-Indent
	./install-plugin.sh vim-scala https://github.com/derekwyatt/vim-scala $(PATHOGEN_BUNDLE_DIR)/vim-scala
	./install-plugin.sh vim-go https://github.com/fatih/vim-go.git $(PATHOGEN_BUNDLE_DIR)/vim-go

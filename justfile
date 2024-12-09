vimhome := "$HOME/.vim"
vimrc := "$HOME/.vimrc"
vimpkg := vimhome + "/pack/3rdparty"

vendor:
    ./tools/vendor

plugins:
	@echo "Install plugins"
	rm -rf {{vimpkg}}
	mkdir -p {{vimpkg}}/start
	cp -r ./vendor/* {{vimpkg}}/start
	@vim +GoUpdateBinaries +qall

uninstall:
	rm -rf {{vimhome}}
	rm -rf {{vimrc}}

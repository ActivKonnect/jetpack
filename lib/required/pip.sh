# vim: fileencoding=utf-8 tw=100 noexpandtab ts=8 sw=8 ft=sh :

function install_pip {
	shout "Installing Pip dependencies"
	pip install -r "$BUILD_DIR/requirements.txt" | indent
}

# vim: fileencoding=utf-8 tw=100 noexpandtab ts=8 sw=8 ft=sh :

function install_npm-global {
	shout "Installing a global NPM package"

	npm -g install "$1" | indent
}

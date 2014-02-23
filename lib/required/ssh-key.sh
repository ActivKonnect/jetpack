# vim: fileencoding=utf-8 tw=100 noexpandtab ts=8 sw=8 ft=sh :

function install_ssh-key {
	shout "Installing SSH key \"$1\""

	mkdir -p $HOME/.ssh

	cp "$1" "$HOME/.ssh/id_rsa"
	cp "$1".pub "$HOME/.ssh/id_rsa.pub"
}

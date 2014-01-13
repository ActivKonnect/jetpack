# vim: fileencoding=utf-8 tw=100 noexpandtab ts=8 sw=8 ft=sh :

function install_prepack {
	shout "Installing a pre-pack"

	echo -n "Decompressing..." | indent
	curl -s "$1" | tar -x -z -C $APP_DIR && echo " ok"

	export PATH="$APP_DIR/.heroku/bin:$PATH"
}

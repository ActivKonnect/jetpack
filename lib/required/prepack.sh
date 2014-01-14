# vim: fileencoding=utf-8 tw=100 noexpandtab ts=8 sw=8 ft=sh :

function install_prepack {
	shout "Installing a pre-pack"

	echo -n "Decompressing..." | indent
	curl -s "$1" | tar -x -z -C $BUILD_DIR && echo " ok"

	echo "Moving stuff around" | indent
	mkdir -p "$APP_DIR/.jetpack"
	cp_contents "$BUILD_DIR/.jetpack" "$APP_DIR/.jetpack"
}
